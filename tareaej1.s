.data 
	mensaje_ayuda: .asciiz "\nIngrese 2 numeros que sean de tipo float"
	primer_elemento: .asciiz "\nIngrese un numero: "
	segundo_elemento: .asciiz "\nIngrese otro numero: "
	mensaje_inicio: .asciiz "\nA continuacion se realizaran las operaciones de suma,resta,multiplicacion y division con resultados de tipo float"
	mensaje_suma: .asciiz "\nLa suma es: "
	mensaje_diferencia: .asciiz "\nLa diferencia es: "
	mensaje_multiplicacion: .asciiz "\nLa multiplicacion es: "
	mensaje_division: .asciiz "\nLa division es: "
	mensaje_promedio: .asciiz "\nEl promedio es: "

.text
main: 	

la $a0, mensaje_ayuda
li $v0, 4
syscall


la $a0, primer_elemento
li $v0, 4
syscall

li $v0, 6
syscall
mov.s $f1,$f0


la $a0, segundo_elemento
li $v0, 4
syscall

li $v0, 6
syscall
mov.s $f2,$f0

la $a0, mensaje_inicio
li $v0, 4
syscall

la $a0, mensaje_suma
li $v0, 4
syscall

add.s $f12, $f1, $f2
li $v0, 2
syscall

la $a0, mensaje_diferencia
li $v0, 4
syscall


sub.s $f12, $f1, $f2
li $v0, 2
syscall


la $a0, mensaje_multiplicacion
li $v0, 4
syscall

mul.s $f12, $f1, $f2
li $v0, 2
syscall

la $a0, mensaje_division
li $v0, 4
syscall


div.s $f12, $f1, $f2
li $v0, 2
syscall


jr $ra

