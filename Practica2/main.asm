; ==========================================================
; Materia:     Lenguajes de Interfaz
; Alumno:      OSCAR MARIO VELARDE BARRAZA
; Horario:     10 Am - 11 Am
; Docente:     Dr. José Luis Medina Jiménez
; Práctica:    PRACTICA 2
; Descripción: Muestra cómo funciona el stack y las direcciones
;              de retorno leyendo directamente la cima de la pila
;              ([ESP]) en distintos puntos del programa.
; Entradas:    ninguna
; Salidas:     valores hexadecimales de la cima de la pila
;              (varían según el equipo y cada ejecución)
; ==========================================================

INCLUDE Irvine32.inc

.data
	; Esta práctica no necesita variables

.code
;-----------------------------------------------------------
; main PROC
; Descripción: Imprime la cima de la pila en main y llama a
;              procUno para observar cómo cambia.
;-----------------------------------------------------------
main PROC
	; --- Cima de la pila dentro de main ---
	mov  eax, [esp]        ; EAX = valor en la cima de la pila (lo que apunta ESP)
	call WriteHex          ; imprime EAX en hexadecimal
	call Crlf

	call procUno           ; CALL empuja la dirección de retorno a main y salta a procUno
	exit
main ENDP

;-----------------------------------------------------------
; procUno PROC
; Descripción: Imprime la cima de la pila, que al entrar es la
;              dirección de retorno hacia main, y llama a procDos.
; Recibe:      nada      Devuelve: nada
; Modifica:    EAX
;-----------------------------------------------------------
procUno PROC
	mov  eax, [esp]        ; [ESP] = dirección de retorno de procUno (hacia main)
	call WriteHex
	call Crlf

	; Al llamar a procDos se empuja una NUEVA dirección de retorno
	; encima de la anterior: la pila crece con cada CALL anidado.
	call procDos

	ret                    ; regresa a main usando la dirección guardada
procUno ENDP

;-----------------------------------------------------------
; procDos PROC
; Descripción: Imprime la cima de la pila, que al entrar es la
;              dirección de retorno hacia procUno.
; Recibe:      nada      Devuelve: nada
; Modifica:    EAX
;-----------------------------------------------------------
procDos PROC
	mov  eax, [esp]        ; [ESP] = dirección de retorno de procDos (hacia procUno)
	call WriteHex
	call Crlf
	ret                    ; regresa a procUno
procDos ENDP

END main
