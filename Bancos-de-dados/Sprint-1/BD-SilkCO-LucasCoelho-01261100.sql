CREATE DATABASE silkCo;

USE silkCo;

CREATE TABLE cadastroUsuário(
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    nomeDono VARCHAR(40) NOT NULL,
    telefoneDono VARCHAR(15) NOT NULL,
    ramoEmpresa VARCHAR(30) NOT NULL,
    endereco VARCHAR(45) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    filial CHAR(3)
);

CREATE TABLE sensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusSensor VARCHAR(15) NOT NULL
    CONSTRAINT chStatus
		CHECK (statusSensor IN ('Ativo', 'Inativo', 'Quebrado'))
);

CREATE TABLE coleta(
	idColeta INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(4,2) NOT NULL,
    umidade DECIMAL(4,2) NOT NULL,
    dtColeta DATETIME NOT NULL
);

INSERT INTO cadastroUsuário (nome, email, nomeDono, telefoneDono, ramoEmpresa, endereco, cnpj, filial) VALUES
('Seda Nobre LTDA', 'contato@sedanobre.com', 'Carlos Matsuda', '11987654321', 'Produção de Seda', 'Rua das Amoreiras 120', '12345678000101', '001'),
('Fios de Ouro Seda', 'atendimento@fiosouro.com', 'Fernanda Tanaka', '11976543210', 'Fiação de Seda', 'Av. Industrial 450', '23456789000102', '002'),
('Sericultura Paulista', 'contato@seripaulista.com', 'Roberto Yamamoto', '11965432109', 'Sericultura', 'Rua Rural 78', '34567890000103', '001'),
('Império da Seda', 'vendas@imperioseda.com', 'Juliana Suzuki', '11954321098', 'Tecelagem de Seda', 'Av. Central 980', '45678901000104', '003'),
('BioSeda Brasil', 'bio@bioseda.com', 'Marcos Hayashi', '11943210987', 'Produção Sustentável de Seda', 'Rua Verde 332', '56789012000105', '002'),
('Fiação Oriental', 'contato@fiaoriental.com', 'Ana Nakamura', '11932109876', 'Fiação de Seda', 'Av. Japão 654', '67890123000106', '001');

INSERT INTO sensor (statusSensor) VALUES
('Ativo'),
('Ativo'),
('Inativo'),
('Quebrado'),
('Ativo'),
('Inativo');

INSERT INTO coleta (temperatura, umidade, dtColeta) VALUES
(25.30, 70.50, '2026-03-01 10:15:00'),
(24.80, 68.20, '2026-03-01 11:20:00'),
(26.10, 72.00, '2026-03-02 09:40:00'),
(23.90, 65.70, '2026-03-02 14:10:00'),
(25.00, 69.30, '2026-03-03 08:55:00'),
(24.50, 67.90, '2026-03-03 16:30:00');
