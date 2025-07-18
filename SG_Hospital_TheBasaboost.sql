-------------------------------------------------------------------------------------
--Equipo: The basaboost--
---Estudiantes: 
---Kathleen Abigail Argueta Gómez
---Alejandro Javier Durón Rodríguez
---Lorena Esmeralda Mejía Ramos
---Reina Arely Sosa Mejía
---Iván Alessandro Vásquez Martínez
--------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS TheBasaboost_SG_Hospital;
CREATE DATABASE TheBasaboost_SG_Hospital;
USE TheBasaboost_SG_Hospital;

------ CREACIÓN DE LA BASE DE DATOS ------
--- TABLAS:
CREATE TABLE MEDICO(
	id_medico SMALLINT PRIMARY KEY IDENTITY,
	nombre VARCHAR(25),
	apellido VARCHAR(25) NOT NULL,
	telefono TINYINT,
	horario VARCHAR(50),
	email VARCHAR(40),
	id_especialidad SMALLINT
);

CREATE TABLE ESPECIALIDAD(
	id_especialidad SMALLINT PRIMARY KEY IDENTITY,
	especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE CITA(
	id_cita INT PRIMARY KEY IDENTITY,
	id_paciente INT NOT NULL,
	id_medico SMALLINT NOT NULL,
	id_estado SMALLINT NOT NULL,
	fecha_hora DATETIME NOT NULL,
);

CREATE TABLE ESTADO_CITA(
	id_estado SMALLINT PRIMARY KEY IDENTITY,
	estado VARCHAR(15) NOT NULL
);

CREATE TABLE CONSULTA(
	id_consulta INT PRIMARY KEY IDENTITY,
	id_cita INT,
	id_diagnostico SMALLINT,
	observaciones VARCHAR(250) NOT NULL,
	fecha_consulta DATE
);

CREATE TABLE DIAGNOSTICO(
	id_diagnostico SMALLINT PRIMARY KEY IDENTITY,
	diagnostico VARCHAR(75) NOT NULL
);

CREATE TABLE PACIENTE(
	id_paciente INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	dui VARCHAR(10) NOT NULL,
	fecha_nacimiento DATE,
	direccion VARCHAR(100),
	telefono INT,
	email VARCHAR(70),
	fecha_registro DATE
);

CREATE TABLE RECETA(
	id_receta INT PRIMARY KEY IDENTITY,
	id_consulta INT,
	id_medicamento INT,
	dosis VARCHAR(25),
	duracion VARCHAR(25),
	instrucciones VARCHAR(60)
);

CREATE TABLE MEDICAMENTO(
	id_medicamento INT PRIMARY KEY IDENTITY,
	medicamento VARCHAR(50)
);

CREATE TABLE HISTORIAL_MEDICO(
	id_historial_medico INT PRIMARY KEY IDENTITY,
	id_paciente INT,
	id_alergias SMALLINT,
	id_enfermedades_cronicas SMALLINT,
	antecedentes_familiares VARCHAR(200),
	fecha_registro DATE
);

CREATE TABLE ALERGIAS(
	id_alergias SMALLINT PRIMARY KEY IDENTITY,
	alergias VARCHAR(50)
);

CREATE TABLE ENFERMEDADES_CRONICAS(
	id_enfermedades_cronicas SMALLINT PRIMARY KEY IDENTITY,
	enfermedad_cronica VARCHAR(50)
);

-- FOREIGN KEYS ---
-- PARA LA TABLA "MEDICO"
ALTER TABLE MEDICO ADD FOREIGN KEY(id_especialidad) REFERENCES ESPECIALIDAD(id_especialidad);

-- PARA LA TABLA "CITA"
ALTER TABLE CITA ADD FOREIGN KEY(id_paciente) REFERENCES PACIENTE(id_paciente);
ALTER TABLE CITA ADD FOREIGN KEY(id_medico) REFERENCES MEDICO(id_medico);
ALTER TABLE CITA ADD FOREIGN KEY(id_estado) REFERENCES ESTADO_CITA(id_estado);

-- PARA LA TABLA "CONSULTA"
ALTER TABLE CONSULTA ADD FOREIGN KEY(id_cita) REFERENCES CITA(id_cita);
ALTER TABLE CONSULTA ADD FOREIGN KEY(id_diagnostico) REFERENCES DIAGNOSTICO(id_diagnostico);

-- PARA LA TABLA "RECETA"
ALTER TABLE RECETA ADD FOREIGN KEY(id_consulta) REFERENCES CONSULTA(id_consulta);
ALTER TABLE RECETA ADD FOREIGN KEY(id_medicamento) REFERENCES MEDICAMENTO(id_medicamento);

-- PARA LA TABLA "HISTORIAL_MEDICO"
ALTER TABLE HISTORIAL_MEDICO ADD FOREIGN KEY(id_paciente) REFERENCES PACIENTE(id_paciente);
ALTER TABLE HISTORIAL_MEDICO ADD FOREIGN KEY(id_alergias) REFERENCES ALERGIAS(id_alergias);
ALTER TABLE HISTORIAL_MEDICO ADD FOREIGN KEY(id_enfermedades_cronicas) REFERENCES ENFERMEDADES_CRONICAS(id_enfermedades_cronicas);

-------------------------------------------------------------------------------------------------------------------------------------
--- INSERCIONES ---
--------------------------------------------------
-- Inserciones de las tablas "hijas":

-- PARA LA TABLA "ESPECIALIDAD" (20 inserciones)
INSERT INTO ESPECIALIDAD(especialidad) VALUES
('Medicina interna'),
('Pediatría'),
('Cardiología'),
('Neurología'),
('Ginecología y Obstetricia'),
('Ortopedia y Traumatología'),
('Cirugía general'),
('Dermatología'),
('Oftalmología'),
('Otorrinolaringología'),
('Psiquiatría'),
('Endocrinología'),
('Urología'),
('Nefrología'),
('Gastroenterología'),
('Neumología'),
('Oncología'),
('Reumatología'),
('Anestesiología'),
('Medicina de emergencias');

-- PARA LA TABLA "ESTADO_CITA" (3 inserciones requeridas, pero se agregaron 2 para mayor realismo)
INSERT INTO estado_cita (estado) VALUES
('Pendiente'),
('Atendida'),
('Cancelada'),
('Reprogramada'),
('Urgente');

-- PARA LA TABLA "DIAGNOSTICO" (100 inserciones)
INSERT INTO DIAGNOSTICO(diagnostico) VALUES
('Infección respiratoria aguda'),
('Neumonía'),
('Asma'),
('EPOC'),
('Tuberculosis pulmonar'),
('Bronquitis'),
('Derrame pleural'),
('Fibrosis pulmonar'),
('Neumotórax'),
('Sinusitis'),
('Rinitis alérgica'),
('Apnea del sueño'),
('Infarto agudo de miocardio'),
('Insuficiencia cardíaca'),
('Hipertensión arterial'),
('Arritmia cardíaca'),
('Angina de pecho'),
('Trombosis venosa profunda'),
('Varices esofágicas'),
('Cardiopatía congénita'),
('Endocarditis'),
('Shock cardiogénico'),
('Gastritis'),
('Úlcera gástrica'),
('Hepatitis viral'),
('Cirrosis hepática'),
('Pancreatitis aguda'),
('Colecistitis'),
('Apendicitis aguda'),
('Enfermedad de Crohn'),
('Colitis ulcerativa'),
('Reflujo gastroesofágico'),
('Accidente cerebrovascular'),
('Epilepsia'),
('Alzheimer'),
('Parkinson'),
('Migraña'),
('Esclerosis múltiple'),
('Hernia discal'),
('Neuralgia'),
('Diabetes mellitus tipo 2'),
('Hipotiroidismo'),
('Hipertiroidismo'),
('Obesidad'),
('Gota'),
('Osteoporosis'),
('Síndrome metabólico'),
('Deficiencia de vitamina D'),
('Hipercolesterolemia'),
('Diabetes gestacional'),
('Cáncer de pulmón'),
('Cáncer de mama'),
('Cáncer de próstata'),
('Cáncer de colon'),
('Leucemia'),
('Linfoma'),
('Cáncer gástrico'),
('Cáncer de páncreas'),
('Cáncer de hígado'),
('Cáncer de piel'),
('Cáncer de vejiga'),
('Cáncer de tiroides'),
('Infección urinaria'),
('Insuficiencia renal crónica'),
('Litiasis renal'),
('Cistitis'),
('Nefropatía diabética'),
('Depresión mayor'),
('Trastorno de ansiedad'),
('Esquizofrenia'),
('Trastorno bipolar'),
('Trastorno obsesivo-compulsivo'),
('Demencia'),
('Embarazo normal'),
('Embarazo de alto riesgo'),
('Preeclampsia'),
('Endometriosis'),
('Mioma uterino'),
('Menopausia'),
('Dengue'),
('Zika'),
('Varicela'),
('Hepatitis B'),
('Tuberculosis'),
('VIH/SIDA'),
('Sepsis'),
('COVID-19'),
('Fractura de fémur'),
('Fractura de cadera'),
('Esguince cervical'),
('Traumatismo craneoencefálico'),
('Quemaduras graves'),
('Heridas penetrantes'),
('Psoriasis'),
('Dermatitis atópica'),
('Acné severo'),
('Urticaria'),
('Herpes zóster'),
('Melanoma'),
('Otro');

-- PARA LA TABLA "MEDICAMENTO" (100 inserciones)
INSERT INTO MEDICAMENTO(medicamento) VALUES
('Paracetamol'),
('Ibuprofeno'),
('Amoxicilina'),
('Azitromicina'),
('Metformina'),
('Insulina NPH'),
('Enalapril'),
('Losartán'),
('Amlodipina'),
('Furosemida'),
('Omeprazol'),
('Ranitidina'),
('Simvastatina'),
('Atorvastatina'),
('Clopidogrel'),
('Aspirina'),
('Warfarina'),
('Heparina'),
('Metoprolol'),
('Digoxina'),
('Levofloxacino'),
('Ciprofloxacino'),
('Doxiciclina'),
('Clindamicina'),
('Penicilina'),
('Gentamicina'),
('Amoxicilina clavulanato'),
('Sulfametoxazol trimetoprima'),
('Fluconazol'),
('Aciclovir'),
('Oseltamivir'),
('Prednisona'),
('Dexametasona'),
('Hidrocortisona'),
('Montelukast'),
('Salbutamol'),
('Bromuro de ipratropio'),
('Codeína'),
('Tramadol'),
('Morfina'),
('Gabapentina'),
('Carbamazepina'),
('Ácido valproico'),
('Clonazepam'),
('Diazepam'),
('Lorazepam'),
('Risperidona'),
('Olanzapina'),
('Sertralina'),
('Fluoxetina'),
('Amitriptilina'),
('Diclofenaco'),
('Naproxeno'),
('Meloxicam'),
('Colchicina'),
('Alopurinol'),
('Metotrexato'),
('Hidroxicloroquina'),
('Insulina glargina'),
('Glibenclamida'),
('Sitagliptina'),
('Ezetimiba'),
('Ácido fólico'),
('Hierro oral'),
('Vitamina D'),
('Cloruro de potasio'),
('Metronidazol'),
('Albendazol'),
('Ivermectina'),
('Rifampicina'),
('Isoniazida'),
('Cefalexina'),
('Ceftriaxona'),
('Vancomicina'),
('Meropenem'),
('Itraconazol'),
('Ketoconazol'),
('Voriconazol'),
('Lamivudina'),
('Tenofovir'),
('Interferón alfa'),
('Betametasona'),
('Teofilina'),
('Pregabalina'),
('Haloperidol'),
('Escitalopram'),
('Venlafaxina'),
('Celecoxib'),
('Pioglitazona'),
('Gemfibrozilo'),
('Cianocobalamina'),
('Calcio'),
('Mebendazol'),
('Cloroquina'),
('Cefuroxima'),
('Linezolid'),
('Nistatina'),
('Loratadina'),
('Cetirizina'),
('Metoclopramida'),
('Domperidona'),
('Loperamida'),
('Sulfato ferroso'),
('Polietilenglicol'),
('Bisacodilo');

-- PARA LA TABLA "ALERGIAS" (27 inserciones)
INSERT INTO ALERGIAS(alergias) VALUES
('Penicilina'),
('Polen'),
('Lácteos'),
('Mariscos'),
('Gluten'),
('Huevo'),
('Frutos secos'),
('Aspirina'),
('Sulfas'),
('Picaduras de abeja'),
('Latex'),
('Polvo'),
('Animales domésticos'),
('Moho'),
('Antiinflamatorios'),
('Colorantes alimentarios'),
('Cacahuate'),
('Soja'),
('Cítricos'),
('Medicamentos antiinflamatorios no esteroideos'),
('Perfumes'),
('Cloro'),
('Cosméticos'),
('Vacunas'),
('Plumas'),
('Fresas'),
('Otros'),
('Ninguna');

-- PARA LA TABLA "ENFERMEDADES_CRONICAS" (40 inserciones)
INSERT INTO enfermedades_cronicas (enfermedad_cronica) VALUES
('Diabetes mellitus'),
('Hipertensión arterial'),
('Asma'),
('Epoc'),
('Insuficiencia cardíaca'),
('Insuficiencia renal crónica'),
('Artritis reumatoide'),
('Lupus'),
('Enfermedad de crohn'),
('Colitis ulcerativa'),
('Epilepsia'),
('Enfermedad de parkinson'),
('Alzheimer'),
('Cáncer'),
('Fibromialgia'),
('Osteoporosis'),
('Migraña crónica'),
('Enfermedad coronaria'),
('Hipotiroidismo'),
('Hipertiroidismo'),
('Obesidad'),
('Hipercolesterolemia'),
('Trastorno bipolar'),
('Depresión mayor'),
('Trastorno obsesivo compulsivo'),
('Esquizofrenia'),
('Psoriasis'),
('Dermatitis atópica'),
('Esofagitis crónica'),
('Cirrosis hepática'),
('Hepatitis b crónica'),
('Hepatitis c crónica'),
('Anemia crónica'),
('Glaucoma'),
('Cataratas crónicas'),
('Insuficiencia venosa crónica'),
('Esclerosis múltiple'),
('Gota'),
('Valvulopatía'),
('Arritmia crónica'),
('Ninguna');

--------------------------------------------------
-- Inserciones de las tablas restantes:
-- PARA LA TABLA "MEDICO" (65 inserciones)
INSERT INTO MEDICO (nombre, apellido, telefono, horario, email, id_especialidad) VALUES
('Juan', 'Pérez López', 71239876, 'Lunes a Viernes 8:00-16:00', 'juan.perez@hospitalthebasaboost', 1),
('María', 'González Rodríguez', 62348765, 'Lunes a Sábado 9:00-17:00', 'maria.gonzalez@hospitalthebasaboost', 2),
('Carlos', 'Martínez Sánchez', 73451234, 'Martes a Domingo 10:00-18:00', 'carlos.martinez@hospitalthebasaboost', 3),
('Ana', 'López García', 84567890, 'Lunes a Viernes 7:00-15:00', 'ana.lopez@hospitalthebasaboost', 4),
('Luis', 'Rodríguez Pérez', 95678123, 'Miércoles a Domingo 12:00-20:00', 'luis.rodriguez@hospitalthebasaboost', 5),
('Laura', 'Sánchez Martín', 66789045, 'Lunes a Viernes 14:00-22:00', 'laura.sanchez@hospitalthebasaboost', 6),
('Pedro', 'Gómez Fernández', 77894567, 'Martes a Sábado 8:30-16:30', 'pedro.gomez@hospitalthebasaboost', 7),
('Sofía', 'Fernández Ruiz', 88901234, 'Lunes a Viernes 9:00-17:00', 'sofia.fernandez@hospitalthebasaboost', 8),
('Javier', 'Díaz Hernández', 79015678, 'Jueves a Lunes 11:00-19:00', 'javier.diaz@hospitalthebasaboost', 9),
('Elena', 'Moreno Jiménez', 60123489, 'Lunes a Viernes 13:00-21:00', 'elena.moreno@hospitalthebasaboost', 10),
('David', 'Álvarez Gómez', 71239876, 'Martes a Viernes 8:00-16:00', 'david.alvarez@hospitalthebasaboost', 11),
('Carmen', 'Romero Navarro', 82345671, 'Lunes a Sábado 10:00-18:00', 'carmen.romero@hospitalthebasaboost', 12),
('Pablo', 'Torres Molina', 93456782, 'Miércoles a Domingo 9:00-17:00', 'pablo.torres@hospitalthebasaboost', 13),
('Isabel', 'Suárez Ortega', 64567893, 'Lunes a Viernes 7:30-15:30', 'isabel.suarez@hospitalthebasaboost', 14),
('Francisco', 'Ramírez Delgado', 75678904, 'Martes a Sábado 12:00-20:00', 'francisco.ramirez@hospitalthebasaboost', 15),
('Teresa', 'Flores Vázquez', 86789015, 'Lunes a Viernes 14:30-22:30', 'teresa.flores@hospitalthebasaboost', 16),
('Antonio', 'Morales Serrano', 97890126, 'Jueves a Lunes 10:00-18:00', 'antonio.morales@hospitalthebasaboost', 17),
('Lucía', 'Ortega Castro', 68901237, 'Lunes a Viernes 8:00-16:00', 'lucia.ortega@hospitalthebasaboost', 18),
('Manuel', 'Delgado Méndez', 79012348, 'Martes a Domingo 9:00-17:00', 'manuel.delgado@hospitalthebasaboost', 19),
('Rosa', 'Vázquez Gil', 60123459, 'Lunes a Viernes 11:00-19:00', 'rosa.vazquez@hospitalthebasaboost', 20),
('Miguel', 'Navarro Blanco', 71234570, 'Miércoles a Sábado 8:30-16:30', 'miguel.navarro@hospitalthebasaboost', 1),
('Patricia', 'Gil Rubio', 82345681, 'Lunes a Viernes 13:30-21:30', 'patricia.gil@hospitalthebasaboost', 2),
('Jorge', 'Molina Medina', 93456792, 'Martes a Sábado 10:30-18:30', 'jorge.molina@hospitalthebasaboost', 3),
('Silvia', 'Castro Bravo', 64567803, 'Jueves a Lunes 12:00-20:00', 'silvia.castro@hospitalthebasaboost', 4),
('Alberto', 'Serrano Gallardo', 75678914, 'Lunes a Viernes 7:00-15:00', 'alberto.serrano@hospitalthebasaboost', 5),
('Nuria', 'Ruiz Herrera', 86789025, 'Martes a Domingo 9:00-17:00', 'nuria.ruiz@hospitalthebasaboost', 6),
('Fernando', 'Hernández Marín', 97890136, 'Lunes a Viernes 8:00-16:00', 'fernando.hernandez@hospitalthebasaboost', 7),
('Beatriz', 'Jiménez León', 68901247, 'Miércoles a Sábado 11:00-19:00', 'beatriz.jimenez@hospitalthebasaboost', 8),
('Raúl', 'García Peña', 79012358, 'Lunes a Viernes 14:00-22:00', 'raul.garcia@hospitalthebasaboost', 9),
('Olga', 'Martín Calvo', 60123469, 'Martes a Sábado 8:30-16:30', 'olga.martin@hospitalthebasaboost', 10),
('Sergio', 'Bravo Ibáñez', 71234580, 'Jueves a Lunes 10:00-18:00', 'sergio.bravo@hospitalthebasaboost', 11),
('Eva', 'Medina Santos', 82345691, 'Lunes a Viernes 7:30-15:30', 'eva.medina@hospitalthebasaboost', 12),
('Víctor', 'Gallardo Cruz', 93456702, 'Martes a Domingo 12:00-20:00', 'victor.gallardo@hospitalthebasaboost', 13),
('Alicia', 'León Gallego', 64567813, 'Lunes a Viernes 9:00-17:00', 'alicia.leon@hospitalthebasaboost', 14),
('Roberto', 'Peña Vidal', 75678924, 'Miércoles a Sábado 8:00-16:00', 'roberto.pena@hospitalthebasaboost', 15),
('Marina', 'Calvo Fuentes', 86789035, 'Lunes a Viernes 13:00-21:00', 'marina.calvo@hospitalthebasaboost', 16),
('Diego', 'Ibáñez Lozano', 97890146, 'Martes a Sábado 10:30-18:30', 'diego.ibanez@hospitalthebasaboost', 17),
('Claudia', 'Santos Méndez', 68901257, 'Jueves a Lunes 11:00-19:00', 'claudia.santos@hospitalthebasaboost', 18),
('Rubén', 'Cruz Pascual', 79012368, 'Lunes a Viernes 8:30-16:30', 'ruben.cruz@hospitalthebasaboost', 19),
('Natalia', 'Gallego Benítez', 60123479, 'Martes a Domingo 9:00-17:00', 'natalia.gallego@hospitalthebasaboost', 20),
('Héctor', 'Vidal Prieto', 71234590, 'Lunes a Viernes 14:00-22:00', 'hector.vidal@hospitalthebasaboost', 1),
('Cristina', 'Fuentes Velasco', 82345601, 'Miércoles a Sábado 8:00-16:00', 'cristina.fuentes@hospitalthebasaboost', 2),
('Adrián', 'Lozano Moya', 93456712, 'Jueves a Lunes 12:00-20:00', 'adrian.lozano@hospitalthebasaboost', 3),
('Mónica', 'Méndez Soria', 64567823, 'Lunes a Viernes 7:00-15:00', 'monica.mendez@hospitalthebasaboost', 4),
('Guillermo', 'Pascual Mora', 75678934, 'Martes a Sábado 10:00-18:00', 'guillermo.pascual@hospitalthebasaboost', 5),
('Lorena', 'Benítez Vicente', 86789045, 'Lunes a Viernes 13:30-21:30', 'lorena.benitez@hospitalthebasaboost', 6),
('Ángel', 'Prieto Carmona', 97890156, 'Miércoles a Domingo 9:00-17:00', 'angel.prieto@hospitalthebasaboost', 7),
('Verónica', 'Velasco Paredes', 68901267, 'Lunes a Viernes 8:30-16:30', 'veronica.velasco@hospitalthebasaboost', 8),
('Gabriel', 'Moya Rivas', 79012378, 'Martes a Sábado 11:00-19:00', 'gabriel.moya@hospitalthebasaboost', 9),
('Paula', 'Soria Iglesias', 60123489, 'Jueves a Lunes 10:00-18:00', 'paula.soria@hospitalthebasaboost', 10),
('Iván', 'Mora Cortés', 71234500, 'Lunes a Viernes 14:00-22:00', 'ivan.mora@hospitalthebasaboost', 11),
('Aurora', 'Vicente Marcos', 82345611, 'Martes a Domingo 8:00-16:00', 'aurora.vicente@hospitalthebasaboost', 12),
('Marcos', 'Carmona Sanz', 93456722, 'Miércoles a Sábado 9:00-17:00', 'marcos.carmona@hospitalthebasaboost', 13),
('Lidia', 'Paredes Nieto', 64567833, 'Lunes a Viernes 7:30-15:30', 'lidia.paredes@hospitalthebasaboost', 14),
('Ricardo', 'Rivas Guzmán', 75678944, 'Jueves a Lunes 12:00-20:00', 'ricardo.rivas@hospitalthebasaboost', 15),
('Nora', 'Iglesias Redondo', 86789055, 'Lunes a Viernes 8:00-16:00', 'nora.iglesias@hospitalthebasaboost', 16),
('Samuel', 'Cortés Pastor', 97890166, 'Martes a Sábado 10:30-18:30', 'samuel.cortes@hospitalthebasaboost', 17),
('Ester', 'Marcos Soto', 68901277, 'Miércoles a Domingo 11:00-19:00', 'ester.marcos@hospitalthebasaboost', 18),
('Hugo', 'Sanz Muñoz', 79012388, 'Lunes a Viernes 13:00-21:00', 'hugo.sanz@hospitalthebasaboost', 19),
('Celeste', 'Nieto Gil', 60123499, 'Martes a Sábado 8:30-16:30', 'celeste.nieto@hospitalthebasaboost', 20),
('Arturo', 'Guzmán Ferrer', 71234510, 'Jueves a Lunes 10:00-18:00', 'arturo.guzman@hospitalthebasaboost', 1),
('Diana', 'Redondo Arias', 82345621, 'Lunes a Viernes 9:00-17:00', 'diana.redondo@hospitalthebasaboost', 2),
('Félix', 'Pastor Vidal', 93456732, 'Martes a Domingo 12:00-20:00', 'felix.pastor@hospitalthebasaboost', 3),
('Julia', 'Soto Campos', 64567843, 'Miércoles a Sábado 8:00-16:00', 'julia.soto@hospitalthebasaboost', 4),
('Óscar', 'Muñoz Calvo', 75678954, 'Lunes a Viernes 14:00-22:00', 'oscar.munoz@hospitalthebasaboost', 5);

-- PARA LA TABLA "PACIENTE" (65 inserciones)
INSERT INTO PACIENTE(nombre, apellido, dui, fecha_nacimiento, direccion, telefono, email, fecha_registro) VALUES
('Carlos Antonio', 'Hernández Martínez', '04567890-1', '1985-03-15', 'Colonia Escalón, Calle Los Pinos #123, San Salvador', 71234567, 'carlos.hernandez@gmail.com', '2020-05-10'),
('María Guadalupe', 'García de Rodríguez', '05678901-2', '1992-07-22', 'Residencial Las Cascadas, Bloque 5 #22, Santa Tecla', 78901234, 'mariag.rodriguez@hotmail.com', '2021-02-18'),
('José Roberto', 'Flores Sánchez', '06789012-3', '1978-11-30', 'Colonia San Benito, Av. Las Camelias #45, San Salvador', 62345678, 'joseflores30@yahoo.com', '2019-11-05'),
('Ana Isabel', 'Ramírez Vásquez', '07890123-4', '1989-05-17', 'Colonia Miramonte, Pasaje 3 #12, San Salvador', 71456789, 'anaramirez89@outlook.com', '2022-01-15'),
('Luis Fernando', 'Martínez Peña', '08901234-5', '1995-09-08', 'Colonia Flor Blanca, Calle La Mascota #67, San Salvador', 78567890, 'luisfm95@gmail.com', '2021-07-22'),
('Sofía Alejandra', 'Reyes de Díaz', '09012345-6', '1982-12-25', 'Colonia San Francisco, Av. Olímpica #34, San Salvador', 65678901, 'reyesofia@gmail.com', '2020-03-30'),
('Juan Carlos', 'Portillo Gómez', '01234567-8', '1975-04-12', 'Colonia Médica, Calle Dr. Cisneros #15, San Salvador', 72789012, 'jcportillo75@yahoo.com', '2018-09-14'),
('Karla Patricia', 'López Méndez', '02345678-9', '1990-08-19', 'Colonia Lomas de San Francisco, Casa #8, Antiguo Cuscatlán', 69890123, 'karlalopez.mendez@gmail.com', '2021-04-05'),
('Miguel Ángel', 'Serrano Castro', '03456789-0', '1987-01-31', 'Colonia Las Margaritas, Calle Los Almendros #56, Soyapango', 73901234, 'miguel.serrano87@hotmail.com', '2020-11-20'),
('Carmen Elena', 'Villalta de Romero', '04567890-1', '1983-06-14', 'Colonia La Sultana, Residencial Altavista #3, San Salvador', 76012345, 'carmen.villalta@gmail.com', '2019-08-07'),
('Francisco Javier', 'Quintanilla Rivas', '05678901-2', '1993-10-27', 'Colonia San Jacinto, Av. Los Próceres #78, San Salvador', 67123456, 'fjquintanilla@outlook.com', '2022-02-28'),
('Rosa María', 'Guardado de Alvarado', '06789012-3', '1979-02-09', 'Colonia La Rábida, Calle La Ceiba #23, San Salvador', 72234567, 'rosamaria.g79@gmail.com', '2018-12-10'),
('Oscar Armando', 'Chávez Henríquez', '07890123-4', '1986-07-03', 'Colonia Santa Anita, Pasaje 5 #11, Ilopango', 78345678, 'oachavez86@yahoo.com', '2021-05-17'),
('Verónica Beatriz', 'Escobar Campos', '08901234-5', '1994-04-18', 'Colonia Monserrat, Calle Los Robles #45, San Salvador', 69456789, 'veronica.escobar94@gmail.com', '2022-03-01'),
('Ricardo José', 'Guzmán Arévalo', '09012345-6', '1981-09-22', 'Colonia Las Palmas, Av. Las Gardenias #67, San Salvador', 71567890, 'ricardo.guzman81@hotmail.com', '2020-06-15'),
('Silvia Eugenia', 'Morán de Solís', '01234567-8', '1976-12-05', 'Colonia San Mateo, Casa #12, Antiguo Cuscatlán', 78678901, 'silviamoran.solis@gmail.com', '2019-04-22'),
('Mario Ernesto', 'Cáceres Fuentes', '02345678-9', '1988-03-28', 'Colonia La Cima II, Calle Los Pinos #89, San Salvador', 65789012, 'mario.caceres88@outlook.com', '2021-08-30'),
('Patricia Lorena', 'Aguilar Salazar', '03456789-0', '1991-11-11', 'Colonia La Mascota, Residencial Las Acacias #4, San Salvador', 72890123, 'patricia.aguilar91@gmail.com', '2022-01-05'),
('Jorge Alberto', 'Mejía Rosales', '04567890-1', '1984-08-16', 'Colonia San Luis, Av. Los Sisimiles #56, Santa Tecla', 79901234, 'jorgemejia84@yahoo.com', '2020-09-12'),
('Ana Lucía', 'Castro de Herrera', '05678901-2', '1996-05-29', 'Colonia Escalón, Calle La Reforma #78, San Salvador', 66012345, 'analuciacastro96@gmail.com', '2022-04-18'),
('Roberto Carlos', 'Díaz Mendoza', '06789012-3', '1977-10-02', 'Colonia Las Delicias, Pasaje 7 #34, San Salvador', 73123456, 'robertodiaz77@hotmail.com', '2019-07-25'),
('Gladys Mercedes', 'Ponce de Rivera', '07890123-4', '1980-01-15', 'Colonia San José, Calle Los Laureles #12, Mejicanos', 78234567, 'gladysponce80@gmail.com', '2020-12-08'),
('José Luis', 'Rivas Bonilla', '08901234-5', '1997-06-20', 'Colonia La Esperanza, Bloque 3 #45, San Salvador', 69345678, 'joseluis.rivas97@outlook.com', '2022-05-22'),
('Sara Elizabeth', 'Gómez de Torres', '09012345-6', '1983-03-07', 'Colonia La Sultana, Residencial Los Pinos #6, San Salvador', 71456789, 'sara.gomez83@gmail.com', '2021-01-14'),
('Alberto Enrique', 'Torres Marroquín', '01234567-8', '1974-12-24', 'Colonia San Benito, Av. Las Magnolias #56, San Salvador', 78567890, 'alberto.torres74@yahoo.com', '2018-11-30'),
('Lucía Margarita', 'Arévalo de Jiménez', '02345678-9', '1989-09-17', 'Colonia Flor Blanca, Calle La Mascota #89, San Salvador', 65678901, 'lucia.arevalo89@gmail.com', '2021-06-05'),
('Manuel de Jesús', 'Jiménez Alas', '03456789-0', '1992-04-10', 'Colonia San Francisco, Av. Olímpica #23, San Salvador', 72789012, 'manuel.jimenez92@hotmail.com', '2022-02-15'),
('Claudia Maricela', 'Orellana Sánchez', '04567890-1', '1986-07-23', 'Colonia Las Margaritas, Calle Los Almendros #34, Soyapango', 79890123, 'claudiaorellana86@gmail.com', '2020-08-19'),
('Fernando Antonio', 'Salazar Ruíz', '05678901-2', '1979-02-14', 'Colonia Escalón, Calle Los Pinos #67, San Salvador', 66901234, 'fernando.salazar79@outlook.com', '2019-05-28'),
('María del Carmen', 'Vásquez de Domínguez', '06789012-3', '1995-11-27', 'Colonia La Rábida, Calle La Ceiba #45, San Salvador', 73012345, 'mariac.vasquez95@gmail.com', '2022-03-10'),
('Raúl Ernesto', 'Domínguez Mendoza', '07890123-4', '1981-08-08', 'Colonia San Jacinto, Av. Los Próceres #12, San Salvador', 78123456, 'raul.dominguez81@yahoo.com', '2020-10-17'),
('Rosa Isela', 'Mendoza de Cabrera', '08901234-5', '1978-05-01', 'Colonia Monserrat, Calle Los Robles #78, San Salvador', 69234567, 'rosa.mendoza78@gmail.com', '2019-09-22'),
('Eduardo José', 'Cabrera Portillo', '09012345-6', '1993-12-14', 'Colonia Las Palmas, Av. Las Gardenias #23, San Salvador', 71345678, 'eduardo.cabrera93@hotmail.com', '2021-12-05'),
('Marta Liliana', 'Portillo de Guevara', '01234567-8', '1984-09-27', 'Colonia San Mateo, Casa #45, Antiguo Cuscatlán', 78456789, 'martal.portillo84@gmail.com', '2020-07-30'),
('Alfredo René', 'Guevara Chávez', '02345678-9', '1977-04-10', 'Colonia La Cima II, Calle Los Pinos #56, San Salvador', 65567890, 'alfredo.guevara77@outlook.com', '2018-08-12'),
('Julia Elena', 'Chávez de Romero', '03456789-0', '1990-01-23', 'Colonia La Mascota, Residencial Las Acacias #7, San Salvador', 72678901, 'julia.chavez90@gmail.com', '2021-11-18'),
('Moisés Israel', 'Romero Alas', '04567890-1', '1985-06-06', 'Colonia San Luis, Av. Los Sisimiles #34, Santa Tecla', 79789012, 'moises.romero85@yahoo.com', '2019-10-25'),
('Diana Carolina', 'Alas de Hernández', '05678901-2', '1998-03-19', 'Colonia Escalón, Calle La Reforma #12, San Salvador', 66890123, 'diana.alas98@gmail.com', '2022-04-30');

-- PARA LA TABLA "CITA" (65 inserciones)
INSERT INTO CITA(id_paciente, id_medico, id_estado, fecha_hora) VALUES
(1, 12, 1, '2023-01-05 09:00:00'),
(2, 23, 2, '2023-01-07 10:30:00'),
(3, 34, 3, '2023-01-10 14:00:00'),
(4, 45, 2, '2023-01-12 11:15:00'),
(5, 56, 1, '2023-01-15 08:45:00'),
(6, 7, 2, '2023-01-18 13:30:00'),
(7, 18, 4, '2023-01-20 16:00:00'),
(8, 29, 2, '2023-01-23 09:30:00'),
(9, 40, 1, '2023-01-25 10:00:00'),
(10, 51, 2, '2023-01-28 15:45:00'),
(11, 2, 3, '2023-02-01 11:30:00'),
(12, 13, 2, '2023-02-03 14:15:00'),
(13, 24, 1, '2023-02-06 08:30:00'),
(14, 35, 5, '2023-02-08 17:00:00'),
(15, 46, 2, '2023-02-11 10:45:00'),
(16, 57, 1, '2023-02-14 13:00:00'),
(17, 8, 2, '2023-02-17 09:15:00'),
(18, 19, 3, '2023-02-20 16:30:00'),
(19, 30, 2, '2023-02-22 11:00:00'),
(20, 41, 1, '2023-02-25 14:45:00'),
(21, 52, 4, '2023-02-28 08:00:00'),
(22, 3, 2, '2023-03-03 15:15:00'),
(23, 14, 1, '2023-03-06 10:30:00'),
(24, 25, 2, '2023-03-09 13:45:00'),
(25, 36, 3, '2023-03-12 09:00:00'),
(26, 47, 2, '2023-03-15 16:30:00'),
(27, 58, 1, '2023-03-18 11:15:00'),
(28, 9, 5, '2023-03-21 14:00:00'),
(29, 20, 2, '2023-03-24 08:45:00'),
(30, 31, 1, '2023-03-27 10:30:00'),
(31, 42, 2, '2023-03-30 15:00:00'),
(32, 53, 3, '2023-04-02 09:45:00'),
(33, 4, 2, '2023-04-05 13:30:00'),
(34, 15, 1, '2023-04-08 16:15:00'),
(35, 26, 4, '2023-04-11 11:00:00'),
(36, 37, 2, '2023-04-14 08:30:00'),
(37, 48, 1, '2023-04-17 14:45:00'),
(38, 59, 2, '2023-04-20 10:15:00'),
(1, 10, 3, '2023-04-23 15:30:00'),
(2, 21, 2, '2023-04-26 09:00:00'),
(3, 32, 1, '2023-04-29 13:15:00'),
(4, 43, 5, '2023-05-02 16:45:00'),
(5, 54, 2, '2023-05-05 11:30:00'),
(6, 5, 1, '2023-05-08 08:15:00'),
(1, 16, 2, '2023-05-11 14:30:00'),
(5, 27, 3, '2023-05-14 10:00:00'),
(9, 38, 2, '2023-05-17 15:15:00'),
(10, 49, 1, '2023-05-20 09:45:00'),
(11, 60, 4, '2023-05-23 13:00:00'),
(20, 11, 2, '2023-05-26 16:30:00'),
(13, 22, 1, '2023-05-29 11:15:00'),
(5, 33, 2, '2023-06-01 08:00:00'),
(2, 44, 3, '2023-06-04 14:45:00'),
(5, 55, 2, '2023-06-07 10:30:00'),
(17, 6, 1, '2023-06-10 15:00:00'),
(18, 17, 5, '2023-06-13 09:15:00'),
(19, 28, 2, '2023-06-16 13:30:00'),
(20, 39, 1, '2023-06-19 16:45:00'),
(8, 50, 2, '2023-06-22 11:00:00'),
(10, 1, 3, '2023-06-25 08:30:00'),
(23, 12, 2, '2023-06-28 14:00:00'),
(4, 23, 1, '2023-07-01 10:15:00'),
(25, 34, 4, '2023-07-04 15:30:00'),
(26, 45, 2, '2023-07-07 09:45:00'),
(4, 56, 1, '2023-07-10 13:00:00');

-- PARA LA TABLA "CONSULTA" (65 inserciones)
INSERT INTO CONSULTA(id_cita, id_diagnostico, observaciones, fecha_consulta) VALUES
(2, 15, 'Paciente presenta fiebre alta y dolor de garganta. Se recomienda reposo e hidratación.', '2023-01-07'),
(4, 28, 'Control de presión arterial. Valores dentro de rangos normales.', '2023-01-12'),
(5, 7, 'Dolor abdominal. Se sospecha gastritis. Solicitar endoscopia.', '2023-01-15'),
(6, 42, 'Paciente con diabetes tipo 2. Ajustar dosis de insulina.', '2023-01-18'),
(8, 63, 'Ansiedad generalizada. Iniciar terapia cognitivo-conductual.', '2023-01-23'),
(10, 89, 'Embarazo de alto riesgo. Control ecográfico mensual.', '2023-01-28'),
(12, 5, 'Tuberculosis pulmonar confirmada. Iniciar tratamiento RIPE.', '2023-02-03'),
(14, 37, 'Migraña crónica. Cambiar medicación preventiva.', '2023-02-08'),
(16, 71, 'Fractura de fémur. Requiere cirugía ortopédica.', '2023-02-14'),
(18, 22, 'Endocarditis bacteriana. Hospitalización inmediata.', '2023-02-20'),
(20, 3, 'Asma bronquial. Agudización por alergias estacionales.', '2023-02-25'),
(22, 50, 'Cáncer de mama en remisión. Control anual.', '2023-03-03'),
(24, 18, 'Varices esofágicas. Realizar ligadura endoscópica.', '2023-03-09'),
(26, 94, 'Psoriasis en placas. Tratamiento tópico indicado.', '2023-03-15'),
(28, 66, 'Insuficiencia renal crónica. Ajustar diálisis.', '2023-03-21'),
(30, 8, 'Fibrosis pulmonar. Oxigenoterapia continua.', '2023-03-27'),
(32, 45, 'Hipotiroidismo. Aumentar dosis de levotiroxina.', '2023-04-02'),
(34, 12, 'Apnea del sueño. Indicado uso de CPAP.', '2023-04-08'),
(36, 77, 'Dermatitis atópica severa. Derivar a dermatología.', '2023-04-14'),
(38, 31, 'Hepatitis B crónica. Control de carga viral.', '2023-04-20'),
(40, 9, 'Neumotórax espontáneo. Requiere drenaje pleural.', '2023-04-26'),
(42, 55, 'Cáncer de próstata. Iniciar radioterapia.', '2023-05-02'),
(44, 24, 'Úlcera gástrica. Confirmar H. pylori.', '2023-05-08'),
(46, 68, 'Depresión mayor. Ajustar antidepresivos.', '2023-05-14'),
(48, 83, 'COVID-19 persistente. Rehabilitación pulmonar.', '2023-05-20'),
(50, 1, 'Infección respiratoria aguda. Antibiótico indicado.', '2023-05-26'),
(52, 36, 'Parkinson. Optimizar medicación dopaminérgica.', '2023-06-01'),
(54, 60, 'Litiasis renal. Litotricia extracorpórea.', '2023-06-07'),
(56, 97, 'Quemaduras graves. Derivar a unidad especializada.', '2023-06-13'),
(58, 14, 'Insuficiencia cardíaca. Restricción hídrica.', '2023-06-19'),
(60, 27, 'Pancreatitis aguda. Ayuno y soporte IV.', '2023-06-25'),
(62, 41, 'Diabetes mellitus tipo 2 descompensada.', '2023-07-01'),
(64, 72, 'Traumatismo craneoencefálico leve. Observación.', '2023-07-07'),
(1, 19, 'Cardiopatía congénita. Control ecocardiográfico.', '2023-01-05'),
(3, 33, 'Accidente cerebrovascular. Rehabilitación.', '2023-01-10'),
(7, 47, 'Cáncer de colon. Estadificación requerida.', '2023-01-20'),
(9, 61, 'Infección urinaria recurrente. Urocultivo.', '2023-01-25'),
(11, 75, 'Mioma uterino sintomático. Opciones quirúrgicas.', '2023-02-01'),
(13, 2, 'Neumonía bacteriana. Antibiótico IV.', '2023-02-06'),
(15, 26, 'Cirrosis hepática Child-Pugh B.', '2023-02-11'),
(17, 40, 'Deficiencia de vitamina D. Suplementación.', '2023-02-17'),
(19, 54, 'Cáncer de pulmón. Biopsia pendiente.', '2023-02-22'),
(21, 70, 'Embarazo normal. Control prenatal.', '2023-02-28'),
(23, 85, 'Herpes zóster. Tratamiento antiviral.', '2023-03-06'),
(25, 99, 'Otro: Síndrome vertiginoso. Videonistagmografía.', '2023-03-12'),
(27, 11, 'Rinitis alérgica. Inmunoterapia indicada.', '2023-03-18'),
(29, 35, 'Osteoporosis. Iniciar bisfosfonatos.', '2023-03-24'),
(31, 49, 'Leucemia linfoide aguda. Quimioterapia.', '2023-03-30'),
(33, 64, 'Demencia vascular. Soporte familiar.', '2023-04-05'),
(35, 80, 'Menopausia. Terapia hormonal discutida.', '2023-04-11'),
(37, 95, 'Melanoma. Exéresis completa.', '2023-04-17'),
(39, 6, 'Bronquitis aguda. Sintomáticos.', '2023-04-23'),
(41, 21, 'Hipertensión arterial resistente.', '2023-04-29'),
(43, 44, 'Hipertiroidismo. Metimazol ajustado.', '2023-05-05'),
(45, 59, 'Nefropatía diabética. Control estricto.', '2023-05-11'),
(47, 74, 'Endometriosis. Laparoscopia diagnóstica.', '2023-05-17'),
(49, 88, 'Dengue con signos de alarma. Hidratación.', '2023-05-23'),
(51, 4, 'EPOC. Agudización por infección.', '2023-05-29'),
(53, 29, 'Hepatitis viral. Serologías pendientes.', '2023-06-04'),
(55, 43, 'Obesidad mórbida. Enfoque multidisciplinario.', '2023-06-10'),
(57, 58, 'Esquizofrenia. Estabilizar antipsicóticos.', '2023-06-16'),
(59, 73, 'Preeclampsia. Monitoreo fetal.', '2023-06-22'),
(61, 87, 'Zika. Reposo y control neurológico.', '2023-06-28'),
(63, 10, 'Sinusitis crónica. Cirugía recomendada.', '2023-07-04'),
(65, 25, 'Colecistitis. Colecistectomía programada.', '2023-07-10');

-- PARA LA TABLA "RECETA" (65 inserciones)
INSERT INTO RECETA(id_consulta, id_medicamento, dosis, duracion, instrucciones) VALUES
(1, 1, '500 mg', 'Cada 8 horas x 7 días', 'Tomar con alimentos'),
(1, 3, '1 g', 'Cada 12 horas x 10 días', 'Completar tratamiento'),
(2, 12, '20 mg', 'Cada 24 horas x 30 días', 'Antes del desayuno'),
(5, 7, '40 mg', 'Cada 12 horas x 14 días', 'Evitar alcohol'),
(6, 5, '850 mg', 'Cada 12 horas x permanente', 'Controlar glucemia'),
(12, 8, '50 mg', 'Cada 24 horas x permanente', 'Monitorear presión'),
(15, 47, '100 mg', 'Cada 24 horas x 30 días', 'No suspender abruptamente'),
(8, 2, '400 mg', 'Cada 8 horas x 5 días', 'Solo si hay dolor'),
(20, 53, '10 mg', 'Cada 24 horas x 7 días', 'Con leche'),
(18, 49, '50 mg', 'Cada 24 horas x 60 días', 'Evaluar efecto en 4 semanas'),
(25, 41, '200 mg', 'Cada 12 horas x 30 días', 'No manejar maquinaria'),
(3, 15, '5 mg', 'Cada 6 horas x 3 días', 'Para mareos'),
(7, 22, '10 UI', 'Cada 24 horas x permanente', 'Inyectable subcutáneo'),
(9, 30, '150 mg', 'Cada 24 horas x 7 días', 'Antiviral'),
(11, 6, '5 mg', 'Cada 8 horas x 10 días', 'Insulina rápida'),
(13, 18, '2.5 mg', 'Cada 24 horas x 90 días', 'Anticoagulante'),
(17, 33, '20 mg', 'Cada 12 horas x 14 días', 'Protector gástrico'),
(22, 55, '500 mcg', 'Cada 24 horas x permanente', 'Suplemento'),
(28, 9, '1 mg', 'Cada 8 horas x 5 días', 'Para náuseas'),
(31, 26, '75 mg', 'Cada 24 horas x 30 días', 'Antiagregante'),
(35, 61, '1 comp', 'Cada 24 horas x 60 días', 'Hierro'),
(40, 14, '40 mg', 'Cada 24 horas x 30 días', 'Estatinas'),
(44, 37, '10 mg', 'Cada 8 horas x 7 días', 'Analgésico'),
(49, 68, '1 g', 'Cada 6 horas x 5 días', 'Antipirético'),
(52, 80, '100 mg', 'Cada 24 horas x 30 días', 'Anticonvulsivo'),
(58, 95, '250 mg', 'Cada 12 horas x 10 días', 'Antibiótico'),
(4, 4, '500 mg', 'Cada 6 horas x 7 días', 'Para infección urinaria'),
(10, 19, '25 mg', 'Cada 24 horas x 5 días', 'Corticoide'),
(16, 27, '1 mg', 'Cada 12 horas x 3 días', 'Antiemético'),
(21, 35, '50 mg', 'Cada 8 horas x 10 días', 'Antifúngico'),
(26, 44, '20 mg', 'Cada 24 horas x 7 días', 'Antihipertensivo'),
(32, 58, '5 mg', 'Cada 6 horas x 5 días', 'Para alergia'),
(38, 72, '10 mg', 'Cada 24 horas x 30 días', 'Antidepresivo'),
(45, 88, '400 mg', 'Cada 24 horas x 3 días', 'Antipalúdico'),
(51, 99, '1 tableta', 'Cada 8 horas x 5 días', 'Laxante'),
(60, 16, '0.5 mg', 'Cada 12 horas x 7 días', 'Sedante'),
(14, 10, '25 mg', 'Cada 24 horas x permanente', 'Diurético'),
(19, 29, '100 mg', 'Cada 24 horas x permanente', 'Tiroides'),
(24, 42, '5 mg', 'Cada 24 horas x permanente', 'Broncodilatador'),
(30, 60, '50 mg', 'Cada 24 horas x permanente', 'Neuroprotector'),
(36, 74, '2 mg', 'Cada 24 horas x permanente', 'Antipsicótico'),
(42, 13, '75 mg', 'Cada 24 horas x permanente', 'Antiinflamatorio'),
(47, 31, '200 mg', 'Cada 24 horas x permanente', 'Antiviral VIH'),
(53, 66, '1 mg', 'Cada 24 horas x permanente', 'Vitamina B12'),
(57, 78, '10 mg', 'Cada 24 horas x permanente', 'Antidiabético'),
(63, 92, '40 mg', 'Cada 24 horas x permanente', 'Protector óseo'),
(23, 11, '500 mcg', 'Cada 24 horas x 30 días', 'Quimioterapia'),
(29, 24, '5 mg', 'Cada 12 horas x 21 días', 'Hormonal'),
(34, 45, '250 mg', 'Cada 24 horas x 10 días', 'Antibiótico IV'),
(39, 56, '1 mg', 'Cada 24 horas x permanente', 'Inmunosupresor'),
(43, 67, '10 mg', 'Cada 8 horas x 5 días', 'Antimigrañoso'),
(48, 79, '20 mg', 'Cada 24 horas x 30 días', 'Antirreumático'),
(54, 89, '100 mg', 'Cada 12 horas x 7 días', 'Antiviral herpes'),
(59, 94, '1 aplicación', 'Cada 12 horas x 14 días', 'Tópico'),
(62, 17, '50 mg', 'Cada 24 horas x 30 días', 'Anticoagulante'),
(65, 28, '10 mg', 'Cada 24 horas x permanente', 'Antihipertensivo')

-- PARA LA TABLA "HISTORIAL_MEDICO" (65 inserciones)
INSERT INTO HISTORIAL_MEDICO(id_paciente, id_alergias, id_enfermedades_cronicas, antecedentes_familiares, fecha_registro) VALUES
(1, 1, NULL, 'Padre con hipertensión, madre con diabetes', '2020-05-10'),
(2, 3, 1, 'Abuela materna con cáncer de mama', '2021-02-18'),
(3, 5, 3, 'Padre y abuelo paterno con EPOC', '2019-11-05'),
(4, 8, NULL, 'Madre con lupus', '2022-01-15'),
(5, 10, 5, 'Sin antecedentes familiares relevantes', '2021-07-22'),
(6, NULL, 2, 'Padres con obesidad', '2020-03-30'),
(7, NULL, 4, 'Hermano con asma', '2018-09-14'),
(8, NULL, 6, 'Madre con artritis reumatoide', '2021-04-05'),
(9, NULL, 7, 'Padre con Alzheimer', '2020-11-20'),
(10, NULL, 8, 'Abuelo con Parkinson', '2019-08-07'),
(11, 2, 9, 'Familia con historial cardíaco', '2022-02-28'),
(12, 4, 10, 'Padre con diabetes tipo 2', '2018-12-10'),
(13, 6, 11, 'Madre con cáncer de colon', '2021-05-17'),
(14, 7, 12, 'Hermano con esquizofrenia', '2022-03-01'),
(15, 9, 13, 'Abuela con osteoporosis', '2020-06-15'),
(16, NULL, 14, 'Padre con hepatitis B crónica', '2019-04-22'),
(17, 11, NULL, 'Madre con migraña crónica', '2021-08-30'),
(18, NULL, 15, 'Sin antecedentes', '2022-01-05'),
(19, 12, 16, 'Padre con VIH/SIDA', '2020-09-12'),
(20, NULL, 17, 'Madre con psoriasis', '2022-04-18'),
(21, 13, NULL, 'Abuelo con demencia', '2019-07-25'),
(22, NULL, 18, 'Padre con gota', '2020-12-08'),
(23, 14, 19, 'Madre con esclerosis múltiple', '2022-05-22'),
(24, NULL, 20, 'Hermano con leucemia', '2021-01-14'),
(25, 15, NULL, 'Padre con enfisema', '2018-11-30'),
(26, NULL, 21, 'Madre con fibromialgia', '2021-06-05'),
(27, 16, NULL, 'Sin antecedentes', '2022-02-15'),
(28, NULL, 22, 'Padre con cáncer de próstata', '2020-08-19'),
(29, 17, 23, 'Madre con colitis ulcerativa', '2019-05-28'),
(30, NULL, 24, 'Abuela con glaucoma', '2022-03-10'),
(31, NULL, NULL, 'Padre con infarto a los 50 años', '2020-10-17'),
(32, NULL, NULL, 'Madre con cáncer de ovario', '2019-09-22'),
(33, NULL, NULL, 'Hermano con diabetes tipo 1', '2021-12-05'),
(34, NULL, NULL, 'Abuelo con enfermedad de Crohn', '2020-07-30'),
(35, NULL, NULL, 'Sin antecedentes', '2018-08-12'),
(36, NULL, NULL, 'Padre con aneurisma cerebral', '2021-11-18'),
(37, NULL, NULL, 'Madre con esclerodermia', '2020-11-20'),
(38, NULL, NULL, 'Hermana con lupus', '2022-04-30'),
(39, NULL, NULL, 'Padre con melanoma', '2020-04-15'),
(40, NULL, NULL, 'Madre con Alzheimer precoz', '2021-09-10'),
(41, NULL, NULL, 'Abuelo con EPOC', '2022-06-20'),
(42, NULL, NULL, 'Sin antecedentes', '2020-02-25'),
(43, NULL, NULL, 'Padre con cirrosis hepática', '2019-07-15'),
(44, NULL, NULL, 'Madre con trastorno bipolar', '2021-10-30'),
(45, NULL, NULL, 'Hermano con autismo', '2022-01-10'),
(46, NULL, NULL, 'Padre con Parkinson', '2020-11-05'),
(47, NULL, NULL, 'Madre con esclerosis lateral amiotrófica', '2019-12-20'),
(48, NULL, NULL, 'Abuela con osteoporosis severa', '2022-03-15'),
(49, NULL, NULL, 'Sin antecedentes', '2021-02-28'),
(50, NULL, NULL, 'Padre con cáncer de páncreas', '2020-09-15'),
(51, NULL, NULL, 'Madre con miastenia gravis', '2019-04-10'),
(52, NULL, NULL, 'Hermano con cardiopatía congénita', '2022-05-05'),
(53, NULL, NULL, 'Padre con hepatitis C', '2020-12-20'),
(54, NULL, NULL, 'Madre con fibromialgia', '2021-08-10'),
(55, NULL, NULL, 'Abuelo con demencia vascular', '2022-02-15'),
(56, NULL, NULL, 'Sin antecedentes', '2020-06-30'),
(57, NULL, NULL, 'Padre con cáncer de estómago', '2019-03-25'),
(58, NULL, NULL, 'Madre con artritis psoriásica', '2021-07-15'),
(59, NULL, NULL, 'Hermana con endometriosis', '2022-04-05'),
(60, NULL, NULL, 'Padre con aneurisma aórtico', '2020-10-10'),
(61, NULL, NULL, 'Madre con síndrome de Sjögren', '2019-05-20'),
(62, NULL, NULL, 'Abuelo con enfermedad de Huntington', '2022-01-25'),
(63, NULL, NULL, 'Sin antecedentes', '2021-03-10'),
(64, NULL, NULL, 'Padre con mieloma múltiple', '2020-08-15'),
(65, NULL, NULL, 'Madre con sarcoidosis', '2019-11-30');



--###################################################################################################
--Ejercicios:
-- *Triggers:


-- *Procedimientos almacenados:
-- 1. Registrar una nueva cita. 
DROP PROCEDURE IF EXISTS registro_cita;
CREATE PROCEDURE registro_cita
	@id_paciente INT,
	@id_medico SMALLINT,
	@id_estado SMALLINT,
	@fecha_hora DATETIME
AS
BEGIN
	INSERT INTO CITA(id_paciente, id_medico, id_estado, fecha_hora) VALUES
	(@id_paciente, @id_medico, @id_estado, @fecha_hora);
END;

-- Estos son datos de prueba, puede intentar con otros datos si lo prefiere
EXEC registro_cita @id_paciente = 3, @id_medico = 16, 
	@id_estado = 1, @fecha_hora = '2023-07-10 13:00:00';

--Consultas para tener una guia de los datos que se pueden poner en el procedimiento almacenado
SELECT * FROM PACIENTE;
SELECT * FROM MEDICO;
SELECT * FROM ESPECIALIDAD;
SELECT * FROM ESTADO_CITA;
SELECT * FROM CITA;

-- 2.Registrar una consulta médica. 
SELECT * FROM CONSULTA;
SELECT * FROM DIAGNOSTICO;

DROP PROCEDURE IF EXISTS registro_consulta;
CREATE PROCEDURE registro_consulta
	@id_cita INT,
	@id_diagnostico SMALLINT,
	@observaciones VARCHAR(250),
	@fecha DATE
AS
BEGIN
	INSERT INTO CONSULTA(id_cita, id_diagnostico, observaciones, fecha_consulta) VALUES
	(@id_cita, @id_diagnostico, @observaciones, @fecha);
END;

-- Estos son datos de prueba, puede intentar con otros datos si lo prefiere
EXEC registro_consulta @id_cita = 66, @id_diagnostico = 3, @observaciones = 'Dificultad para respirar', @fecha = '2023-07-10';

