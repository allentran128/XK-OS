#pragma once

#include <fs.h>
#include <buf.h>

enum {
   JOURNAL_BEGIN,
   JOURNAL_WRITE,
   JOURNAL_COMMIT
};

typedef uint16_t TransactionIdType;

struct journal_begin {
   uint8_t type;
   TransactionIdType transaction_id;
   bool committed;
   bool executed;
};

struct journal_write {
   uint8_t type;
   uint blockno;
};

struct journal_commit {
   uint8_t type;
   TransactionIdType transaction_id;
};
