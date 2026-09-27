# Bases de datos relacionales y Bash — freeCodeCamp

Este repositorio reúne mis prácticas de PostgreSQL, SQL y Bash realizadas durante el curso de bases de datos relacionales de freeCodeCamp. Forma parte de mi portfolio de aprendizaje, orientado al desarrollo backend y al análisis de sistemas.

El objetivo es practicar cómo organizar información en tablas, relacionarlas mediante claves y utilizar la terminal para ejecutar pequeños programas. El contenido irá creciendo a medida que avance con el curso.

**Curso:** [Bases de datos relacionales de freeCodeCamp](https://www.freecodecamp.org/espanol/learn/relational-database/).

## Contenido actual

| Trabajo | Tipo | Qué practica |
| --- | --- | --- |
| [Personajes de videojuegos](ejercicios/postgresql/personajes-videojuegos/) | Ejercicio guiado | Tablas, claves, relaciones e inserción de datos. |
| [Cinco programas de Bash](ejercicios/bash/cinco-programas/) | Ejercicio guiado | Variables, entrada por teclado, argumentos, condiciones, bucles y funciones. |
| [Cuerpos celestes](proyectos-certificacion/cuerpos-celestes/) | Proyecto de certificación | Diseño de una base PostgreSQL y relaciones entre galaxias, estrellas, planetas y lunas. |

Actualmente contiene **dos archivos SQL y cinco scripts Bash**, además de la documentación. Incluir un proyecto de certificación no significa que el curso completo esté terminado.

## Organización

```text
freecodecamp-relational-databases/
├── README.md
├── .gitignore
├── .gitattributes
├── ejercicios/
│   ├── postgresql/
│   │   └── personajes-videojuegos/
│   │       ├── README.md
│   │       └── mariodb.sql
│   └── bash/
│       └── cinco-programas/
│           ├── README.md
│           ├── questionnaire.sh
│           ├── countdown.sh
│           ├── bingo.sh
│           ├── fortune.sh
│           └── five.sh
└── proyectos-certificacion/
    └── cuerpos-celestes/
        ├── README.md
        └── universe.sql
```

## Tecnologías

- **SQL:** lenguaje para definir tablas, guardar información y realizar consultas.
- **PostgreSQL:** sistema de bases de datos utilizado en los ejercicios.
- **psql:** cliente de terminal para conectarse a PostgreSQL y ejecutar SQL.
- **Bash:** intérprete utilizado por los programas de terminal.
- **Git y GitHub:** historial de cambios y publicación del repositorio.

## Cómo usar el repositorio

Cada trabajo tiene su propio README con requisitos, explicación y ejemplos. No hay un único comando que ejecute todo el repositorio.

Para los scripts se necesita Bash. En Windows se pueden abrir desde Git Bash; PowerShell sirve para los comandos de Git, pero no interpreta directamente el lenguaje Bash. Para los archivos SQL se necesita un servidor PostgreSQL y el cliente psql.

**Antes de restaurar `universe.sql`, leé su README:** el archivo original del curso elimina y recrea una base llamada `universe`. Además, conserva configuraciones del entorno Linux donde fue generado.

## Conceptos de bases de datos

- Una **tabla** agrupa registros con las mismas columnas.
- Una **clave primaria** identifica un registro sin repetirlo.
- Una **clave foránea** relaciona un registro con otro y evita referencias a registros inexistentes.
- Una restricción **UNIQUE** impide valores repetidos; **NOT NULL** impide omitir un valor.
- Una consulta con **JOIN** combina información de tablas relacionadas.

Los modelos de estos ejercicios permiten practicar cómo pasar de entidades y relaciones a tablas concretas. Los programas Bash complementan ese aprendizaje con el uso de la terminal.

## Notas

Los datos son de práctica. Los nombres y mensajes del código conservan el idioma utilizado durante los ejercicios; la documentación está en español. Los historiales originales de terminal se conservan solo localmente y están excluidos mediante `.gitignore`.

Los enunciados pertenecen a freeCodeCamp; este repositorio reúne mis soluciones y prácticas.
