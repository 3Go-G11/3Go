create database threego;

use threego;

create table usuario (
id int primary key auto_increment,
nome varchar(35) not null,
sobrenome varchar(45),
funcao varchar (40), 
email varchar(70) not null unique ,
	constraint chkEmail check (email like ('%@%')),
senha varchar(40),
cpf varchar (14) not null unique, 
telefone varchar(16)not null);

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
        
insert into usuario (nome, sobrenome, email, senha, cpf, telefone) values 
('Joao', 'Silva', 'jotinhasilva@sptech.school','senhasecreta', '123.456.789-10','5511999998888');

insert into sensor(temperatura, humidade) values
(23.4, 35);

insert into camara (linha, coluna, fkSensor) values
('A', '12', 1);

select*from usuario;

desc sensor;

alter table sensor modify column temperatura double;

alter table sensor modify column humidade double;