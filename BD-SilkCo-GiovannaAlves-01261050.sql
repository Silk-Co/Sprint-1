CREATE DATABASE SilkCo;

USE SilkCo;

CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(50) NOT NULL,
CNPJ VARCHAR (14) NOT NULL,
endereco VARCHAR (255)
);

CREATE TABLE cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
email VARCHAR(90) NOT NULL,
senha VARCHAR (30) NOT NULL
-- idEmpresa INT, 
-- FOREIGN KEY (idEmpresa) REFERENCES empresa (idCEmpresa)
);

CREATE TABLE sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
numSerie VARCHAR (20),
dtEntrega DATE,
situacao VARCHAR (20),
	CONSTRAINT chSituacao CHECK (situacao IN ('Ativo', 'Inativo', 'Em manutenção'))
-- idCliente INT,
-- FOREIGN KEY (idCliente) REFERENCES cliente (idCliente)
);

CREATE TABLE registro(
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
temperatura DECIMAL(5,2),
umidade DECIMAL(5,2), 
dataHora datetime
-- idSensor INT,
-- FOREIGN KEY (idSensor) REFERENCES sensor (idSensor)
);


