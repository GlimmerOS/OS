#ifndef __FAT32_H
#define __FAT32_H

#include "lock/spinlock.h"
#include "fs/FileSystem.h"
#include <stdint.h>
#include "fs/stat.h"

#define ATTR_READ_ONLY 0x01
#define ATTR_HIDDEN 0x02
#define ATTR_SYSTEM 0x04
#define ATTR_VOLUME_ID 0x08
#define ATTR_DIRECTORY 0x10
#define ATTR_ARCHIVE 0x20
#define ATTR_LONG_NAME 0x0F
#define ATTR_LINK   0x40

#define LAST_LONG_ENTRY 0x40
#define FAT32_EOC 0x0ffffff8
#define EMPTY_ENTRY 0xe5
#define END_OF_ENTRY 0x00
#define CHAR_LONG_NAME 13
#define CHAR_SHORT_NAME 11

#define FAT32_MAX_FILENAME 255
#define FAT32_MAX_PATH 260
#define ENTRY_CACHE_NUM 50

typedef struct FileSystem FileSystem;
struct superblock {
    uint32_t first_data_sec;
    uint32_t data_sec_cnt;
    uint32_t data_clus_cnt;
    uint32_t byts_per_clus;

    struct {
        uint16_t byts_per_sec;
        uint8_t sec_per_clus;
        uint16_t rsvd_sec_cnt;
        uint8_t fat_cnt;   /* count of FAT regions */
        uint32_t hidd_sec; /* count of hidden sectors */
        uint32_t tot_sec;  /* total count of sectors including all regions */
        uint32_t fat_sz;   /* count of sectors for a FAT region */
        uint32_t root_clus;
    } bpb;
};

struct dirent {
    char filename[FAT32_MAX_FILENAME + 1];
    uint8_t attribute;
    // uint8_t   create_time_tenth;
    // uint16_t  create_time;
    // uint16_t  create_date;
    // uint16_t  last_access_date;
    uint32_t first_clus;
    // uint16_t  last_write_time;
    // uint16_t  last_write_date;
    uint32_t file_size;

    uint32_t cur_clus;
    uint32_t clus_cnt;

    uint8_t _nt_res;
    FileSystem *fileSystem;
    /* for OS */
    uint8_t dev;
    uint8_t dirty;
    short valid;
    FileSystem *head;
    int ref;
    uint32_t off;  // offset in the parent dir entry, for writing convenience
    struct dirent* parent;  // because FAT32 doesn't have such thing like inum,
                            // use this for cache trick
    // struct dirent* next;
    // struct dirent* prev;
    // struct Sleeplock lock;
    struct spinlock lock;
    
};

struct entry_cache {
    struct spinlock lock;
    struct dirent entries[ENTRY_CACHE_NUM];
};

struct linux_dirent64 {
    uint64_t d_ino;               /* 64-bit inode number */
    uint64_t d_off;               /* 64-bit offset to next structure */
    unsigned short d_reclen; /* Size of this dirent */
    unsigned char d_type;    /* File type */
    char d_name[];           /* Filename (null-terminated) */
};

int fat32_init(void);
struct dirent* dirlookup(struct dirent* entry, char* filename, uint32_t* poff);
char* formatname(char* name);
int getBlockNumber(struct dirent* entry, int dataBlockNum);
void emake(struct dirent* dp, struct dirent* ep, uint32_t off);
struct dirent* ealloc(struct dirent* dp, char* name, int attr);
struct dirent* edup(struct dirent* entry);
void eupdate(struct dirent* entry);
void etrunc(struct dirent* entry);
void eremove(struct dirent* entry);
void eput(struct dirent* entry);
void estat(struct dirent* ep, struct stat* st);
void elock(struct dirent* entry);
void eunlock(struct dirent* entry);
int enext(struct dirent* dp, struct dirent* ep, uint32_t off, int* count);
struct dirent* ename(int fd, char* path);
struct dirent* enameparent(int fd, char* path, char* name);
int eread(struct dirent* entry, int user_dst, uint64_t dst, uint32_t off, uint32_t n);
int ewrite(struct dirent* entry, int user_src, uint64_t src, uint32_t off, uint32_t n);
struct dirent* create(int fd, char* path, short type, int mode);
#endif