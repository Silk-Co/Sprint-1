CREATE DATABASE silkCo;

USE silkCo;

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    senha VARCHAR(30) NOT NULL
);

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200),
	telefone CHAR(13),
	cep CHAR(8),
    cnpj CHAR(14)
);

CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusSensor VARCHAR(10) NOT NULL,
    CONSTRAINT chStatus 
        CHECK (statusSensor IN ('Ativo', 'Inativo', 'Manutencao'))
);

CREATE TABLE coleta (
    idColeta INT PRIMARY KEY AUTO_INCREMENT,
    sensor INT NOT NULL,
    temperatura DECIMAL(4,2) NOT NULL,
    umidade DECIMAL(4,2) NOT NULL,
    dtColeta DATETIME NOT NULL
);

INSERT INTO usuario (nome, email, senha) VALUES
('Mateus Silva', 'mateus.silva@novaseda.com', 'senha123'),
('Lucas Borges', 'lucas.borges@sedabrasil.com', 'senha456'),
('Angelica Torres', 'angelica.torres@seda.com', 'senha789'),
('Silvia Amorim', 'silva.amorim@seda.com', 'senha321'),
('Eduardo Rocha', 'eduardo.rocha@coop.com', 'senha654');

INSERT INTO empresa (nome, telefone, cep, cnpj) VALUES
('Fazenda Nova Seda', '5511912345678', '00012345', '12345678000195'),
('Produtor Vale da Seda', '5511987654321', '00123456', '98765432000110'),
('Amoreiras do Sul', '5541987654321', '01234567', '45678912000133'),
('Seda Premium', '5542987654321', '12345678', '74125896000144'),
('Cooperativa Casulo Forte', '5541912345678', '00001234', '36925814000155');

INSERT INTO sensor (statusSensor) VALUES
('Ativo'),
('Ativo'),
('Manutencao'),
('Inativo'),
('Ativo'),
('Ativo');					

INSERT INTO coleta (sensor, temperatura, umidade, dtColeta) VALUES
(1, 24.50, 72.30, '2026-03-08 08:30:00'),
(1, 25.10, 70.80, '2026-03-08 10:30:00'),
(2, 23.90, 75.20, '2026-03-08 09:00:00'),
(2, 26.40, 68.10, '2026-03-08 11:00:00'),
(3, 27.00, 65.50, '2026-03-08 12:00:00'),
(4, 22.80, 80.00, '2026-03-08 08:00:00'),
(5, 24.70, 71.40, '2026-03-08 13:00:00'),
(6, 25.30, 69.90, '2026-03-08 14:00:00');
