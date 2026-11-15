; ==========================================================
; Materia:     Lenguajes de Interfaz
; Alumno:      OSCAR MARIO VELARDE BARRAZA
; Horario:     10 Am - 11 Am
; Docente:     Dr. José Luis Medina Jiménez
; Práctica:    PRACTICA 5
; Descripción: Demuestra el uso de macros para encapsular y
;              reutilizar bloques de código repetitivos.
; Entradas:    ninguna (los valores se pasan como argumentos
;              a las macros)
; Salidas:     mensajes de texto y el resultado de una multiplicación
; ==========================================================

INCLUDE Irvine32.inc

;-----------------------------------------------------------
; MostrarMensaje MACRO
; Descripción: Imprime una cadena y un salto de línea.
; Parámetro:   texto = nombre de una variable BYTE terminada en 0
;-----------------------------------------------------------
MostrarMensaje MACRO texto
	mov  edx, OFFSET texto    ; EDX = dirección de la cadena
	call WriteString          ; la imprime
	call Crlf                 ; salto de línea
ENDM

;-----------------------------------------------------------
; Multi MACRO
; Descripción: Multiplica dos números e imprime el resultado.
; Parámetros:  num1, num2 = valores a multiplicar
; Modifica:    EAX
;-----------------------------------------------------------
Multi MACRO num1, num2
	mov  eax, num1            ; EAX = primer número
	imul eax, num2            ; EAX = EAX * segundo número
	call WriteInt             ; imprime EAX como entero con signo
	call Crlf
ENDM

.data
	mensajeBienvenida BYTE "Bienvenido al sistema", 0
	mensajeFin        BYTE "Nos vemos!", 0

.code
;-----------------------------------------------------------
; main PROC
; Descripción: Usa las macros definidas arriba. Cada llamada
;              se expande en el código que contiene la macro.
;-----------------------------------------------------------
main PROC
	; --- Mensaje de bienvenida ---
	MostrarMensaje mensajeBienvenida

	; --- Mensaje de despedida ---
	MostrarMensaje mensajeFin

	; --- Multiplicación 4 * 5 (se espera ver +20) ---
	Multi 4, 5

	exit                      ; termina el programa
main ENDP
END main
