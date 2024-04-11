create database 3go;
use 3go;

create table login (
idLogin int primary key auto_increment,
razaosocial varchar(45) not null,
cnpj char(14) not null,
nome_representante varchar(45) not null,
email_representante varchar(90) not null,
constraint chk_email check (email_representante like("%@%")), 
telefone varchar(45)not null,
senha varchar(45)not null
);

