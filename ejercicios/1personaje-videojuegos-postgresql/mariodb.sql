-- Dump de la base de datos: mario_database
-- Proyecto: Build a Relational Database of Video Game Characters

-- 1. Creación de tablas
CREATE TABLE characters (
    character_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    homeland VARCHAR(60),
    favorite_color VARCHAR(30)
);

CREATE TABLE more_info (
    more_info_id SERIAL PRIMARY KEY,
    birthday DATE,
    height_in_cm INT,
    weight_in_kg NUMERIC(4,1),
    character_id INT NOT NULL UNIQUE REFERENCES characters(character_id)
);

CREATE TABLE sounds (
    sound_id SERIAL PRIMARY KEY,
    filename VARCHAR(40) NOT NULL UNIQUE,
    character_id INT NOT NULL REFERENCES characters(character_id)
);

CREATE TABLE actions (
    action_id SERIAL PRIMARY KEY,
    action VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE character_actions (
    character_id INT NOT NULL REFERENCES characters(character_id),
    action_id INT NOT NULL REFERENCES actions(action_id),
    PRIMARY KEY(character_id, action_id)
);

-- 2. Inserción de datos finales

-- Tabla: characters
INSERT INTO characters(character_id, name, homeland, favorite_color) VALUES 
(1, 'Mario', 'Mushroom Kingdom', 'Red'),
(2, 'Luigi', 'Mushroom Kingdom', 'Green'),
(3, 'Peach', 'Mushroom Kingdom', 'Pink'),
(4, 'Toad', 'Mushroom Kingdom', 'Blue'),
(5, 'Bowser', 'Koopa Kingdom', 'Yellow'),
(6, 'Daisy', 'Sarasaland', 'Orange'),
(7, 'Yoshi', 'Dinosaur Land', 'Green');

-- Ajuste de la secuencia ID
SELECT setval('characters_character_id_seq', 7);

-- Tabla: more_info
INSERT INTO more_info(more_info_id, birthday, height_in_cm, weight_in_kg, character_id) VALUES 
(1, '1981-07-09', 155, 64.5, 1),
(2, '1983-07-14', 175, 48.8, 2),
(3, '1985-10-18', 173, 52.2, 3),
(4, '1950-01-10', 66, 35.6, 4),
(5, '1990-10-29', 258, 300.0, 5),
(6, '1989-07-31', NULL, NULL, 6),
(7, '1990-04-13', 162, 59.1, 7);

SELECT setval('more_info_more_info_id_seq', 7);

-- Tabla: sounds
INSERT INTO sounds(sound_id, filename, character_id) VALUES 
(1, 'its-a-me.wav', 1),
(2, 'yippee.wav', 1),
(3, 'ha-ha.wav', 2),
(4, 'oh-yeah.wav', 2),
(5, 'yay.wav', 3),
(6, 'woo-hoo.wav', 3),
(7, 'mm-hmm.wav', 3),
(8, 'yahoo.wav', 1);

SELECT setval('sounds_sound_id_seq', 8);

-- Tabla: actions
INSERT INTO actions(action_id, action) VALUES 
(1, 'run'),
(2, 'jump'),
(3, 'duck');

SELECT setval('actions_action_id_seq', 3);

-- Tabla: character_actions
INSERT INTO character_actions(character_id, action_id) VALUES 
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 2), (2, 3),
(3, 1), (3, 2), (3, 3),
(4, 1), (4, 2), (4, 3),
(5, 1), (5, 2), (5, 3),
(6, 1), (6, 2), (6, 3),
(7, 1), (7, 2), (7, 3);