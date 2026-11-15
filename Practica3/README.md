# Práctica 3 – Validación de cadena vacía

**Archivo:** `main.asm`

## Qué hace
Pide una cadena al usuario con `ReadString` y la valida con el procedimiento `EsCadenaVacia`, que recibe la dirección de la cadena en EDX, revisa su primer byte y devuelve en EAX un 1 (vacía) o un 0 (con contenido). Según el resultado, muestra el mensaje correspondiente.

## Qué comprobé al ejecutarlo
- Escribiendo texto (por ejemplo `hola`) muestra: *La cadena NO esta vacia.*
- Presionando solo Enter muestra: *La cadena ESTA vacia.*
- Con una cadena muy larga (más de 50 caracteres) el programa no falla.

**Resultado obtenido en mi ejecución:**
```
Prueba 1 (solo Enter):
Ingresa una cadena (o presiona Enter para dejarla vacia):
La cadena ESTA vacia.

Prueba 2 (texto "mAIstro"):
Ingresa una cadena (o presiona Enter para dejarla vacia): mAIstro
La cadena NO esta vacia.

```
