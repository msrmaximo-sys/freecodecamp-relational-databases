# Base de datos de cuerpos celestes

Proyecto de certificación para modelar galaxias, estrellas, planetas y lunas en PostgreSQL, con una tabla adicional de misiones espaciales.

[Enunciado oficial](https://www.freecodecamp.org/espanol/learn/relational-database/build-a-celestial-bodies-database-project/build-a-celestial-bodies-database) · [Ver universe.sql](universe.sql)

## Tablas

| Tabla | Contenido | Filas incluidas |
| --- | --- | --- |
| galaxy | Nombre y características de la galaxia. | 6 |
| star | Nombre, galaxia, edad e indicador booleano. | 6 |
| planet | Nombre, estrella, descripción, edad, temperatura y habitabilidad. | 12 |
| moon | Nombre, planeta, misión y fecha. | 20 |
| misiones_espaciales | Nombre y descripción. | 3 |

Los datos mezclan nombres reales y ficticios y sirven para practicar SQL; no constituyen un catálogo astronómico.

## Relaciones

Las claves foráneas forman el recorrido **galaxia → estrella → planeta → luna**:

- star.galaxy_id referencia galaxy.galaxy_id.
- planet.star_id referencia star.star_id.
- moon.planet_id referencia planet.planet_id.

Las referencias admiten NULL en el esquema, aunque las filas incluidas las completan. Cada tabla tiene clave primaria y nombres únicos. La tabla misiones_espaciales es independiente: moon.mision es texto, no una clave foránea hacia esa tabla.

## Tecnologías y conceptos

PostgreSQL, SQL, psql y pg_dump. Se practican claves, restricciones UNIQUE y NOT NULL, secuencias y tipos integer, numeric, boolean, text, varchar y date.

## Antes de restaurar

El archivo es un volcado de PostgreSQL 12.22 generado en Linux. Conserva el formato original del curso:

- **DROP DATABASE universe elimina la base universe si existe.**
- CREATE DATABASE vuelve a crearla.
- Las asignaciones de propietario requieren el rol freecodecamp.
- La configuración regional C.UTF-8 debe estar disponible en el servidor.

**Usá únicamente un servidor de práctica donde no haya una base universe con datos que quieras conservar.** Elegir otro nombre con psql -d no evita el borrado: el archivo contiene su propia creación y conexión a universe.

## Restauración en un entorno compatible

Se necesita un servidor compatible, el rol freecodecamp, la configuración regional indicada y permisos para crear/eliminar bases y asignar propietarios. El archivo no es directamente portable a todas las instalaciones de Windows.

Desde la raíz del repositorio, después de verificar esas condiciones:

```sh
psql -U freecodecamp -d postgres -f proyectos-certificacion/cuerpos-celestes/universe.sql
```

Si universe no existe, el DROP inicial informa ese error y psql continúa con la creación. Por esa característica del original, este comando no usa ON_ERROR_STOP. Revisá toda la salida: otros errores de permisos, configuración o propietarios requieren corregir el entorno antes de considerar restaurada la base.

Si tu entorno difiere del curso, conviene preparar una copia adaptada del volcado conservando este original. No cambies permisos o roles sin comprender su efecto.

## Consultas de ejemplo

Después de restaurar correctamente, conectate con `psql -U freecodecamp -d universe`. Dentro de psql:

```sql
SELECT 'galaxy' AS tabla, COUNT(*) AS registros FROM galaxy
UNION ALL SELECT 'star', COUNT(*) FROM star
UNION ALL SELECT 'planet', COUNT(*) FROM planet
UNION ALL SELECT 'moon', COUNT(*) FROM moon
UNION ALL SELECT 'misiones_espaciales', COUNT(*) FROM misiones_espaciales;

SELECT p.name AS planeta, s.name AS estrella, g.name AS galaxia
FROM planet AS p
JOIN star AS s ON s.star_id = p.star_id
JOIN galaxy AS g ON g.galaxy_id = s.galaxy_id
ORDER BY p.planet_id;
```

La primera consulta permite comparar cantidades con la tabla del README. La segunda combina planetas, estrellas y galaxias. Escribí `\q` para salir de psql.

[Volver al repositorio](../../README.md)
