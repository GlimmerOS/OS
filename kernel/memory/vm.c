#include "kernel.h"
#include "debug.h"

/// 内核页表
static pagetable_t kernel_pagetable;
/// 内核代码结束位置
extern char endtext[];
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

  pagetable[VA_VPN(va, 0)] = SPTE_FLAGS(PA2PTE(pa), flags);

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

  // map data part
  for (; kaddr < PHYSIC_MEM_TOP; kaddr += PAGE_SIZE) {
    va_map_pa(kernel_pagetable, kaddr, kaddr, MPTE_FLAG(R) | MPTE_FLAG(W));
  }

  // map trampoline
  va_map_pa(kernel_pagetable, TRAMPOLINE, (addr_t)trampoline, MPTE_FLAG(R) | MPTE_FLAG(X));

  Log("Initialized kernel pagetable");

  Log("Set satp for main hart");
  FENCE_VMA;
  WRITE_CSR(s, atp, SET_SATP((uint64_t)kernel_pagetable));
  FENCE_VMA;
  Log("Finish set satp");
}
