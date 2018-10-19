.data
arreglo: .space 36
mError: .asciiz "El valor seleccionado no es válido"
Tragaperas: .asciiz "Tragaperas\n"
saltodelinea: .asciiz "\n"
PedirD: .asciiz "Favor ingrese dinero (en miles) para comenzar a jugar:  "
Selec: .asciiz "Seleccione:\n1 Jugar\n2 Retirarse\n"
Apuesta: .asciiz "Ingrese el valor a apostar:  " 
Ganador: .asciiz "Ganaste!!!!\n"
Boni: .asciiz "Has ganado una bonificación x"
ficacion: .asciiz " del valor apostado!\n"
Perdedor: .asciiz "Perdiste :c\n"

.text
la $a0,Tragaperas
addi $v0,$0,4
syscall

ingresarD:
	addi $s0,$0,0
	la $a0,PedirD
	addi $v0,$0,4
  	syscall
 	addi $v0,$0,5
  	syscall
  	beq $v0,0,ingresarD
  	addi $s0, $v0, 0

jugarORet:
  	la $a0,Selec
  	addi $v0,$0,4
  	syscall
  	addi $v0,$0,5
  	syscall
  	beq $v0,1,realizarA
  	beq $v0,2,ingresarD
  	la $a0,mError
  	addi $v0,$0,4
  	syscall
  	j jugarORet

realizarA:
  	la $a0,Apuesta
  	addi $v0,$0,4
  	syscall
  	addi $v0,$0,5
  	syscall
  	bgt $v0,$s0,realizarA
  	beq $v0,0,realizarA
  	addi $s1,$v0,0 #S1= A
  	sub $s0,$s0,$s1 #Dinero=Dinero-A

llenarM:
addi $t2,$0,0 # i
addi $t4,$0,0 # mem
llenarfilas:beq $t2,3,comparacion
	addi $t3,$0,0 # j
		llenarcol: beq $t3,3 fincol
		#addi $v0,$0,42
		#addi $a1,$0,10
		#syscall
		#add $t1,$a0,$0
		addi $t1,$0,3
		sw $t1,arreglo($t4)
		lw $t1,arreglo($t4)
		add $a0,$0,$t1
		addi $v0,$0,1
		syscall
		addi $t3,$t3,1
		addi $t4,$t4,4	
		j llenarcol
	fincol:
	la $a0,saltodelinea
	addi $v0,$0,4
	syscall
	addi $t2,$t2,1
	j llenarfilas

comparacion:
  addi $s2,$0,1 #s2=Bonificacion 
	lw $t0,arreglo($0)
	lw $t1,arreglo+8($0)
	lw $t2,arreglo+12($0)
	lw $t3,arreglo+16($0)
	lw $t4,arreglo+20($0)
	lw $t5,arreglo+24($0)
	lw $t6,arreglo+32($0)
	bne $t0,$t3,falsed1
	bne $t3,$t6,falsed1
	mul $s2,$s2,2
	falsed1:
	bne $t1,$t3,falsed2
	bne $t3,$t5,falsed2
	mul $s2,$s2,2
	falsed2:
	bne $t2,$t3,falsecen
	bne $t3,$t4,falsecen
	mul $s2,$s2,3
	falsecen:
  bne $s2,1,win
	la $a0,Perdedor 
	addi $v0,$0,4
	syscall
	bne $s0,0,jugarORet
	j ingresarD

win: 
 	mul $s1,$s1,$s2 #A=A*Bonificacion
  	addi $a0,$s1,0
 	addi $v0,$0,1
	syscall
  	add $s0,$s0,$s1 #Dinero=Dinero+A
  	la $a0,Ganador
	addi $v0,$0,4
	syscall
  	la $a0,Boni
	addi $v0,$0,4
	syscall
 	addi $a0,$s2,0
 	addi $v0,$0,1
 	syscall
  	la $a0,ficacion
	addi $v0,$0,4
	syscall
  	j jugarORet

.end
