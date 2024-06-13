CREATE DATABASE threego;
USE threego;

CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  razaosocial VARCHAR(45) not null,
  nomeFantasia varchar(45) not null,
  cnpj CHAR(14) not null,
  telefone CHAR(11) not null,
  email VARCHAR(90) not null,
  senha VARCHAR(45) not null); 

CREATE TABLE funcionario (
  idFunc INT auto_increment,
  fkEmpresa INT,
  CONSTRAINT fkFuncionarioEmpresa FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa),
  CONSTRAINT pkComposta PRIMARY KEY (idFunc, fkEmpresa),
  nome VARCHAR(45) not null,
  email VARCHAR(90) not null,
  senha VARCHAR(45) not null,
  cargo VARCHAR(45) not null );

CREATE TABLE sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) not null);

CREATE TABLE camaras (
  idCamara INT auto_increment,
  fkEmpresa INT,
  CONSTRAINT fkEmpresaCamara FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa),
  fkSensor INT,
  CONSTRAINT fkCamaraSensor FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor),
  CONSTRAINT pkCamSensorEmpresa primary key(idCamara, fkEmpresa, fkSensor));


CREATE TABLE dados(
  idDados INT AUTO_INCREMENT,
  fkSensor INT,
  CONSTRAINT fkSensorDados FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor),
  CONSTRAINT pkCompostaDados PRIMARY KEY (idDados, fkSensor),
  dht11Temperatura FLOAT,
  dht11Umidade FLOAT,
  datahora DATETIME DEFAULT CURRENT_TIMESTAMP);

INSERT INTO empresa (razaosocial, nomeFantasia, cnpj, telefone, email, senha) 
VALUES ('Empresa ABC', 'Antonia Bombons', '12345678901234', '123456789', 'joao@empresa.com',  'senha123'),
       ('Empresa XYZ', 'Xaropes Yamamomo', '98765432109876', '987654321', 'maria@empresa.com', 'senha456');

INSERT INTO funcionario (idFunc, fkEmpresa, nome, email, senha, cargo) 
VALUES (1, 1, 'Pedro','pedro@empresaabc.com', 'senhafunc123', 'CEO'),
       (2, 1, 'Ana','ana@empresaabc.com', 'senhafunc456', 'Diretor'),
       (3, 2, 'Carlos', 'carlos@empresaxyz.com', 'senhafunc789','Gerente');

INSERT INTO sensor (nome) VALUES 
	('Sensor DHT11'),
    ('Sensor DHT11'),
    ('Sensor DHT11'),
    ('Sensor DHT11'),
    ('Sensor DHT11'),
    ('Sensor DHT11');
    
insert into camaras values
	(1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 6);
    
INSERT INTO dados VALUES
(default, 1, 21.3, 55.1, '2024-06-06 21:20:00'),
(default, 2, 21.3, 55.1, '2024-06-06 21:20:00'),
(default, 3, 21.3, 55.1, '2024-06-06 21:20:00'),
(default, 4, 21.3, 55.1, '2024-06-06 21:20:00'),
(default, 5, 21.3, 55.1, '2024-06-06 21:20:00'),
(default, 6, 21.3, 55.1, '2024-06-06 21:20:00');


/*
EMPRESA:
SELECT * FROM empresa WHERE id = '${id}';
SELECT * FROM empresa;
SELECT * FROM empresa WHERE cnpj = '${cnpj};
INSERT INTO empresa (razaosocial, nomeFantasia, cnpj, telefone, email, senha) VALUES ('${razaoSocial}','${nomeFantasia}','${cnpj}','${telefone}', '${email}', '${senha}');

USUARIO:
SELECT idFunc, nome, f.email, fkEmpresa, cargo, nomeFantasia as nomeEmpresa FROM funcionario as f join empresa on idEmpresa = fkEmpresa WHERE f.email = '${email}' AND f.senha = '${senha}';
INSERT INTO funcionario (fkEmpresa, nome, email, cargo, senha) VALUES ('${empresaId}', '${nome}', '${email}', '${cargo}', '${senha}');

MEDIDA:
SELECT camaras.idCamara, dados.dht11Temperatura AS temperatura, dados.dht11Umidade AS umidade
    FROM dados 
    JOIN sensor ON sensor.idSensor = dados.fkSensor
    JOIN camaras ON camaras.fkSensor = sensor.idSensor
    WHERE camaras.fkEmpresa = 1 AND dados.datahora = 
    (
    SELECT MAX(dados.datahora) FROM dados 
    JOIN sensor ON sensor.idSensor = dados.fkSensor
    JOIN camaras as c on camaras.fkSensor = sensor.idSensor
    WHERE camaras.idCamara = camaras.idCamara
    );

 SELECT 
    MAX(dht11Temperatura) AS maiorTemperatura,
    MIN(dht11Temperatura) AS menorTemperatura,
    MAX(dht11Umidade) AS maiorUmidade,
    MIN(dht11Umidade) AS menorUmidade
FROM 
    dados 
    JOIN sensor ON sensor.idSensor = dados.fkSensor
    JOIN camaras ON camaras.fkSensor = sensor.idSensor
    WHERE idCamara = 3 AND camaras.fkEmpresa = 1 
GROUP BY
    datahora >= (SELECT DATE_SUB(NOW(), INTERVAL 1 DAY));
*/