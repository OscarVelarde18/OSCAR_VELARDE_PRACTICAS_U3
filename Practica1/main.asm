; ==========================================================
; Materia:     Lenguajes de Interfaz
; Alumno:      OSCAR MARIO VELARDE BARRAZA
; Horario:     10 Am - 11 Am
; Docente:     Dr. José Luis Medina Jiménez
; Práctica:    PRACTICA 1
; Descripción: Muestra el uso de procedimientos (CALL/RET)
;              para modularizar código: un mismo bloque se
;              escribe una vez y se invoca varias veces.
; Entradas:    ninguna
; Salidas:     mensajes de texto en consola
; ==========================================================

INCLUDE Irvine32.inc

.data
	; Cadenas terminadas en 0 (formato requerido por WriteString)
	mensajeInicio        BYTE "inicio de programa",0
	mensajeProcedimiento BYTE "Estoy dentro del procedimiento",0
	mensajeFin           BYTE "Fin del programa",0

.code
;-----------------------------------------------------------
; main PROC
; Descripción: Punto de entrada. Muestra el mensaje inicial,
;              llama dos veces a mensajeAviso y termina con
;              el mensaje final.
;-----------------------------------------------------------
main PROC
	; --- Mensaje de inicio ---
	mov  edx, OFFSET mensajeInicio   ; EDX = dirección de la cadena a imprimir
	call WriteString                 ; imprime la cadena apuntada por EDX
	call Crlf                        ; salto de línea

	; --- Primera llamada al procedimiento ---
	; CALL empuja en la pila la dirección de la siguiente instrucción
	; y salta a mensajeAviso.
	call mensajeAviso

	mov  eax, 10                     ; EAX = 10 (valor de ejemplo tras la primera llamada)

	; --- Segunda llamada al procedimiento ---
	; Se reutiliza el mismo código sin volver a escribirlo.
	call mensajeAviso
	mov  eax, 20                     ; EAX = 20 (valor de ejemplo tras la segunda llamada)

	; --- Mensaje final ---
	mov  edx, OFFSET mensajeFin      ; EDX = dirección del mensaje final
	call WriteString
	call Crlf

	exit                             ; termina el programa y devuelve el control al sistema
main ENDP

;-----------------------------------------------------------
; mensajeAviso PROC
; Descripción: Muestra en consola el mensaje de aviso.
; Recibe:      nada
; Devuelve:    nada
; Modifica:    EDX
;-----------------------------------------------------------
mensajeAviso PROC
	mov  edx, OFFSET mensajeProcedimiento  ; EDX = dirección del mensaje
	call WriteString
	call Crlf
	ret   ; RET saca de la pila la dirección de retorno y la carga en EIP,
	      ; así el flujo continúa después del CALL
mensajeAviso ENDP

END main
