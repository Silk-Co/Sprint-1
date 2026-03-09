CREATE DATABASE silkCo;
USE silkCo;

CREATE TABLE pessoaFisica (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
	CPF CHAR(11) NOT NULL UNIQUE,
	dtNascimento DATE NOT NULL,
	telefone VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    cidade VARCHAR(40) NOT NULL,
    estado CHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL,
    dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    qtdGalpoes INT NOT NULL,
    qtdCaixas INT NOT NULL,
    cadastro VARCHAR(14) NOT NULL,
		CONSTRAINT chClientePF 
			CHECK (cadastro IN ('Cadastrado', 'Não Cadastrado'))
);

CREATE TABLE pessoaJuridica(
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeDono VARCHAR(50) NOT NULL,
	cnpj CHAR(14) NOT NULL UNIQUE,
	telefoneDono VARCHAR(15) NOT NULL,
	email VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    cidade VARCHAR(40) NOT NULL,
    estado CHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL,
    dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    qtdGalpoes INT NOT NULL,
	qtdCaixas INT NOT NULL,
    cadastro VARCHAR(14) NOT NULL,
		CONSTRAINT chClientePJ 	
			CHECK (cadastro IN ('Cadastrado', 'Não Cadastrado'))
);


CREATE TABLE sensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    caixaSensor VARCHAR(50) NOT NULL,
    dtInstalacao DATE NOT NULL,
    dtUltimaManutencao DATE,
	statusSensor VARCHAR(10) NOT NULL,
		CONSTRAINT chSensor 
			CHECK (statusSensor IN ('Ativo', 'Inativo', 'Manutencao'))
);

CREATE TABLE dadosSensor(
    idDados INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(5,2) NOT NULL,
    umidade DECIMAL(5,2) NOT NULL,
    dataColeta DATETIME DEFAULT CURRENT_TIMESTAMP,
    nivelAlerta VARCHAR(7) NOT NULL,
		CONSTRAINT chAlerta 
			CHECK (nivelAlerta IN ('Normal', 'Alerta', 'Critico'))
);
