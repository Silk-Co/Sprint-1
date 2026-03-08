CREATE DATABASE SilkCO;

CREATE TABLE cliente(
id_cliente INT PRIMARY KEY auto_increment,
cnpj char(14),
nome VARCHAR(40)NOT NULL,
email VARCHAR(40) NOT NULL,
senha varchar(40) NOT NULL,
dtCadastro DATETIME,
telefone CHAR (13),
cep CHAR(8)
);

CREATE TABLE sensor(
nSerie INT PRIMARY KEY AUTO_INCREMENT,
statusSensor VARCHAR(10) NOT NULL 
	CONSTRAINT chStatus CHECK (statusSensor IN ('Ativo', 'Inativo', 'Manutencao'))
) AUTO_INCREMENT = 1000;

CREATE TABLE dadosSensor(
id_dados INT PRIMARY KEY auto_INCREMENT,
temperatura DECIMAL (5,2) NOT NULL,
umidade Decimal (5,2) NOT NULL, 
dtDados DATETIME NOT NULL,
alerta VARCHAR(10) NOT NULL 
	CONSTRAINT chAlerta CHECK (alerta IN ('Verde', 'Amarelo', 'Vermelho'))
);