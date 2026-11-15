# Práctica 4 – Parámetros por la pila e IMUL

**Archivo:** `main.asm`

## Qué hace
Empuja dos valores (1 y 2) a la pila y llama a `sumarPila`, que crea un marco de pila con EBP, lee los parámetros con `[EBP+8]` y `[EBP+12]`, los multiplica con `imul` y deja el resultado en EAX. De regreso en `main`, el resultado se imprime con `WriteInt`. Preserva EBX y limpia los parámetros con `ret 8`.

## Qué comprobé al ejecutarlo
- Que en consola aparece **+2** (1 × 2).
- Que **EBX sigue valiendo 10** después de la llamada (el procedimiento lo restauró).
- Que **ESP** es el mismo antes de empujar los parámetros y después del `CALL` (`ret 8` limpió la pila).

**Resultado obtenido en mi ejecución:**
```
[Pega aquí la salida real de tu ejecución]
```
