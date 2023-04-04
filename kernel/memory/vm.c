#include "memory/pm.h"
#include "memory/vm.h"
#include "debug.h"

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
 * @return 成功返回1，失败返回0
 */
word_t va_map_pa(pagetable_t pagetable, word_t va, word_t pa, word_t flags) {
  Assert(va == PAGE_START(va), "va not page align");
  Assert(pa == PAGE_START(pa), "pa not page align");

  for (int i = 2; i > 0; --i) {
    pte_t pte = pagetable[VA_VPN(va, i)];

    if (!GPTE_FLAG(pte, V)) {
      // PTE无效
      pagetable = alloc_pagetable();
      
      if (pagetable == NULL) {
        return 0;
      }
    } else {
      // PTE有效
      pagetable = (pagetable_t)PTE_PPN(pte);
    }
  }

  pagetable[VA_VPN(va, 0)] = SPTE_FLAGS(PA_PPN(pa), flags);

  return 1;
}
