#include <defs.h>
#include <fs.h>
#include <mmu.h>
#include <journal.h>
#include <sleeplock.h>

struct {
  TransactionIdType transaction_id;
  size_t log_block_offset;
  struct sleeplock lock;
} txinfo;

extern struct superblock sb;

void journal_init()
{
  initsleeplock(&txinfo.lock, "journal");
}

void begin_trans()
{
  acquiresleep(&txinfo.lock);

  struct journal_begin record = {
    .type = JOURNAL_BEGIN,
    .transaction_id = txinfo.transaction_id,
    .committed = false,
    .executed = false
  };

  // begin record always goes at position 0 in the log.
  struct buf* buf = bread(ROOTDEV, sb.logstart);
  memmove(buf->data, &record, sizeof(record));
  bwrite(buf);
  brelse(buf);

  txinfo.log_block_offset = 1;
}

void append_log_block(void* record, size_t bytes)
{
  struct buf* buf = bread(ROOTDEV, sb.logstart + txinfo.log_block_offset);
  memmove(buf->data, record, bytes);
  bwrite(buf);
  brelse(buf);

  txinfo.log_block_offset++;
}

void log_write(struct buf* b)
{
  // Keep block cache entry from being evicted.
  b->flags |= B_DIRTY;

  struct journal_write record = {
    .type = JOURNAL_WRITE,
    .blockno = b->blockno
  };

  // Writes get logged as a pair of blocks: The metadata struct followed by the
  // payload.

  append_log_block(&record, sizeof record);
  append_log_block(b->data, sizeof b->data);
}

// Internal routine. Must call with lock held.
void __recover_trans()
{
  // First read the single begin record.

  struct buf* begin_buf = bread(ROOTDEV, sb.logstart);
  struct journal_begin* begin_record =
   (struct journal_begin*) begin_buf->data;
  TransactionIdType transaction_id = begin_record->transaction_id;

  if (begin_record->type != JOURNAL_BEGIN ||
     !begin_record->committed || begin_record->executed) {
    // Not a transaction that requires playback. We're done.
    brelse(begin_buf);
    return;
  }

  // Read the remainder of the log.

  uint8_t record_type = JOURNAL_BEGIN;
  uint8_t prev_record_type = JOURNAL_BEGIN;
  uint logblockno = 1;

  while (record_type != JOURNAL_COMMIT) {
    assert(logblockno < LOGSIZE);
    struct buf* buf = bread(ROOTDEV, sb.logstart + logblockno);
    record_type = *(uint8_t*) buf->data;

    if (record_type == JOURNAL_WRITE) {
      assert(JOURNAL_BEGIN == prev_record_type
          || JOURNAL_WRITE == prev_record_type);
      // Writes have a metadata block followed by a payload block. Save the
      // write record and advance `buf` to read the payload.

      struct journal_write write_record;
      memmove(&write_record, buf->data, sizeof(struct journal_write));

      brelse(buf);
      logblockno++;
      assert(logblockno < LOGSIZE);
      buf = bread(ROOTDEV, sb.logstart + logblockno);

      // Apply the write.
      struct buf* writebuf = bread(ROOTDEV, write_record.blockno);
      memmove(writebuf->data, buf->data, sizeof(writebuf->data));
      bwrite(writebuf);
      brelse(writebuf);

    } else if (record_type == JOURNAL_COMMIT) {
      assert(JOURNAL_WRITE == prev_record_type);
      struct journal_commit* commit_record =
       (struct journal_commit*) buf->data;
      assert(commit_record->transaction_id == transaction_id);

    } else {
      cprintf("Encountered invalid journal log type=0x%x.\n", record_type);
      assert(false);
    }

    brelse(buf);
    prev_record_type = record_type;
    logblockno++;
  }

  // Mark the begin record as executed.
  begin_record->executed = true;
  bwrite(begin_buf);
  brelse(begin_buf);
}

void commit_trans()
{
  struct journal_commit record = {
    .type = JOURNAL_COMMIT,
    .transaction_id = txinfo.transaction_id
  };

  append_log_block(&record, sizeof record);
  txinfo.transaction_id++;

  // Mark the begin record as committed.
  struct buf* buf = bread(ROOTDEV, sb.logstart);
  struct journal_begin* begin_record = (struct journal_begin*) buf->data;
  begin_record->committed = true;
  bwrite(buf);
  brelse(buf);

  // Replay the transaction.
  __recover_trans();

  releasesleep(&txinfo.lock);
}

void recover_trans()
{
  acquiresleep(&txinfo.lock);
  __recover_trans();
  releasesleep(&txinfo.lock);
}
