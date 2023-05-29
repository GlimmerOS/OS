#include "fs/bio.h"
#include "debug.h"
#include "fs/FileSystem.h"
struct {
    struct spinlock lock;
    struct buf buf[NBUF];

    // Linked list of all buffers, through prev/next.
    // Sorted by how recently the buffer was used.
    // head.next is most recent, head.prev is least.
    struct buf head;
} bcache;

void binit(void) {
    struct buf* b;

    init_lock(&bcache.lock, "bcache");

    // Create linked list of buffers
    bcache.head.prev = &bcache.head;
    bcache.head.next = &bcache.head;
    for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
        b->next = bcache.head.next;
        b->prev = &bcache.head;
        // initsleeplock(&b->lock, "buffer");
        init_lock(&b->lock,"buffer");
        bcache.head.next->prev = b;
        bcache.head.next = b;
    }
}

// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf* bget(int dev, uint32_t blockno) {
    struct buf* b;

    acquire(&bcache.lock);

    if (dev >= 0) {
        for (b = bcache.head.next; b != &bcache.head; b = b->next) {
            if (b->dev == dev && b->blockno == blockno) {
                b->refcnt++;
                release(&bcache.lock);
                // acquiresleep(&b->lock);
                acquire(&b->lock);
                return b;
            }
        }
    }
    // Is the block already cached?    

    // Not cached.
    // Recycle the least recently used (LRU) unused buffer.
    for (b = bcache.head.prev; b != &bcache.head; b = b->prev) {
        if (b->refcnt == 0) {
            b->dev = dev;
            b->blockno = blockno;
            b->valid = 0;
            b->refcnt = 1;
            release(&bcache.lock);
            // acquiresleep(&b->lock);
            acquire(&b->lock);
            return b;
        }
    }
    Assert(0,"bget: no buffers");
}

// struct buf* mountBlockRead(FileSystem* fs, uint64_t blockNum) {
//     struct file* file = fs->image;
//     if (file->type == FD_DEVICE) {
//         return bread(file->major, blockNum);
//     }
//     Assert(file->type == FD_ENTRY,"no ENTRY");
//     struct dirent *image = fs->image->ep;
//     FileSystem* parentFs = image->fileSystem;
//     int parentBlockNum = getBlockNumber(image, blockNum); 
//     if (parentBlockNum < 0) {
//         return 0;
//     }
//     return parentFs->read(parentFs, parentBlockNum);
// }

struct buf* blockRead(FileSystem* fs, uint64_t blockNum) {
    return bread(fs->deviceNumber, blockNum);
}

// Return a locked buf with the contents of the indicated block.
struct buf* bread(uint32_t dev, uint32_t blockno) {
    // static int cnt = 0;
    // printf("[Bread] %d\n", cnt++);
    struct buf* b;
    b = bget(dev, blockno);
    if (!b->valid) {
        // sdRead(b->data, b->blockno, 1);
        b->valid = 1;
    }
    return b;
}

// Write b's contents to disk.  Must be locked.
void bwrite(struct buf* b) {
    // if (!holdingsleep(&b->lock))
    //     Assert(0,"bwrite");
        Assert(holding(&b->lock),"bwrite");
    // sdWrite(b->data, b->blockno, 1);
}

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void brelse(struct buf* b) {
    // if (!holdingsleep(&b->lock))
    //     Assert(0,"brelse");
    Assert(holding(&b->lock),"brelse");

    // releasesleep(&b->lock);
    release(&b->lock);
    acquire(&bcache.lock);
    b->refcnt--;
    if (b->refcnt == 0) {
        // no one is waiting for it.
        b->next->prev = b->prev;
        b->prev->next = b->next;
        b->next = bcache.head.next;
        b->prev = &bcache.head;
        bcache.head.next->prev = b;
        bcache.head.next = b;
    }

    release(&bcache.lock);
}

void bpin(struct buf* b) {
    acquire(&bcache.lock);
    b->refcnt++;
    release(&bcache.lock);
}

void bunpin(struct buf* b) {
    acquire(&bcache.lock);
    b->refcnt--;
    release(&bcache.lock);
}
