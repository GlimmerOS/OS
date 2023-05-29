// #include "fs/fat.h"
// #include "fs/bio.h"
// #include "debug.h"
// static int reloc_clus(FileSystem *fs, struct dirent *entry, uint32_t off, int alloc)
// {
//     int clus_num = off / fs->superBlock.byts_per_clus;
//     while (clus_num > entry->clus_cnt)
//     {
//         int clus = read_fat(fs, entry->cur_clus);
//         if (clus >= FAT32_EOC)
//         {
//             if (alloc)
//             {
//                 clus = alloc_clus(fs, entry->dev);
//                 write_fat(fs, entry->cur_clus, clus);
//             }
//             else
//             {
//                 entry->cur_clus = entry->first_clus;
//                 entry->clus_cnt = 0;
//                 return -1;
//             }
//         }
//         entry->cur_clus = clus;
//         entry->clus_cnt++;
//     }
//     if (clus_num < entry->clus_cnt)
//     {
//         entry->cur_clus = entry->first_clus;
//         entry->clus_cnt = 0;
//         while (entry->clus_cnt < clus_num)
//         {
//             entry->cur_clus = read_fat(fs, entry->cur_clus);
//             Assert(entry->cur_clus < FAT32_EOC,"reloc_clus");
//             entry->clus_cnt++;
//         }
//     }
//     return off % fs->superBlock.byts_per_clus;
// }
// int getBlockNumber(struct dirent *entry, int dataBlockNum)
// {
//     int offset = (dataBlockNum << 9);
//     if (offset > entry->file_size)
//     {
//         return -1;
//     }

//     FileSystem *fs = entry->fileSystem;
//     reloc_clus(fs, entry, offset, 0);

//     return first_sec_of_clus(fs, entry->cur_clus) + offset % fs->superBlock.byts_per_clus / fs->superBlock.bpb.byts_per_sec;
// }