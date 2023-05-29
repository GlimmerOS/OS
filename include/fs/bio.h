#ifndef _BIO_H_
#define _BIO_H_

#include "lock/spinlock.h"
#include "fs/file.h"
#include <stdint.h>
#define BSIZE 512
#define NBUF 128

typedef struct FileSystem FileSystem;
struct dirent;
struct buf {
    int valid;  // has data been read from disk?
    int disk;   // does disk "own" buf?
    uint32_t dev;
    uint32_t blockno;
    // struct Sleeplock lock;
    struct spinlock lock;
    
    uint32_t refcnt;
    struct buf* prev;  // LRU cache list
    struct buf* next;
    uint16_t data[BSIZE];
};

void binit(void);

struct buf* mountBlockRead(FileSystem* fs, uint64_t blockNum);
struct buf* blockRead(FileSystem* fs, uint64_t blockNum);

struct buf* bread(uint32_t dev, uint32_t blockno);
void bwrite(struct buf* b);
void brelse(struct buf* b);
void bpin(struct buf* b);
void bunpin(struct buf* b);

#endif