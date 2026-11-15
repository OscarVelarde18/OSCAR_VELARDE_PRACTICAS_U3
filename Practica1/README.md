# Práctica 1 – Procedimientos (CALL/RET)

**Archivo:** `main.asm`

## Qué hace
Muestra un mensaje de inicio, llama dos veces al procedimiento `mensajeAviso` (que imprime un mensaje) y termina con un mensaje final. Sirve para ver cómo un mismo bloque de código se reutiliza con CALL y regresa con RET.

## Qué comprobé al ejecutarlo
- Que el mensaje del procedimiento aparece **dos veces**, una por cada llamada.
- Que el programa continúa después de cada CALL y llega al mensaje final (el RET regresó al lugar correcto).
- Salida esperada: `inicio de programa`, `Estoy dentro del procedimiento` (x2), `Fin del programa`.

**Resultado obtenido en mi ejecución:**
```
inicio de programa
Estoy dentro del procedimiento
Estoy dentro del procedimiento
Fin del programa
```
