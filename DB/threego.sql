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
  
alter table empresa add constraint chkEmailEmpresa check (emailRepresentante like('%@%'));
  
CREATE TABLE funcionario (
  idFunc INT,
  fkEmpresa INT,
  CONSTRAINT fkFuncionarioEmpresa FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa),
  CONSTRAINT pkComposta PRIMARY KEY (idFunc, fkEmpresa),
  nomeFunc VARCHAR(45),
  emailFunc VARCHAR(90),
  senhaFunc VARCHAR(45));

alter table funcionario add constraint chkEmailFunc check (emailFunc like('%@%'));

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
  CONSTRAINT pkCompostaDados PRIMARY KEY (idDados, fkSensor),
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
       
INSERT INTO dados (fkSensor, dht11Temperatura, dht11Umidade, datahora) VALUES
(1, 21.3, 55.1, '2023-03-19 03:11:59'),
(1, 24.5, 68.7, '2023-06-15 12:30:00'),
(1, 22.8, 72.1, '2023-09-20 18:45:00'),
(1, 25.3, 63.5, '2023-11-10 09:15:00'),
(1, 23.7, 59.8, '2023-07-05 07:00:00'),
(1, 26.1, 71.2, '2023-08-08 15:20:00');
       
select concat('Usuário: ',emailRepresentante, ' ','Senha: ', senha) as LoginEmpresa from empresa;

select empresa.razaosocial, empresa.nomeRepresentante, empresa.emailRepresentante, funcionario.nomeFunc, funcionario.emailFunc 
 from empresa
 join funcionario on empresa.idEmpresa = funcionario.fkEmpresa;
 
 select empresa.razaosocial as NomeEmpresa, camaras.fkSensor as NºSensor,
		dados.dht11Temperatura as Temperatura, dht11Umidade as Umidade
			from empresa left join camaras on camaras.fkEmpresa = empresa.idEmpresa
            left join dados on dados.fkSensor = camaras.fkSensor;
      
select*from dados where datahora between '2023-03-19' and '2023-11-10' order by datahora;
            
