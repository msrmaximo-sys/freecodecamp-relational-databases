# Base de datos de estudiantes — parte 1

Ejercicio guiado que combina Bash y PostgreSQL para importar estudiantes, carreras y cursos desde archivos CSV.

## Archivos

| Archivo | Función |
| --- | --- |
| [students.sql](students.sql) | Volcado con estructura, restricciones, secuencias y datos ya cargados. |
| [insert_data.sh](insert_data.sh) | Vacía las tablas y carga los dos CSV mediante psql. |
| [courses.csv](courses.csv) | Pares de carreras y cursos. |
| [students.csv](students.csv) | Nombres, apellidos, carreras y promedios de práctica. |

Los historiales de terminal se conservan localmente y están excluidos de Git.

## Modelo de datos

| Tabla | Contenido | Filas del volcado |
| --- | --- | --- |
| majors | Carreras | 7 |
| courses | Cursos | 17 |
| majors_courses | Pares carrera-curso | 28 |
| students | Estudiantes | 31 |

Una carrera puede tener varios estudiantes y varios cursos. Un curso puede pertenecer a varias carreras: majors_courses representa esa relación y su clave primaria compuesta impide repetir un par. Las claves foráneas mantienen las referencias entre tablas.

La carrera y el promedio GPA del estudiante admiten NULL, que representa información ausente. Los nombres de carreras y cursos no tienen una restricción UNIQUE: el script consulta si existen antes de insertarlos.

## Cómo funciona el script

1. Configura psql para conectarse como freecodecamp a students.
2. Ejecuta TRUNCATE sobre las cuatro tablas.
3. Lee courses.csv, omite el encabezado y busca o inserta carreras y cursos.
4. Guarda sus relaciones en majors_courses.
5. Lee students.csv, busca cada carrera y utiliza NULL si no la encuentra.
6. Inserta estudiantes y muestra mensajes de las inserciones realizadas.

IFS indica que los campos se separan por comas; read los asigna a variables y while recorre las filas. Las consultas recuperan los identificadores necesarios para relacionar los registros.

## Tecnologías

Bash, PostgreSQL, SQL, psql y CSV. Se practican variables, bucles, condiciones, lectura de archivos, SELECT, INSERT, claves foráneas y valores NULL.

## Restauración

**students.sql elimina y recrea la base students.** Usalo únicamente en un entorno de práctica sin datos que quieras conservar. El volcado requiere el rol freecodecamp, la configuración regional C.UTF-8 del entorno Linux del curso y permisos para crear/eliminar bases y asignar propietarios. No es directamente portable a todas las instalaciones de Windows.

Desde la raíz del repositorio, con PostgreSQL en ejecución y psql disponible en un entorno compatible:

```sh
psql -U freecodecamp -d postgres -f ejercicios/3basedatos-estudiantes-parte1-bash-sql/students.sql
```

Si la base no existe, el DROP inicial informa un error y psql continúa. Revisá toda la salida: otros errores de permisos o configuración requieren revisión. El volcado ya incluye los datos; no hace falta importar los CSV para consultarlos.

## Probar la importación desde CSV

Es un paso opcional después de restaurar. **El script vacía las cuatro tablas antes de importar.** En Bash, desde la raíz del repositorio:

```bash
cd ejercicios/3basedatos-estudiantes-parte1-bash-sql
bash insert_data.sh
```

Necesitás psql accesible desde Bash y conexión al entorno indicado. Los CSV se buscan en el directorio actual. En Windows podés usar Git Bash, junto con el servidor PostgreSQL compatible.

TRUNCATE no reinicia las secuencias en esta implementación: los identificadores pueden cambiar entre cargas aunque los datos sean equivalentes.

## Consultar el resultado

Conectate con `psql -U freecodecamp -d students`. Dentro de psql:

```sql
SELECT 'students' AS tabla, COUNT(*) AS cantidad FROM students
UNION ALL SELECT 'majors', COUNT(*) FROM majors
UNION ALL SELECT 'courses', COUNT(*) FROM courses
UNION ALL SELECT 'majors_courses', COUNT(*) FROM majors_courses;

SELECT s.first_name, s.last_name, m.major, s.gpa
FROM students AS s
LEFT JOIN majors AS m ON m.major_id = s.major_id
ORDER BY s.student_id;
```

LEFT JOIN permite mostrar también a los estudiantes sin carrera asignada.

## Alcance

La solución está pensada para los CSV de práctica. Separar por comas con read no cubre campos entre comillas que contienen comas. Las consultas incorporan texto directamente: los apóstrofes pueden provocar errores y no debe usarse con entradas externas sin adaptar su manejo.

No hay una transacción que agrupe toda la carga ni detención automática ante cualquier error SQL. Si falla una operación, la carga puede quedar incompleta. Estas son mejoras posibles para una versión posterior; se conserva el código del ejercicio.

[Volver al repositorio](../../README.md)
