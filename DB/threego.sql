create database threego;

use threego;

create table usuario (
id int primary key auto_increment,
nome varchar(50) not null,
funcao varchar (40), 
email varchar(70) not null unique ,
cpf varchar (14) not null unique, 
telefone varchar(16)not null, 
senha varchar(40));

alter table usuario add constraint chkEmail check (email like('%@%'));

desc usuario;

create table sensor(
idSensor int primary key auto_increment,
temperatura float,
humidade int,
datahora datetime default current_timestamp);

create table camara(
idCamara int primary key auto_increment,
linha char(1),
coluna varchar(2),
fkSensor int,
	constraint fkCamaraSensor foreign key (fkSensor)
		references sensor(idSensor));
        
insert into usuario (nome,email, cpf, telefone,senha) values 
('Joao Silva', 'jotinhasilva@sptech.school', '123.456.789-10','5511999998888','senhasecreta');

insert into sensor(temperatura, humidade) values
(23.4, 35);

insert into camara (linha, coluna, fkSensor) values
('A', '12', 1);
 
        
        

