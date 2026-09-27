# Cinco programas de Bash

Ejercicio guiado para practicar pequeños programas de terminal. Cuatro scripts realizan tareas y el quinto los ejecuta en secuencia.

| Archivo | Qué hace | Conceptos |
| --- | --- | --- |
| [questionnaire.sh](questionnaire.sh) | Pide nombre, procedencia y sitio favorito; muestra una frase con las respuestas. | Variables, read y echo. |
| [countdown.sh](countdown.sh) | Cuenta desde un entero positivo hasta cero. | Argumentos, while, condiciones y sleep. |
| [bingo.sh](bingo.sh) | Genera un número entre 1 y 75 y su letra de bingo. | RANDOM, aritmética y condiciones. |
| [fortune.sh](fortune.sh) | Recibe una pregunta terminada en ? y elige una respuesta. | Arrays, funciones, expresiones regulares y until. |
| [five.sh](five.sh) | Ejecuta los otros cuatro en orden. | Rutas relativas y ejecución de scripts. |

## Tecnologías y requisitos

Bash y utilidades habituales como sleep y chmod. No se necesita PostgreSQL. En Windows, abrí **Git Bash** para los comandos siguientes; PowerShell no interpreta directamente este lenguaje.

## Ejecución individual

Desde la raíz del repositorio, en Bash:

```bash
cd ejercicios/bash/cinco-programas
bash questionnaire.sh
bash countdown.sh 3
bash bingo.sh
bash fortune.sh
```

Ejecutá cada comando cuando termine el anterior. El cuestionario espera tres respuestas; el adivinador espera una pregunta terminada en `?`. La cuenta regresiva imprime 3, 2, 1 y 0, con pausas de un segundo.

## Ejecutar el conjunto

Desde esa misma carpeta:

```bash
chmod +x questionnaire.sh countdown.sh bingo.sh fortune.sh five.sh
bash five.sh
```

El permiso de ejecución es necesario porque five.sh llama a los demás con `./nombre.sh`. Es importante estar en esta carpeta: las rutas dependen del directorio actual.

## Alcance y observaciones

- El bingo no guarda los números anteriores, por lo que puede repetirlos.
- El adivinador es una práctica de selección aleatoria. La pregunta debe terminar exactamente en `?`.
- La cuenta regresiva espera un entero positivo; no valida exhaustivamente cualquier texto. Incluye una alternativa con for dentro de un bloque que no se ejecuta.
- Los programas interactivos esperan respuestas: no manejan todos los casos de entrada cerrada.
- Ninguno guarda resultados en una base de datos.
- Los archivos utilizan saltos de línea LF, conservados mediante .gitattributes.

[Volver al repositorio](../../../README.md)
