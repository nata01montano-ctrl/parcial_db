CREATE DATABASE  db_doctor;

use db_doctor;

CREATE TABLE specialty (
    idspecialty INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
DROP TABLE doctor;
CREATE TABLE  doctor_state(
    idstate INT PRIMARY KEY,
    name_state VARCHAR(20) NOT NULL
);
INSERT INTO doctor_state (idstate, name_state)
VALUES ('1','habilitado'), ('2','inhabilitado');

CREATE TABLE doctor (
    iddoctor INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    professional_registration VARCHAR(50) UNIQUE NOT NULL,
    idstate INT,
    idspecialty INT,
    
    FOREIGN KEY (idstate)
    REFERENCES doctor_state(idstate)
);
CREATE TABLE doctor_has_specialty (
    doctor_iddoctor INT,
    specialty_idspecialty INT,

    PRIMARY KEY (doctor_iddoctor, specialty_idspecialty),

    FOREIGN KEY (doctor_iddoctor)
    REFERENCES doctor(iddoctor),

    FOREIGN KEY (specialty_idspecialty)
    REFERENCES specialty(idspecialty)
);

CREATE DATABASE db_appointment;
USE db_appointment;


CREATE TABLE patient (
    idpatient INT PRIMARY KEY,
    name VARCHAR(100),
    phone INT
);
CREATE TABLE appointment_state (
    idstate INT PRIMARY KEY,
    name_state VARCHAR(20) NOT NULL
);
INSERT INTO appointment_state (idstate, name_state)
VALUES ('1','agendada'), ('2','confirmada'), 
('3','cancelada'), ('4','atendida');

CREATE TABLE appointment (
    idappointment INT PRIMARY KEY,
    iddoctor INT,
    idpatient INT,
    date DATE,
    start_time TIME,
    end_time TIME,
    idstate INT,
    
    FOREIGN KEY (idstate) 
    REFERENCES appointment_state (idstate)
);

USE db_doctor;
INSERT INTO doctor 
(iddoctor, name, professional_registration, idstate, idspecialty)
VALUES 
(1, 'Juan Perez', 'MED12345', 1, 1);

SELECT *
FROM doctor
WHERE iddoctor = 1
AND idstate = 1;

USE db_appointment;
SELECT COUNT(*) AS total_citas
FROM appointment
WHERE iddoctor = 1
AND date = '2026-05-10';
SELECT *
FROM appointment
WHERE iddoctor = 1
AND date = '2026-05-10'
AND idstate = 2
AND (
        start_time < '11:00:00'
    AND end_time > '10:00:00'
);

INSERT INTO patient
(idpatient, name, phone)
VALUES
(1, 'Maria Lopez', 30012345);
