
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
	
	 
prog:
	add s0, zero, zero #deikths pinaka
	add s1, zero, zero #krata to teleutaio tairiasto stoixeio

 
loop:    
    beq  s0, a1, exit # an ftasw sto telos tou pinaka go to label exit
    slli t0, s0, 2 # s0*4
    add  t0, t0, a0 # dieu8unsi tou trexontos stoixeiou 
    lw   t1, 0(t0) #fortwsh ths timhs tous stoixeiou sto t1
    beq  t1, a2, found # an to trexon stoixeio einai iso me a2 go to found label
    addi s0, s0, 1 # pane sto epomeno stoixeio 
    j    loop
exit:
	beq s1, zero, not_found # an dn brw kanena stoixeio go to not_found label
    add a0, s1, zero # move result to a0
	j done 
found:
    add s1, t0, zero # apo8hkeuw thns tou stoixeiou pou tairiazei sto s1
    addi s0, s0, 1 
	j loop 
	
not_found:
    addi a0, zero, 0    

done:
    addi a7, zero, 10 
    ecall
