/*
GRUPO 01 - SILK.co
Giovanna Alves Barroso
Lucas Coelho Pellegrino Alves
Lucas Espindola Silva
Mateus Borges Galeani
Matheus Dos Santos Ferreira
Matheus Yutaka Tuji
Rafael Rocha de Biagi
*/

CREATE DATABASE silkco;

USE silkco;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(60) NOT NULL,
CONSTRAINT chEmail
	CHECK (email LIKE '%@%'),
senha VARCHAR(30) NOT NULL,
cnpj CHAR(14) NOT NULL UNIQUE,
cpf CHAR(11) NOT NULL UNIQUE,
dtNascimento DATE,
tipoUsuario VARCHAR(16),
CONSTRAINT chTipoUsuario
	CHECK(tipoUsuario IN ('Cliente', 'Usuario Padrao'))
);

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
idUsuario INT NOT NULL,
estado VARCHAR(15) NOT NULL,
CONSTRAINT estado
	CHECK(estado IN ('Ativo', 'Manutencao', 'Inativo'))
);

CREATE TABLE coleta (
idColeta INT PRIMARY KEY AUTO_INCREMENT,
idUsuario INT NOT NULL, 
idsensor INT NOT NULL,
dtColeta DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuario (email, senha, cnpj, cpf, dtNascimento, tipoUsuario) VALUES 
('empresa1@gmail.com', 'empresa1senha', '00000000000001', '00000000001', '2000-01-01', 'Cliente'),
('empresa2@gmail.com', 'empresa2senha', '00000000000002', '00000000002', '2000-01-02', 'Usuario Padrao'),
('empresa3@gmail.com', 'empresa3senha', '00000000000003', '00000000003', '2000-01-03', 'Cliente'),
('empresa4@gmail.com', 'empresa4senha', '00000000000004', '00000000004', '2000-01-04', 'Usuario Padrao'),
('empresa5@gmail.com', 'empresa5senha', '00000000000005', '00000000005', '2000-01-05', 'Cliente');

SELECT * FROM usuario;
SELECT email FROM usuario WHERE tipoUsuario = 'Cliente';

INSERT INTO sensor (idUsuario, estado) VALUES
(1, 'Ativo'),
(3, 'Inativo'),
(5, 'Manutencao');

SELECT * FROM sensor;
SELECT estado FROM sensor WHERE estado = 'Manutencao';

INSERT INTO coleta (idUsuario, idSensor) VALUES
(1, 1),
(3, 2),
(5, 3);

SELECT * FROM coleta;


