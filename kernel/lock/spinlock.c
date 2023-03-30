#include "lock/spinlock.h"

//生成一个自旋锁
void init_lock(struct spinlock *lock, char *name)
{
    lock->cpu = 0;
    lock->locked = 0;
    lock->name = name;
};

//获取锁
void acquire(struct spinlock *lock) {
    push_off();
    if (holding(lock));
        //panic()       如果已经持有锁再获取则报错
    
    /*
    * 这个__syn_lock_test_and_set 函数实际上是RISC-V 中的一次原子操作
    * 具体是 a5 = arg2; s1 = arg1; amoswap.w.aq a5, a5, (s1)
    * 而amoswap.w.aq rd, rs1, (rs1) 具体操作则是将rs1指向地址上的值填入rd，再将rs1的值填入rs1指向地址。此过程其他cpu无法访问rs2。
    * 具体的思路：如果该锁被获得，locked置1,则执行该函数返回的也是1，继续循环
    */
    while (__sync_lock_test_and_set(&lock->locked, 1) != 0);

    //即fence 一次
    __sync_synchronize();
    
    lock->cpu = mycpu();
}

//释放锁
void release(struct spinlock *lock) {
    if (!holding(lock))
    {
        //panic("release");
    }
    lock->cpu = 0;

    //fence 一次
    __sync_synchronize();

    __sync_lock_release(&lock->locked);

    pop_off();
}

//判断当前线程是否持有这个锁
int holding(struct spinlock *lock) {
    int result;
    result = (lock->locked && lock->cpu == mycpu());
    return result;
}

//关闭中断并且标记初次操作前的开关中断情况，便于恢复；允许多次调用来嵌套
void push_off(void) {
    int old = intr_get(); //获取当前S-mode中断禁止位
    intr_off(); //关中断
    if (mycpu()->noff == 0)
    {
        mycpu()->intena = old; //标记在第一次push_off前是否为开启中断状态，便于之后恢复
    }
    mycpu()->noff += 1;
}

//push_off的对称函数，将push_off的嵌套层数减一，到无嵌套时则恢复原状态
void pop_off(void) {
    struct cpu *cpu_ptr = mycpu();
    if (intr_get())
    {
        // panic()
        /* 若此时开中断,打印错误 */
    }
    if (cpu_ptr->noff < 1)
    {
        // panic()
        /* 没有pop_off嵌套过，也是异常操作，打印错误 */
    }
    cpu_ptr->noff -= 1;
    if (cpu_ptr == 0 && cpu_ptr->intena)
    {
        intr_on();
        /* 若是push_off引起的禁止中断，则将中断开启 */
    }
    
}