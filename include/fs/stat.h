#ifndef __STAT_H
#define __STAT_H

#include <stdint.h>
#define T_DIR 1     // Directory
#define T_FILE 2    // File
#define T_DEVICE 3  // Device
#define T_LINK 4

#define STAT_MAX_NAME 32

// struct stat {
//     char name[STAT_MAX_NAME + 1];
//     int dev;      // File system's disk device
//     short type;   // Type of file
//     uint64_t size;  // Size of file in bytes
// };

struct stat {
    uint64_t st_dev;
    uint64_t st_ino;
    uint32_t st_mode;
    uint32_t st_nlink;
    uint32_t st_uid;
    uint32_t st_gid;
    uint64_t st_rdev;
    unsigned long __pad;
    long int st_size;
    uint32_t st_blksize;
    int __pad2;
    uint64_t st_blocks;
    long st_atime_sec;
    long st_atime_nsec;
    long st_mtime_sec;
    long st_mtime_nsec;
    long st_ctime_sec;
    long st_ctime_nsec;
    unsigned __unused[2];
    // char name[STAT_MAX_NAME + 1]; //[ADD] file name
    // short type;   // Type of file
};

#endif