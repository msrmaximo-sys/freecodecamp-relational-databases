# Base de datos de estudiantes — parte 2

Ejercicio guiado que continúa la [parte 1](../3basedatos-estudiantes-parte1-bash-sql/) y utiliza Bash y PostgreSQL para consultar estudiantes, carreras y cursos.

## Archivos

| Archivo | Función |
| --- | --- |
| [students.sql](students.sql) | Volcado del estado de la base utilizado en esta parte: tablas, datos, secuencias y restricciones. |
| [students_info.sh](students_info.sh) | Ejecuta once consultas SELECT con psql y muestra sus resultados en la terminal. |

Los historiales de comandos se conservan localmente y están excluidos de Git.

## Modelo de datos

| Tabla | Contenido | Filas del volcado |
| --- | --- | --- |
| majors | Carreras | 7 |
| courses | Cursos | 17 |
| majors_courses | Pares carrera-curso | 28 |
| students | Estudiantes | 31 |

Se conserva el modelo de la parte 1. Este volcado tiene identificadores y algunos datos distintos; las relaciones permiten consultar los cursos de cada carrera y los estudiantes asociados. El promedio GPA y la carrera pueden ser NULL.

## Cómo funciona el script

1. Configura psql para conectarse como freecodecamp a la base students.
2. Filtra estudiantes por promedio, apellido, nombre y carrera sin asignar.
3. Busca cursos con patrones de texto y limita resultados ordenados.
4. Calcula promedios y cantidades mediante AVG, ROUND, COUNT, GROUP BY y HAVING.
5. Relaciona las tablas mediante INNER JOIN, RIGHT JOIN y FULL JOIN para consultar carreras y cursos con o sin estudiantes.

Las consultas solo leen datos. El script imprime un título antes de cada resultado y utiliza psql sin encabezados ni alineación de columnas.

## Tecnologías

Bash, PostgreSQL, SQL y psql. Se practican SELECT, WHERE, AND, OR, LIKE, ILIKE, IS NULL, ORDER BY, LIMIT, DISTINCT, funciones de agregación y uniones de tablas.

## Preparar la base

Necesitás Bash, un servidor PostgreSQL y psql accesible desde Bash. El script espera el rol freecodecamp y la base students. En Windows podés utilizar Git Bash junto con una instalación PostgreSQL compatible.

Primero seguí las instrucciones de restauración de la [parte 1](../3basedatos-estudiantes-parte1-bash-sql/README.md#restauración). Podés consultar esa base directamente; para reproducir los datos de esta parte, restaurá después su volcado.

**El students.sql de esta carpeta elimina y recrea las cuatro tablas dentro de la base indicada.** No crea ni elimina la base completa y no contiene una orden de conexión: comprobá que el destino sea students y que solo contenga datos de práctica. Requiere las tablas de la parte 1 y permisos para reemplazarlas y asignar sus propietarios al rol freecodecamp.

Desde la raíz del repositorio:

```bash
psql -X -v ON_ERROR_STOP=1 -U freecodecamp -d students -f ejercicios/3basedatos-estudiantes-parte2-bash-sql/students.sql
```

El volcado ya incluye los datos: no hace falta volver a importar los CSV. Si falla la restauración, revisá la salida antes de ejecutar consultas; las órdenes no están agrupadas en una transacción y la carga puede quedar incompleta.

## Ejecutar las consultas

En Bash, desde la raíz del repositorio:

```bash
bash ejercicios/3basedatos-estudiantes-parte2-bash-sql/students_info.sh
```

El programa muestra once bloques de resultados. No solicita entradas por teclado. PostgreSQL puede solicitar autenticación según la configuración de tu entorno.

## Alcance

Se conserva la solución del curso y sus mensajes originales. El script no detiene automáticamente todas las consultas si falla una llamada a psql: revisá también los mensajes de error. Las consultas sin ORDER BY no garantizan un orden de filas.

[Volver al repositorio](../../README.md)
