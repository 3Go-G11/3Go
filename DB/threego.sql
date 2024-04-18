CREATE DATABASE threego;
USE threego;

CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  razaosocial VARCHAR(45),
  cnpj CHAR(14),
  nomeRepresentante VARCHAR(45),
  emailRepresentante VARCHAR(90),
  telefone VARCHAR(45),
  senha VARCHAR(45)); 
  
CREATE TABLE funcionario (
  idFunc INT,
  fkEmpresa INT,
  CONSTRAINT fkFuncionarioEmpresa FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa),
  CONSTRAINT pkComposta PRIMARY KEY (idFunc, fkEmpresa),
  nomeFunc VARCHAR(45),
  emailFunc VARCHAR(90),
  senhaFunc VARCHAR(45));

CREATE TABLE sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  nomeSensor VARCHAR(45));

CREATE TABLE camaras (
  idCamara INT PRIMARY KEY AUTO_INCREMENT,
  fkEmpresa INT,
  CONSTRAINT fkEmpresaCamara FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa),
  fkSensor INT,
  CONSTRAINT fkCamaraSensor FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor));

CREATE TABLE dados(
  idDados INT AUTO_INCREMENT,
  fkSensor INT,
  CONSTRAINT fkSensorDados FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor),
  CONSTRAINT pkCompostaDados PRIMARY KEY (idDados, fkSensor)
  dht11Temperatura DOUBLE,
  dht11Umidade DOUBLE,
  datahora DATETIME DEFAULT CURRENT_TIMESTAMP);

INSERT INTO empresa (razaosocial, cnpj, nomeRepresentante, emailRepresentante, telefone, senha) 
VALUES ('Empresa ABC', '12345678901234', 'João Silva', 'joao@empresa.com', '123456789', 'senha123'),
       ('Empresa XYZ', '98765432109876', 'Maria Santos', 'maria@empresa.com', '987654321', 'senha456');

INSERT INTO funcionario (idFunc, fkEmpresa, nomeFunc, emailFunc, senhaFunc) 
VALUES (1, 1, 'Pedro', 'pedro@empresaabc.com', 'senhafunc123'),
       (2, 1, 'Ana', 'ana@empresaabc.com', 'senhafunc456'),
       (3, 2, 'Carlos', 'carlos@empresaxyz.com', 'senhafunc789');

INSERT INTO sensor (nomeSensor) 
VALUES ('Sensor A'),
       ('Sensor B'),
       ('Sensor C');

INSERT INTO camaras (fkEmpresa, fkSensor) 
VALUES (1, 1),
       (1, 2),
       (2, 3);

INSERT INTO dados (idDados, fkSensor, dht11Temperatura, dht11Umidade) 
VALUES (1, 1, 25.5, 60.2),
       (2, 1, 24.8, 58.6),
       (3, 1, 26.0, 62.3);



