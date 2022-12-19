.global _boot 
.text 

main_counter:                    
    addi t1, zero, 0xff     # load t1 with 255 
    addi a0, zero, 0x0      # a0 = output
    addi a1, zero, 0x0      # a1 = 0 initially, a1 is the counter
iloop: 
    slli a1, a1, 1          # a1 is shifted left 
    addi a1, a1, 1          # increment a1 
    addi a0, a1, 0          # load a0 with a1
    jal ra, delay           # jump and link to subroutine 'delay'
mloop: 
    bne a1, t1, iloop       # if a1 = t1 = 255, branch to iloop
    jal ra, finish          # jump and link to subroutine 'finish'
delay: 
    addi t0, zero, 0x0      # load t0 with 0
    addi t2, zero, 100      # load t2 with 100
dloop: 
    addi t0, t0, 1          # increment t0 
    bne t0, t2, dloop       # if t0 = t2 = 100, branch to dloop
    jalr zero, ra, 0                # jump and link to subroutine 'mloop'
finish: 
    addi a0, zero, 0x0      # load a0 with 0
floop: 
    addi t3, zero, 0x3      # load t3 with 3
    bne t3, zero, floop     # ... else always branch to floop
    