; ==========================================================
; Materia:     Lenguajes de Interfaz
; Alumno:      OSCAR MARIO VELARDE BARRAZA
; Horario:     10 Am - 11 Am
; Docente:     Dr. José Luis Medina Jiménez
; Práctica:    PRACTICA 4
; Descripción: Muestra el uso de la pila para pasar parámetros a
;              un procedimiento y el uso de IMUL para multiplicar
;              dos valores.
; Entradas:    dos valores empujados a la pila (1 y 2)
; Salidas:     el resultado de la multiplicación, impreso en consola
; ==========================================================

INCLUDE Irvine32.inc

.data
	; Esta práctica no necesita variables

.code
;-----------------------------------------------------------
; main PROC
; Descripción: Empuja dos parámetros a la pila y llama a
;              sumarPila.
;-----------------------------------------------------------
main PROC
	mov  ebx, 10      ; EBX = 10; se usa para comprobar que el procedimiento lo preserva
	push 1            ; primer valor a multiplicar, se guarda en la pila
	push 2            ; segundo valor a multiplicar, se guarda en la pila

	call sumarPila    ; salta al procedimiento (empuja la dirección de retorno)

	; --- Mostrar el resultado ---
	; Al regresar, EAX contiene el producto calculado por sumarPila.
	call WriteInt     ; imprime EAX como entero con signo (se espera +2)
	call Crlf

	nop               ; instrucción vacía: sirve de punto de pausa en el depurador
	exit
main ENDP

;-----------------------------------------------------------
; sumarPila PROC
; Descripción: Lee dos parámetros de la pila usando EBP y los
;              multiplica con IMUL.
; Recibe:      [EBP+8]  = segundo valor empujado (2)
;              [EBP+12] = primer valor empujado (1)
; Devuelve:    EAX = producto de los dos valores
; Modifica:    EAX (EBX y EBP se restauran antes de salir)
;-----------------------------------------------------------
sumarPila PROC
	push ebp          ; guarda el EBP de quien llamó
	mov  ebp, esp     ; EBP = ESP: punto de referencia fijo para leer parámetros
	                  ; Con este marco: [EBP]=EBP anterior, [EBP+4]=dirección de retorno

	push ebx          ; guarda EBX porque se va a modificar en el procedimiento

	mov  eax, [ebp+8]   ; EAX = último parámetro empujado (2)
	mov  ebx, [ebp+12]  ; EBX = parámetro empujado antes (1)

	imul eax, ebx     ; EAX = EAX * EBX (multiplicación con signo)

	pop  ebx          ; restaura EBX (orden inverso al de los push)
	pop  ebp          ; restaura EBP de quien llamó

	ret  8            ; regresa y libera 8 bytes (dos parámetros de 4 bytes) de la pila
sumarPila ENDP

END main
