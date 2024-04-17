create database threego;

use threego;

create table representante (
idRep int primary key auto_increment,
nomeRep varchar(50) not null,
email varchar(70) not null unique ,
	constraint chkEmail check (email like('%@%')),
telefone varchar(16)not null, 
senha varchar(40));

create table empresa (
idEmpresa int primary key auto_increment,
razaoSoc varchar(45) not null,
CNPJ char(14) not null,
fkRepresentante int not null,
	constraint fkEmpresaRep foreign key (fkRepresentante)
		references representante (idRep));

create table dados(
idSensor int primary key auto_increment,
dht11Temperatura double,
dht11Umidade double,
datahora datetime default current_timestamp);

create table camara(
idCamara int primary key auto_increment,
linha char(1),
coluna varchar(2),
fkDados int,
	constraint fkCamaraDados foreign key (fkDados)
		references dados(idSensor));
        
        

