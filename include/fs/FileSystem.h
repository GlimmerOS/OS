#ifndef _FILE_SYSTEM_H_
#define _FILE_SYSTEM_H_
#include <stdint.h>
#include "fs/bio.h"
#include "fs/fat.h"
#include "fs/file.h"
#define MAX_NAME_LENGTH 64

struct buf;
typedef struct FileSystem {
    int valid;
    char name[MAX_NAME_LENGTH];
    struct superblock superBlock;
    struct dirent root;
    struct file *image;
    FileSystem *next;
    int deviceNumber;
    struct buf* (*read)(struct FileSystem *fs, uint64_t blockNum);
} FileSystem;

typedef struct DirentCache {
    struct spinlock lock;
    struct dirent entries[ENTRY_CACHE_NUM];
} DirentCache;

int fsAlloc(FileSystem **fs);
int fatInit(FileSystem *fs);
void initDirentCache();

#endif
