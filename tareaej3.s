.data 
	ayuda: .asciiz "\nIngrese valores de tipo int para los triangulos"
	primer_lado: .asciiz "\nIngrese el primer lado del triangulo: "
	segundo_lado: .asciiz "\nIngrese el segundo lado del triangulo: "
	tercer_lado: .asciiz "\nIngrese el tercer lado del triangulo: "
	resultado: .asciiz "\n El resultado sera determinado por un enunciado el cual dira si es o no un triangulo"
	mensa_exito: .asciiz "\nEl triangulo es valido"	
	mensa_fallido: .asciiz "\nEl triangulo no es valido"
.text
main:
la $a0, ayuda
li $v0, 4
syscall

la $a0, primer_lado
li $v0, 4
syscall	

li $v0, 5
syscall
move $t1,$v0



la $a0, segundo_lado
li $v0, 4
syscall

li $v0, 5
syscall
move $t2,$v0



la $a0, tercer_lado
li $v0, 4
syscall

li $v0, 5
syscall
move $t3,$v0


add $a0, $t1, $t2
#li $v0, 1
#syscall
move $t4, $a0

add $a0,$t2,$t3
#li $v0,1
#syscall
move $t5, $a0

add $a0,$t1,$t3
#li $v0,1
#syscall
move $t6, $a0

la $a0, resultado
li $v0, 4
syscall

bge $t4, $t3, LABEL_IF #si el primero es mayor
LABEL_ELSE:
la $a0, mensa_fallido
b END_LABEL_IF
LABEL_IF:
bge $t5, $t1, LABEL_SI 

LABEL_SINO:
la $a0, mensa_fallido
b END_LABEL_IF

LABEL_SI:
bge $t6,$t2,LABEL_SII

LABEL_FALLA:
la $a0, mensa_fallido
b END_LABEL_IF

LABEL_SII:
la $a0, mensa_exito

#la $a0, mensa_exito 
END_LABEL_IF:
li $v0, 4
syscall



jr $ra