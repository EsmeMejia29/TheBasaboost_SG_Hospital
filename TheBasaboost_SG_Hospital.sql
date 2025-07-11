DROP DATABASE IF EXISTS TheBasaboost_SG_Hospital;
CREATE DATABASE TheBasaboost_SG_Hospital;
USE TheBasaboost_SG_Hospital;

------ CREACIÓN DE LA BASE DE DATOS ------
--- TABLAS:
CREATE TABLE MEDICO(
	id_medico SMALLINT PRIMARY KEY IDENTITY,
	nombre VARCHAR(25),
	apellido VARCHAR(25) NOT NULL,
	telefono INT,
	horario VARCHAR(50),
	email VARCHAR(40),
	id_especialidad SMALLINT
);

CREATE TABLE ESPECIALIDAD(
	id_especialidad SMALLINT PRIMARY KEY IDENTITY,
	especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE CITA(
	id_cita INT PRIMARY KEY,
	id_paciente INT NOT NULL,
	id_medico SMALLINT NOT NULL,
	id_estado SMALLINT NOT NULL,
	fecha_hora DATETIME NOT NULL,
);

CREATE TABLE ESTADO_CITA(
	id_estado SMALLINT PRIMARY KEY,
	estado VARCHAR(15) NOT NULL
);

CREATE TABLE RECETA(
	id_receta SMALLINT PRIMARY KEY IDENTITY,
	id_consulta INT,
	id_tratamiento INT,
	instrucciones VARCHAR(200)
);

CREATE TABLE CONSULTA(
	id_consulta INT PRIMARY KEY IDENTITY,
	id_cita INT,
	id_diagnostico INT,
	observaciones VARCHAR(250) NOT NULL,
	fecha_consulta DATE
);

CREATE TABLE DIAGNOSTICO(
	id_diagnostico INT PRIMARY KEY IDENTITY,
	diagnostico VARCHAR(75) NOT NULL
);

-- Intersección Consulta-Receta
CREATE TABLE CONSULTA_RECETA(
   	id_consulta INT NOT NULL,
   	id_receta SMALLINT NOT NULL,
  	PRIMARY KEY (id_consulta, id_receta),
    	FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta),
    	FOREIGN KEY (id_receta) REFERENCES RECETA(id_receta)
);

CREATE TABLE PACIENTE(
	id_paciente INT PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	dui VARCHAR(10) NOT NULL,
	fecha_nacimiento DATE,
	direccion VARCHAR(100),
	telefono INT,
	email VARCHAR(70),
	fecha_registro DATE,
	id_historial_medico INT
);

CREATE TABLE TRATAMIENTO(
	id_tratamiento INT PRIMARY KEY IDENTITY,
	duracion VARCHAR(20) NOT NULL,
	id_medicamento INT NOT NULL,
	id_dosis INT NOT NULL
);

CREATE TABLE MEDICAMENTO(
	id_medicamento INT PRIMARY KEY,
	medicamento VARCHAR(50)
);

CREATE TABLE DOSIS(
	id_dosis INT PRIMARY KEY,
	dosis VARCHAR(50)
);

CREATE TABLE HISTORIAL_MEDICO(
	id_historial_medico INT PRIMARY KEY,
	id_paciente INT,
	id_alergias SMALLINT,
	id_enfermedades_cronicas SMALLINT,
	antecedentes_familiares VARCHAR(200),
	fecha_registro DATE
);

CREATE TABLE ALERGIAS(
	id_alergias SMALLINT PRIMARY KEY,
	alergias VARCHAR(50)
);

CREATE TABLE ENFERMEDADES_CRONICAS(
	id_enfermedades_cronicas SMALLINT PRIMARY KEY,
	enfermedad_cronica VARCHAR(50)
);

-- FOREIGN KEYS:
-- PARA LA TABLA "MEDICO"
ALTER TABLE MEDICO ADD FOREIGN KEY(id_especialidad) REFERENCES ESPECIALIDAD(id_especialidad);

-- PARA LA TABLA "CITA"
ALTER TABLE CITA ADD FOREIGN KEY(id_paciente) REFERENCES PACIENTE(id_paciente);
ALTER TABLE CITA ADD FOREIGN KEY(id_medico) REFERENCES MEDICO(id_medico);
ALTER TABLE CITA ADD FOREIGN KEY(id_estado) REFERENCES ESTADO_CITA(id_estado);

-- PARA LA TABLA "RECETA"
ALTER TABLE RECETA ADD FOREIGN KEY(id_consulta) REFERENCES CONSULTA(id_consulta);
ALTER TABLE RECETA ADD FOREIGN KEY(id_tratamiento) REFERENCES TRATAMIENTO(id_tratamiento);

-- PARA LA TABLA INTERMEDIA "CONSULTA_RECETA"
ALTER TABLE CONSULTA_RECETA ADD FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta) ON DELETE CASCADE;
ALTER TABLE CONSULTA_RECETA ADD FOREIGN KEY (id_receta) REFERENCES RECETA(id_receta) ON DELETE CASCADE;

-- PARA LA TABLA "CONSULTA"
ALTER TABLE CONSULTA ADD FOREIGN KEY(id_cita) REFERENCES CITA(id_cita);
ALTER TABLE CONSULTA ADD FOREIGN KEY(id_diagnostico) REFERENCES DIAGNOSTICO(id_diagnostico);

-- PARA LA TABLA "PACIENTE"
ALTER TABLE PACIENTE ADD FOREIGN KEY(id_historial_medico) REFERENCES HISTORIAL_MEDICO(id_historial_medico);

-- PARA LA TABLA "TRATAMIENTO"
ALTER TABLE TRATAMIENTO ADD FOREIGN KEY(id_medicamento) REFERENCES MEDICAMENTO(id_medicamento);
ALTER TABLE TRATAMIENTO ADD FOREIGN KEY(id_dosis) REFERENCES DOSIS(id_dosis);

-- PARA LA TABLA "HISTORIAL_MEDICO"
ALTER TABLE HISTORIAL_MEDICO ADD FOREIGN KEY(id_paciente) REFERENCES PACIENTE(id_paciente);
ALTER TABLE HISTORIAL_MEDICO ADD FOREIGN KEY(id_alergias) REFERENCES ALERGIAS(id_alergias);
ALTER TABLE HISTORIAL_MEDICO ADD FOREIGN KEY(id_enfermedades_cronicas) REFERENCES ENFERMEDADES_CRONICAS(id_enfermedades_cronicas);
