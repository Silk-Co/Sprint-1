CREATE DATABASE silk_co;

USE silk_co;

CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    documento VARCHAR(14) UNIQUE NOT NULL,
    inscricao_estadual VARCHAR(15),
    filial CHAR(3) NOT NULL
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
			WHEN temperatura > 35 THEN 'Alerta: Calor'
            WHEN umidade > 75 THEN 'Alerta: Umidade alta'
            WHEN temperatura < 15 THEN 'Alerta: Frio'
            WHEN umidade < 65 THEN 'Alerta: Umidade baixa'
         END   
    ),
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO cliente
(nome,email,senha,documento,inscricao_estadual) VALUES
('Agroseda .INC','contato@agroseda.com','$2b$12$KIs6L6.Sj5HiS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS.UfS','21233217890879','123321231233'),
('SedaLogistics','contato@sedalogis.com','$2a$10$8K1p/a06v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v6v','21231233313332','232323243122');

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

SELECT nome,email,senha,documento,inscricao_estadual FROM cliente;

SELECT 
	status_coleta,
	CONCAT(temperatura , '°C') AS temperatura,
    CONCAT(umidade , '%') AS umidade
FROM coleta;

SELECT
	status_coleta,
	CONCAT(temperatura , '°C') AS temperatura,
    CONCAT(umidade , '%') AS umidade 
FROM coleta
WHERE temperatura >= 30;

SELECT
	status_coleta,
    CONCAT(temperatura, '°C') AS temperatura,
    CONCAT(umidade, '%') AS umidade
FROM coleta
WHERE temperatura < 25;

SELECT 
	status_coleta,
    CONCAT(temperatura, '°C') AS temperatura,
    CONCAT(umidade, '%') AS umidade
FROM coleta
WHERE umidade < 60;

SELECT 
	status_coleta,
    CONCAT(temperatura, '°C') AS temperatura,
    CONCAT(umidade, '%') AS umidade
FROM coleta
WHERE umidade > 75;










