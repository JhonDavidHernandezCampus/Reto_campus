use reto_sistema_campus;

CREATE DATABASE reto_sistema_campus;
DROP DATABASE reto_sistema_campus;

CREATE TABLE trainer(
    id_tra INT PRIMARY KEY ,
    nombre_tra VARCHAR(60),
    email_personal VARCHAR(50),
    email_corporativo VARCHAR(50),
    telefono_movil VARCHAR(20),
    telefono_residencia VARCHAR(20),
    telefono_empresa VARCHAR(20),
    telefono_movil_empresarial VARCHAR(20)
);

CREATE TABLE categoria_incidencia(
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(20)
);
CREATE TABLE area(
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    nombre_area VARCHAR(50)
);
CREATE TABLE nivel (
    id_nivel INT PRIMARY KEY,
    nombre_nivel VARCHAR(20)
);

CREATE TABLE bloque_area(
    id_bloque INT PRIMARY KEY AUTO_INCREMENT,
    nombre_bloque VARCHAR(50),
    fk_id_area INT,
    CONSTRAINT fk_area_bloque FOREIGN KEY (fk_id_area) REFERENCES area(id_area)
);
CREATE TABLE inventario(
    id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_bloque INT,
    computadores INT,
    teclados INT,
    mouse INT,
    CONSTRAINT fk_areas_inventario FOREIGN KEY (fk_id_bloque) REFERENCES bloque_area(id_bloque)
);



CREATE TABLE incidencias(
    id_inci INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_trainer INT,
    fk_id_categoria INT,
    fk_id_nivel INT,
    fk_id_bloque_area INT,
    descripcion VARCHAR(200),
    fecha_reporte TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_trai_incide FOREIGN KEY (fk_id_trainer) REFERENCES trainer(id_tra),
    CONSTRAINT fk_catego_incide FOREIGN KEY (fk_id_categoria) REFERENCES categoria_incidencia(id_categoria),
    CONSTRAINT fk_nivel_incide FOREIGN KEY (fk_id_nivel) REFERENCES nivel(id_nivel),
    CONSTRAINT fk_area_incide FOREIGN KEY (fk_id_bloque_area) REFERENCES bloque_area(id_bloque)
);

#Insertcion de datos

-- Insertar registros en la tabla trainer
INSERT INTO trainer (id_tra, nombre_tra, email_personal, email_corporativo, telefono_movil, telefono_residencia, telefono_empresa, telefono_movil_empresarial)
VALUES
(1, 'Juan Pérez', 'juan@gmail.com', 'juan@empresa.com', '123456789', '987654321', '55555555', '999999999'),
(2, 'María López', 'maria@gmail.com', 'maria@empresa.com', '987654321', '123456789', '55555555', '888888888');

-- Insertar registros en la tabla categoria_incidencia
INSERT INTO categoria_incidencia (id_categoria, nombre_categoria)
VALUES
(1, 'Hardware'),
(2, 'Software');

-- Insertar registros en la tabla nivel
INSERT INTO nivel (id_nivel, nombre_nivel)
VALUES
(1, 'Leve'),
(2, 'Moderada'),
(3, 'Crítica');

-- Insertar registros en la tabla area
INSERT INTO area (id_area, nombre_area)
VALUES
(1, 'Review'),
(2, 'Training');

-- Insertar registros en la tabla bloque_area
INSERT INTO bloque_area (id_bloque, nombre_bloque, fk_id_area)
VALUES
(1, 'Apolo', 2),
(2, 'Artemis', 2),
(3, 'Spuknik', 2),
(4, 'Skylab', 2),
(5, 'Corvus', 1),
(6, 'Endor', 1);

-- Insertar registros en la tabla inventario
INSERT INTO inventario (id_inventario, fk_id_bloque, computadores, teclados, mouse)
VALUES
(1, 1, 10, 20, 30),
(2, 2, 5, 10, 15),
(3, 3, 8, 12, 18),
(4, 4, 12, 24, 36),
(5, 5, 15, 30, 45),
(6, 6, 6, 12, 18);

-- Insertar registros en la tabla incidencias
INSERT INTO incidencias (id_inci, fk_id_trainer, fk_id_categoria, fk_id_nivel, fk_id_bloque_area, descripcion)
VALUES
(1, 1, 1, 2, 1, 'Problema con un portátil en Apolo'),
(2, 2, 2, 1, 3, 'Error de software en Spuknik'),
(3, 1, 1, 3, 4, 'Fallo crítico en Skylab'),
(4, 2, 1, 1, 5, 'Daño en equipo en Corvus'),
(5, 1, 2, 2, 2, 'Problema de software en Artemis');

SELECT * FROM inventario;