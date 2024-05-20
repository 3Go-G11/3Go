CREATE DATABASE threego2;
USE threego2;

CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  razaosocial VARCHAR(45) not null,
  nomeFantasia varchar(45) not null,
  cnpj CHAR(14) not null,
  telefone CHAR(11) not null,
  email VARCHAR(90) not null,
	constraint chkEmailEmp check (email like('%@%')),
  senha VARCHAR(45) not null); 
  
CREATE TABLE funcionario (
  idFunc INT,
  fkEmpresa INT,
  CONSTRAINT fkFuncionarioEmpresa FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa),
  CONSTRAINT pkComposta PRIMARY KEY (idFunc, fkEmpresa),
  nome VARCHAR(45) not null,
  telefone char(11) not null,
  email VARCHAR(90) not null,
  	constraint chkEmailFunc check (email like('%@%')),
  senha VARCHAR(45) not null,
  cargo VARCHAR(45) not null );

CREATE TABLE sensor (
  idSensor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) not null,
  media_temperatura DOUBLE,
  media_umidade DOUBLE);

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
  dht11Temperatura DOUBLE,
  dht11Umidade DOUBLE,
  datahora DATETIME DEFAULT CURRENT_TIMESTAMP);

INSERT INTO empresa (razaosocial, nomeFantasia, cnpj, telefone, email, senha) 
VALUES ('Empresa ABC', 'Antonia Bombons', '12345678901234', '123456789', 'joao@empresa.com',  'senha123'),
       ('Empresa XYZ', 'Xaropes Yamamomo', '98765432109876', '987654321', 'maria@empresa.com', 'senha456');

INSERT INTO funcionario (idFunc, fkEmpresa, nome, telefone, email, senha, cargo) 
VALUES (1, 1, 'Pedro', '966554433', 'pedro@empresaabc.com', 'senhafunc123', 'CEO'),
       (2, 1, 'Ana', '988997722', 'ana@empresaabc.com', 'senhafunc456', 'Diretor'),
       (3, 2, 'Carlos', '997984554', 'carlos@empresaxyz.com', 'senhafunc789','Gerente');

INSERT INTO sensor (nome, media_temperatura, media_umidade) 
VALUES ('Sensor A', 14, 65),
       ('Sensor B', 14, 65),
       ('Sensor C', 14, 65);

INSERT INTO camaras (fkEmpresa, fkSensor) 
VALUES (1, 1),
       (1, 2),
       (2, 3);

/* INSERT INTO dados (fkSensor, dht11Temperatura, dht11Umidade) 
VALUES (1, 25.5, 60.2),
       (1, 24.8, 58.6),
       (1, 26.0, 62.3); */
       
INSERT INTO dados (fkSensor, dht11Temperatura, dht11Umidade, datahora) VALUES
(1, 21.3, 55.1, '2023-03-19 03:11:59'),
(1, 24.5, 68.7, '2023-06-15 12:30:00'),
(2, 22.8, 72.1, '2023-09-20 18:45:00'),
(2, 25.3, 63.5, '2023-11-10 09:15:00'),
(3, 23.7, 59.8, '2023-07-05 07:00:00'),
(3, 26.1, 71.2, '2023-08-08 15:20:00'),
(1, 10.8, 40.1, '2023-03-19 03:11:59');
       
select concat('Usuário: ',email, ' ','Senha: ', senha) as LoginEmpresa from empresa;

select empresa.razaosocial,
	   empresa.nomeFantasia as Nome,
       empresa.email,
	   empresa.telefone,
	   funcionario.nome as Funcionário,
       funcionario.email as emailFuncionário
 from empresa join funcionario on empresa.idEmpresa = funcionario.fkEmpresa where empresa.razaosocial = 'Empresa XYZ'; -- Seleciona os funcionários e representantes 
																													   -- de uma empresa específica
 
 select empresa.razaosocial as NomeEmpresa, 
        camaras.fkSensor as NºSensor, 
        sensor.nome,
		sensor.media_temperatura as MediaTemperatura, 
        sensor.media_umidade as MediaUmidade,
		dados.dht11Temperatura as Temperatura, 
        dados.dht11Umidade as Umidade,
        dados.datahora
			from empresa left join camaras on camaras.fkEmpresa = empresa.idEmpresa
            left join dados on dados.fkSensor = camaras.fkSensor 
            join sensor on idSensor = camaras.fkSensor where dados.datahora >'2023-05-01' 
            and empresa.razaosocial = 'Empresa ABC' order by datahora; -- Exibe todos os dados de sensores de uma empresa específica a partir de uma data e ordena
																	   -- do mais antigo para o mais novo.
      
select*from dados where datahora between '2023-03-19' and '2023-11-10' order by datahora desc; -- Exibe e ordena os dados do mais recente para o mais 
																						       -- antigo em um intervalo de tempo específico.

select nome, 
       dht11Temperatura as Temperatura, 
	   sensor.media_temperatura as MediaTemperatura, 
       dht11Umidade as Umidade, 
	   sensor.media_umidade as MediaUmidade,
       datahora,
       idCamara
 from sensor join dados on dados.fkSensor = idSensor
 join camaras on camaras.fkSensor = idSensor
 join empresa on camaras.fkEmpresa = idEmpresa
 where dht11Temperatura < media_temperatura and empresa.razaosocial = 'Empresa ABC';  -- Mostra os registros de temperatura acima da média
																	   -- de uma empresa específica.          
   
select nome, 
       dht11Temperatura as Temperatura, 
	   sensor.media_temperatura as MediaTemperatura, 
       dht11Umidade as Umidade, 
	   sensor.media_umidade as MediaUmidade,
       datahora, 
       idCamara
 from sensor join dados on dados.fkSensor = idSensor
 join camaras on camaras.fkSensor = idSensor
 join empresa on camaras.fkEmpresa = idEmpresa
 where dht11Umidade > media_umidade and empresa.razaosocial = 'Empresa ABC';  -- Mostra os registros de temperatura acima da média
																	   -- de uma empresa específica.   
describe dados;                    