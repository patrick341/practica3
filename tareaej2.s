.data 
	ayuda: .asciiz "\nel tipo de numero que debe ingresar en el mensaje de abajo debe ser de tipo int"
	primer_mensaje: .asciiz "\nIngrese la cantidad de numeros: "
	ayuda2: .asciiz "\nel tipo de numero que debe ingresar en el mensaje de abajo debe ser de tipo float" 
	segundo_mensaje: .asciiz "\nIngrese un numero: "
	mensaje_suma: .asciiz "\nLa suma es: "
	mensaje_promedio: .asciiz "\nEl promedio es: "
	mensaje_mayor: .asciiz "\nEl mayor es: "
	mensaje_menor: .asciiz "\nEl menor es: "

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
	move $t1, $v0

	li $t2, 0

	li.s $f1, 0.0
	li.s $f7, -100.0
	li.s $f8, 0.0
	Loop:
	  beq $t1, $t2, Exit

	  la $a0, ayuda2
	  li $v0, 4
	  syscall 
	 			  
 	  la $a0, segundo_mensaje
	  li $v0, 4
	  syscall

	  	
	  li $v0, 6
	  syscall
	  mov.s $f2,$f0
	  	
	  add.s $f12, $f1, $f2
	  #li $v0, 2
	  #syscall
	  mov.s $f1,$f12
	  
	 mov.s $f10,$f2
	 mov.s $f11,$f7 

	  c.le.s $f11, $f10	  
	  bc1t verdad
	  verdad:
		
   		mov.s $f9,$f10
		mov.s $f11,$f10
	  		
	  bc1f falsedad
	  falsedad:
	        mov.s $f9,$f10  				

	   add $t2, $t2, 1		  
	  		  
	   
	
	  j Loop		
	
 	
	Exit:



mov.s $f8,$f11
mov.s $f4,$f1

la $a0, mensaje_suma
li $v0, 4
syscall

mov.s $f0,$f4
li $v0, 2
syscall

la $a0, mensaje_promedio
li $v0, 4
syscall

mtc1 $t1, $f12
cvt.s.w $f12, $f12
mov.s $f6,$f12

mov.s $f5,$f0
li $v0, 2
div.s $f12,$f5,$f6
syscall


la $a0, mensaje_mayor
li $v0, 4
syscall

mov.s $f12,$f8
li $v0, 2
syscall

jr $ra
