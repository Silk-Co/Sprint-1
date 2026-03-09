CREATE DATABASE silk_co;

USE silk_co;

CREATE TABLE empresa(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    inscricao_estadual VARCHAR(15),
    filial CHAR(3) NOT NULL
);

CREATE TABLE funcionario(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    id_empresa INT NOT NULL
);

CREATE TABLE sensor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    status_sensor VARCHAR(50),
    CONSTRAINT ch_status_sensor
    CHECK(status_sensor IN ('Ativo','Inativo','Manutenção'))
);

CREATE TABLE coleta(
	id INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(5,2) NOT NULL,
    umidade DECIMAL(5,2) NOT NULL,
    status_coleta VARCHAR(50) AS(
		CASE
			WHEN temperatura <= 0 AND umidade <=0 THEN 'Erro!' 
			WHEN temperatura > 35 THEN 'Alerta: Calor'
            WHEN umidade > 75 THEN 'Alerta: Umidade alta'
            WHEN temperatura < 15 THEN 'Alerta: Frio'
            WHEN umidade < 65 THEN 'Alerta: Umidade baixa'
            ELSE 'Temperatura e umidade ideal'
         END   
    ),
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO empresa
(nome,email,senha,cnpj,inscricao_estadual,filial) VALUES
('Agroseda .INC','contato@agroseda.com','$2b$12$KIs6L6.Sj5HiS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS','12.332.178/9087-90','123321231233','013'),
('SedaLogistics','contato@sedalogis.com','$2a$10$8K1p/a06v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v','12.312.333/1333-23','232323243122','210');

INSERT INTO funcionario
(nome, email, senha, id_empresa) VALUES
('Paulo', 'Paulo@agroseda.com','$2b$12$KIs6L6.Sj5HiS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS',1),
('Fernando', 'Fernando23@sedalogis.com','$2a$10$8K1p/a06v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v',2);

INSERT INTO sensor
(status_sensor) VALUES
('Ativo'),
('Inativo'),
('Manutenção'),
('Ativo'),
('Ativo');

INSERT INTO coleta
(temperatura,umidade) VALUES
( 22.50, 75.00),
( 23.10, 72.40), 
( 25.80, 68.10), 
( 28.40, 60.50), 
( 31.20, 55.00), 
( 32.50, 52.30),
( 30.10, 58.90), 
( 27.40, 65.20),
( 24.90, 70.00), 
( 23.00, 74.50),
( 20.00, 84.50), 
(0,0);

SELECT nome,email,senha,cnpj,inscricao_estadual,filial FROM cliente;

SELECT 
	status_coleta,
	CONCAT(temperatura , '°C') AS temperatura,
    CONCAT(umidade , '%') AS umidade,
    data_hora
FROM coleta;

SELECT
	status_coleta,
	CONCAT(temperatura , '°C') AS temperatura,
    CONCAT(umidade , '%') AS umidade,
    data_hora
FROM coleta
WHERE temperatura >= 30;

SELECT
	status_coleta,
    CONCAT(temperatura, '°C') AS temperatura,
    CONCAT(umidade, '%') AS umidade,
    data_hora
FROM coleta
WHERE temperatura < 25;

SELECT 
	status_coleta,
    CONCAT(temperatura, '°C') AS temperatura,
    CONCAT(umidade, '%') AS umidade,
    data_hora
FROM coleta
WHERE umidade < 60;

SELECT 
	status_coleta,
    CONCAT(temperatura, '°C') AS temperatura,
    CONCAT(umidade, '%') AS umidade,
    data_hora
FROM coleta
WHERE umidade > 75;

SELECT
	status_coleta,
    CONCAT(temperatura, '°C') AS temperatura,
    CONCAT(umidade, '%') AS umidade,
    data_hora
FROM coleta
WHERE status_coleta = 'Erro!';










