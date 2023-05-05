#include "kernel.h"
#include "debug.h"
#include "lib/string.h"
/// 内核页表
static pagetable_t kernel_pagetable;
/// 内核代码结束位置
extern char endtext[];
/// 内核只读数据结束位置
extern char endrodata[];
/// trampoline的地址
extern char trampoline[];

/**
 * 分配页表
 *
 * @return 分配成功返回页表地址，失败返回0
 */
static pagetable_t alloc_pagetable() {
  return alloc_physic_page();
}

/**
 * 建立虚拟地址到物理地址的映射关系
 *
 * @param pagetable 页表地址
 * @param va 虚拟地址, 地址必须页对齐
 * @param pa 物理地址, 地址必须页对齐
 * @param flags 标志位, 低9位有效
 *
 * @return 成功返回1，失败返回0（包括页表不存在）
 */
word_t va_map_pa(pagetable_t pagetable, addr_t va, addr_t pa, word_t flags) {
  Assert(va == PAGE_START(va), "va not page align");
  Assert(pa == PAGE_START(pa), "pa not page align");

  for (int i = 2; i > 0; --i) {
    pte_t *pte = &pagetable[VA_VPN(va, i)];

    if (!GPTE_FLAG(*pte, V)) {
      // PTE无效
      pagetable = alloc_pagetable();
      
      if (pagetable == NULL) {
        Log("va_map_pa alloc pagetable failed!");
        return 0;
      }

      *pte = SPTE_FLAG(PA2PTE((addr_t)pagetable), V);
    } else {
      // PTE有效
      pagetable = (pagetable_t)PTE2PA(*pte);
    }
  }

  pagetable[VA_VPN(va, 0)] = SPTE_FLAGS(PA2PTE(pa), flags | MPTE_FLAG(V));

  return 1;
}

/**
 * 解除虚拟地址到物理地址的映射关系
 * 不会释放物理空间
 *
 * @param pagetable 页表地址
 * @param va 虚拟地址, 地址必须页对齐
 *
 * @return 成功返回1, 失败返回0
 */
word_t va_unmap_pa(pagetable_t pagetable, addr_t va) {
  Assert(va == PAGE_START(va), "va not page align");

  for (int i = 2; i > 0; --i) {
    pte_t *pte = &pagetable[VA_VPN(va, i)];

    if (!GPTE_FLAG(*pte, V)) {
      Log("va_unmap_pa va not map to pa");
      return 0;
    }

    pagetable = (pagetable_t)PTE2PA(*pte);
  }

  pagetable[VA_VPN(va, 0)] = 0;

  return 1;
}

/**
 * 初始化内核页表
 *
 * @return 分配成功且正常建立映射关系后正常返回
 */
void kernel_pagetable_init() {
  Log("Initializing kernel pagetable");

  kernel_pagetable = alloc_physic_page();
  Assert(kernel_pagetable != NULL, "alloc kernel pagetable failed!");

  // map text part
  addr_t kaddr = KERNEL_BASE;
  for (; kaddr < (addr_t)endtext; kaddr += PAGE_SIZE) {
    va_map_pa(kernel_pagetable, kaddr, kaddr, MPTE_FLAG(R) | MPTE_FLAG(X));
  }

  // map rodata part
  for (; kaddr < (addr_t)endrodata; kaddr += PAGE_SIZE) {
    va_map_pa(kernel_pagetable, kaddr, kaddr, MPTE_FLAG(R));
  }

  // map data part
  for (; kaddr < PHYSIC_MEM_TOP; kaddr += PAGE_SIZE) {
    va_map_pa(kernel_pagetable, kaddr, kaddr, MPTE_FLAG(R) | MPTE_FLAG(W));
  }

  // map trampoline
  va_map_pa(kernel_pagetable, TRAMPOLINE, (addr_t)trampoline, MPTE_FLAG(R) | MPTE_FLAG(X));

  for (int i = 0; i < PCB_NUM; ++i) {
    uint64_t pa = (uint64_t)alloc_physic_page();
    Assert(pa != 0, "alloc process stack page failed!");

    uint64_t va = Process_Stack(i);
    
    int ret = va_map_pa(kernel_pagetable, va, pa, MPTE_FLAG(R) | MPTE_FLAG(W));
    Assert(ret != 0, "map process stack page failed!");
  }

  Log("Initialized kernel pagetable");

  Log("Set satp for main hart");
  FENCE_VMA;
  WRITE_CSR(s, atp, SET_SATP((uint64_t)kernel_pagetable));
  FENCE_VMA;
  Log("Finish set satp");
}

/*
 * 释放页表操作
 * 如果下一级是一个有效页表，则去遍历这个页表进行释放
 *
 * @param pagetable 页表起始地址
 *
 * @return 无返回
 */
void free_pagetable(pagetable_t pagetable) {
   for (int i = 0; i < NR_PTE; ++i) {
     pte_t pte = pagetable[i];

     if (IS_LEAF(pte)) {
       // is a leaf pte and will get a not pagetable block
       continue;
     }
    
     if (GPTE_FLAG(pte, V)) {
       // not a leaf but is valid
       free_pagetable((pagetable_t)PTE2PA(pte));
       pagetable[i] = 0;
     }
   }

   free_physic_page(pagetable);
}
void userFstCodeLoad(pagetable_t pagetable, uint8_t *src, uint32_t sz)
{
  char *mem;
   mem = alloc_physic_page();
  memset(mem, 0, PAGE_SIZE);
  va_map_pa(pagetable, 0, (uint64_t)mem, MPTE_FLAG(W)|MPTE_FLAG(R)|MPTE_FLAG(X)|MPTE_FLAG(U));
  memmove(mem,src, sz);
}
int
copy_in_str_u2k(pagetable_t pagetable, char *dst, uint64_t srcva, uint64_t max)
{
  uint64_t n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    va0 = PAGE_START(srcva);
    //
     for (int i = 2; i > 0; --i) {
    pte_t *pte = &pagetable[VA_VPN(srcva, i)];
    pagetable = (pagetable_t)PTE2PA(*pte);
  }
  pte_t *pte =&pagetable[VA_VPN(srcva,0)];
      pa0=PTE2PA(*pte);
    //
    if(pa0 == 0)
      return -1;
    n = PAGE_SIZE - (srcva - va0);
    if(n > max)
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
        got_null = 1;
        break;
      } else {
        *dst = *p;
      }
      --n;
      --max;
      p++;
      dst++;
    }

    srcva = va0 + PAGE_SIZE;
  }
  if(got_null){
    return 0;
  } else {
    return -1;
  }
}