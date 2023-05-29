#ifndef __FILE_H
#define __FILE_H

#include <stdint.h>


#define O_RDONLY  0x000
#define O_WRONLY  0x001
#define O_RDWR    0x002
#define O_APPEND  0x004
// #define O_CREATE  0x200
#define O_CREATE  0x40
#define O_TRUNC   0x400

#define O_DIRECTORY 0x0200000

#define NDEV 4
#define NFILE 64 //Number of fd that all process can open
typedef struct file {
    enum { FD_NONE, FD_PIPE, FD_ENTRY, FD_DEVICE } type;
    int ref;  // reference count
    char readable;
    char writable;
    struct pipe* pipe;  // FD_PIPE
    struct dirent* ep;
    uint32_t off;     // FD_ENTRY
    short major;  // FD_DEVICE
} file;

#define major(dev) ((dev) >> 16 & 0xFFFF)
#define minor(dev) ((dev)&0xFFFF)
#define mkdev(m, n) ((uint)((m) << 16 | (n)))

// map major device number to device functions.
struct devsw {
    int (*read)(int isUser, uint64_t dst, uint64_t start, uint64_t len);
    int (*write)(int isUser, uint64_t src, uint64_t start, uint64_t len);
};

extern struct devsw devsw[];

#define DEV_SD 0
#define DEV_CONSOLE 1

struct file* filealloc(void);
void fileclose(struct file*);
struct file* filedup(struct file*);
void fileinit(void);
int fileread(struct file*, uint64_t, int n);
int filestat(struct file*, uint64_t addr);
int filewrite(struct file*, uint64_t, int n);
int dirnext(struct file* f, uint64_t addr);

/* these are defined by POSIX and also present in glibc's dirent.h */
#define DT_UNKNOWN	0
#define DT_FIFO		1
#define DT_CHR		2
#define DT_DIR		4
#define DT_BLK		6
#define DT_REG		8
#define DT_LNK		10
#define DT_SOCK		12
#define DT_WHT		14

#endif