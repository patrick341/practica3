.data 
	ayuda: .asciiz "\El numero que debe ingresar en la parte de abajo debe ser int"
	primer_mensaje: .asciiz "\nIngrese un numero: "
	primera_parte: .asciiz "\nEl numero "
	mensaje_exitoso: .asciiz "si es multiplo de"
	mensaje_rechazado: .asciiz "no es multiplo de"

.text
main:
la $a0, ayuda
li $v0, 4
syscall

la $a0, primer_mensaje
li $v0, 4
syscall

li $v0, 5
syscall
move $t3,$v0

li $t1, 1
li $t2, 21
li $t6, 0

move $t7,$t3



Loop:

beq $t2,$t1, Exit
  
div $t1, $t3  	  

mfhi $a0
move $t5,$a0

la $a0, primera_parte 
li $v0, 4
syscall

#move $a0,$t7
move $a0,$t1
li $v0,1  
syscall


beq $t5,$t6, LABEL_IF
LABEL_ELSE:
la $a0,mensaje_rechazado
b END_LABEL_IF
LABEL_IF:
la $a0,mensaje_exitoso
END_LABEL_IF:
li $v0,4
syscall

move $a0,$t7
li $v0,1  
syscall

  


add $t1, $t1, 1 #i++
j Loop
 
Exit:



jr $ra