; ==========================================================
; Materia:     Lenguajes de Interfaz
; Alumno:      OSCAR MARIO VELARDE BARRAZA
; Horario:     10 Am - 11 Am
; Docente:     Dr. José Luis Medina Jiménez
; Práctica:    PRACTICA 3
; Descripción: Solicita una cadena de texto al usuario y valida
;              si está vacía o no utilizando un procedimiento
;              (EsCadenaVacia) que revisa el primer byte.
; Entradas:    cadena escrita por el usuario (puede ser vacía)
; Salidas:     mensaje indicando si la cadena está vacía o no
; ==========================================================

INCLUDE Irvine32.inc

.data
	cadena     BYTE 50 DUP(0)    ; buffer de 50 bytes, inicializado en 0
	msgPedir   BYTE "Ingresa una cadena (o presiona Enter para dejarla vacia): ", 0
	msgVacia   BYTE "La cadena ESTA vacia.", 0
	msgNoVacia BYTE "La cadena NO esta vacia.", 0

.code
;-----------------------------------------------------------
; main PROC
; Descripción: Pide la cadena, la lee, llama al procedimiento
;              de validación y muestra el mensaje según el
;              resultado.
;-----------------------------------------------------------
main PROC
	; --- 1. Pedir la cadena ---
	mov  edx, OFFSET msgPedir
	call WriteString

	; --- 2. Leer la entrada ---
	; ReadString: EDX = dirección del buffer, ECX = máximo de caracteres.
	; Guarda lo escrito y agrega un 0 al final. Se deja un byte libre
	; para ese terminador (SIZEOF - 1).
	mov  edx, OFFSET cadena
	mov  ecx, SIZEOF cadena - 1
	call ReadString            ; EAX = cantidad de caracteres leídos

	; --- 3. Validar con el procedimiento ---
	mov  edx, OFFSET cadena    ; EDX = dirección de la cadena a validar
	call EsCadenaVacia         ; devuelve EAX = 1 (vacía) o 0 (con contenido)
	cmp  eax, 1                ; ¿el procedimiento dijo que está vacía?
	je   EsVacia               ; si EAX = 1, salta a EsVacia

; --- Caso: la cadena tiene contenido ---
NoEsVacia:
	mov  edx, OFFSET msgNoVacia
	call WriteString
	call Crlf
	jmp  Fin                   ; salta para no ejecutar el bloque EsVacia

; --- Caso: la cadena está vacía ---
EsVacia:
	mov  edx, OFFSET msgVacia
	call WriteString
	call Crlf

Fin:
	exit                       ; termina el programa
main ENDP

;-----------------------------------------------------------
; EsCadenaVacia PROC
; Descripción: Determina si una cadena terminada en 0 está vacía
;              comprobando si su primer byte es 0.
; Recibe:      EDX = dirección de la cadena
; Devuelve:    EAX = 1 si la cadena está vacía, 0 si tiene contenido
; Modifica:    EAX
;-----------------------------------------------------------
EsCadenaVacia PROC
	cmp  BYTE PTR [edx], 0     ; compara el primer byte de la cadena con 0
	je   Vacia                 ; si es 0, la cadena está vacía
	mov  eax, 0                ; resultado: NO está vacía
	ret
Vacia:
	mov  eax, 1                ; resultado: SÍ está vacía
	ret
EsCadenaVacia ENDP

END main
