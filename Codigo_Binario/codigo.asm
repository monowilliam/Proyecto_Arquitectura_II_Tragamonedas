ingresarD:
    addi $s0,$cero,0
    addi $t0,$cero,0
    ins $t0
    lm $t0,$t0,0
    beq $t0,$cero,0
    addi $s0, $t0,0
    addi $t0,$cero,0
    oss $t0
jugarORet:
    addi $t0,$cero,3
    ins $t0
    lm $t0,$t0,0
    addi $t1,$cero,1
    beq $t0,$t1,10 #Va a realizar apuesta
    beq $t0,$cero,0 #Vuelve a pedir el dinero para iniciar
realizarA:
    addi $t0,$cero,1
    ins $t0
    lm $t0,$t0,0
    bgt $t0,$s0,9 #Vuelve a pedir la apuesta porque el numero ingresado es mayoral dinero
    beq $t0,$cero,9 #Vuelve a pedir la apuesta porque el numero ingresado es cero.
    sm $t0,$cero,1
    addi $s1,$t0,0 #S1= A
    addi $t1,$cero,1
    oss $t1
    sub $s0,$s1 #Dinero=Dinero-A
    sm $s0,$cero,0
llenarM:
    addi $t2,$cero,0 # i
    addi $t4,$cero,0 # mem   ------# Cada salto de aquí en adelante estará con una etiqueta debido a que no sabemos cuánto espacio nos consumirá el código de random.
llenarfilas:
    beq $t2,$3,comparacion #Salta a comparacion
    addi $t3,cero,0 # j
llenarcol: 
    beq $t3,$3,fincol # -----------------------------En r estará el número random
    sm $r,$t4,4 #De la posición 4-12 de la memoria de datos se encontrará la matriz
    addi $t5,$t4,4
    om $t5
    addi $t3,$t3,1
    addi $t4,$t4,1
    j llenarcol
fincol:
    addi $t2,$t2,1
    j llenarfilas
comparacion:
    addi $s2,$cero,1 #s2=Bonificacion
    sm $s2,$cero,2
    addi $t7,$cero,4
    lm $t0,$t7,0
    lm $t1,$t7,2
    lm $t2,$t7,3
    lm $t3,$t7,4
    lm $t4,$t7,5
    lm $t5,$t7,6
    lm $t6,$t7,8
    bne $t0,$t3,falsed1
    bne $t3,$t6,falsed1
    mul $s2,$2
falsed1:
    bne $t1,$t3,falsed2
    bne $t3,$t5,falsed2
    mul $s2,$2
falsed2:
    bne $t2,$t3,falsecen
    bne $t3,$t4,falsecen
    mul $s2,$3
falsecen:
    addi $t0,$cero,1
    sm $s2,$cero,2 #El valor de la bonificación se guarda en memoria
    bne $s2,$t0,win
    addi $t1,$cero,0
    oss $t1
    bne $s0,$cero,jugarORet
    j ingresarD
win:
    mul $s1,$s2 #A=A*Bonificacion
    add $s0,$s1 #Dinero=Dinero+A
    addi $t1,$cero,0
    oss $t1
    sm $s0,$cero,0 #El dinero actualizado se guarda en memoria
    sm $cero,$cero,1 #Se guarda en memoria 0 en el espacio donde está la apuesta
    j jugarORet