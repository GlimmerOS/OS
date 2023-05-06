# Context switch
# 
# Save current registers in old. Load from new.	

.globl swtch
swtch:
        sd ra, 8(a0)
        sd sp, 16(a0)
        sd s0, 64(a0)
        sd s1, 72(a0)
        sd s2, 144(a0)
        sd s3, 152(a0)
        sd s4, 160(a0)
        sd s5, 168(a0)
        sd s6, 176(a0)
        sd s7, 184(a0)
        sd s8, 192(a0)
        sd s9, 200(a0)
        sd s10, 208(a0)
        sd s11, 216(a0)

         ld ra, 8(a1)
        ld sp, 16(a1)
        ld s0, 64(a1)
        ld s1, 72(a1)
        ld s2, 144(a1)
        ld s3, 152(a1)
        ld s4, 160(a1)
        ld s5, 168(a1)
        ld s6, 176(a1)
        ld s7, 184(a1)
        ld s8, 192(a1)
        ld s9, 200(a1)
        ld s10, 208(a1)
        ld s11, 216(a1)
        
        ret

	
