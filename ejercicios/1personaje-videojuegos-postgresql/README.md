# Base de datos de personajes de videojuegos

Ejercicio guiado para representar personajes, información adicional, sonidos y acciones con tablas relacionadas. [Ver mariodb.sql](mariodb.sql).

## Tablas y relaciones

| Tabla | Contenido | Filas incluidas |
| --- | --- | --- |
| characters | Nombre, origen y color favorito. | 7 |
| more_info | Cumpleaños, altura y peso. | 7 |
| sounds | Nombres de archivos de sonido por personaje. | 8 |
| actions | Acciones disponibles. | 3 |
| character_actions | Asociaciones entre personajes y acciones. | 21 |

Los nombres de sonidos son datos; no se incluyen archivos de audio.

- Un personaje puede tener como máximo una fila en `more_info`, porque su clave foránea es única. El esquema no obliga a que todos tengan información adicional.
- Un personaje puede tener varios sonidos.
- Personajes y acciones se relacionan mediante una tabla intermedia. Su clave primaria compuesta impide repetir el mismo par.

## Conceptos y tecnologías

SQL, PostgreSQL y psql. Se practican creación de tablas, inserciones, tipos de datos, claves primarias y foráneas, restricciones UNIQUE y NOT NULL y relaciones uno a uno, uno a muchos y muchos a muchos.

Los campos SERIAL utilizan secuencias para generar identificadores. Las llamadas a `setval` ajustan esas secuencias después de insertar identificadores explícitos.

El nombre del archivo hace referencia a Mario; el sistema utilizado es PostgreSQL, no MariaDB.

## Cómo cargarlo

Se necesita PostgreSQL en ejecución y el cliente psql disponible. Desde la raíz del repositorio:

```sh
psql -U postgres -d postgres -v ON_ERROR_STOP=1 -c "CREATE DATABASE mario_database;"
psql -U postgres -d mario_database -v ON_ERROR_STOP=1 -f ejercicios/1personaje-videojuegos-postgresql/mariodb.sql
```

`postgres` es el usuario de ejemplo; reemplazalo por el de tu instalación si corresponde. La conexión puede pedir contraseña. Para otro servidor o puerto, agregá las opciones `-h` y `-p`.

Usá una base nueva y vacía. Si ya existe, detenete y elegí otro nombre en ambos comandos. No borres datos existentes para repetir el ejercicio. El archivo no está preparado para ejecutarse dos veces sobre las mismas tablas.

## Consultas de ejemplo

Conectate con `psql -U postgres -d mario_database`. Dentro de psql:

```sql
SELECT name, homeland, favorite_color
FROM characters
ORDER BY character_id;

SELECT c.name, a.action
FROM characters AS c
JOIN character_actions AS ca ON ca.character_id = c.character_id
JOIN actions AS a ON a.action_id = ca.action_id
ORDER BY c.name, a.action;
```

La segunda consulta muestra los 21 pares personaje-acción. JOIN combina registros de tablas relacionadas. Escribí `\q` para salir de psql.

[Volver al repositorio](../../README.md)
