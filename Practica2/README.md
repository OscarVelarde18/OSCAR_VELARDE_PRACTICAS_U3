# Práctica 2 – Stack y direcciones de retorno

**Archivo:** `main.asm`

## Qué hace
Lee la cima de la pila (`[ESP]`) en tres puntos: en `main`, dentro de `procUno` y dentro de `procDos`, e imprime cada valor en hexadecimal. Permite ver cómo cada CALL empuja una dirección de retorno a la pila.

## Qué comprobé al ejecutarlo
- Que se imprimen **tres valores hexadecimales**.
- Que los dos últimos son direcciones de retorno distintas (una hacia `main` y otra hacia `procUno`).
- Que el programa termina sin errores, lo que indica que la pila quedó balanceada.
- Los valores concretos cambian según el equipo y la ejecución.

**Resultado obtenido en mi ejecución:**
```
[Pega aquí la salida real de tu ejecución]
```
