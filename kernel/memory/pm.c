#include "memory/pm.h"
#include "memory/memory.h"
#include "stdint.h"
#include "lib/string.h"
#include "debug.h"

extern char end[];

// 物理页结构
struct Page {
  struct Page *next;
};

static struct Page *_free;

/*
 * 初始化可以使用的物理页面链表
 */
static void init_free_list() {
  void* satp = end;

  for (; (uint64_t)satp < PHYSIC_MEM_TOP; satp += PAGE_SIZE) {
    free_physic_page(satp);
  }
}

/*
 * 物理内存初始化
 */
void init_physic_memory(){
  Log("Initializing physical memory");
  init_free_list();
  Log("Initialized physical memory");
}

/*
 * 分配一个物理页面
 * 分配成功返回一个void类型指针
 * 分配失败返回为0
 */
void* alloc_physic_page() {
  struct Page *page;

  page = _free;

  if (page != NULL) {
    _free = _free->next;
  }

  if (page) {
    memset(page, 0, PAGE_SIZE);
  }

  return page;
}

/*
 * @addr: 需要释放页面的起始地址
 * 释放成功后返回
 */
void free_physic_page(void* addr) {
  Assert(addr != NULL, "The page to be freed is null!");
  Assert(addr >= (void*)end && (uint64_t)addr < PHYSIC_MEM_TOP, "Invalid page address to be freed!");
  Assert((uint64_t)addr == PAGE_START((uint64_t)addr), "The page to be freed is not aligned!");

  memset(addr, 0xff, PAGE_SIZE);
  struct Page *page = addr;

  page->next = _free;
  _free = page;
}
