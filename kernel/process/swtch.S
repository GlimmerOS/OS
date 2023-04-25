# Context switch
# 
# Save current registers in old. Load from new.	
#define regaddr(x) a0 + x * 4
.globl swtch
swtch:
        sd ra, 40(a0)
        sd sp, 48(a0)
        sd s0, 56(a0)
        sd s1, 64(a0)
        sd s2, 72(a0)
        sd s3, 80(a0)
        sd s4, 88(a0)
        sd s5, 96(a0)
        sd s6, 104(a0)
        sd s7, 112(a0)
        sd s8, 120(a0)
        sd s9, 128(a0)
        sd s10, 136(a0)
        sd s11, 144(a0)

        ld ra, 40(a0)
        ld sp, 48(a0)
        ld s0, 56(a0)
        ld s1, 64(a0)
        ld s2, 72(a0)
        ld s3, 80(a0)
        ld s4, 88(a0)
        ld s5, 96(a0)
        ld s6, 104(a0)
        ld s7, 112(a0)
        ld s8, 120(a0)
        ld s9, 128(a0)
        ld s10, 136(a0)
        ld s11, 144(a0)
        
        ret

	
