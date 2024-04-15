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

create table representante(
idRepresentante int primary key auto_increment,
fkLogin int, constraint fk_dados_representantes foreign key (fkLogin) references login (idLogin)
); 

create table empresa(
idEmpresa int primary key auto_increment,
fkLogin_empresa int, constraint fk_dados_empresa foreign key (fkLogin_empresa) references login (idLogin)
);

create table camaras(
idCamara int primary key auto_increment,
bloco char(20),
temperaturaDHT11 double,
umidadeDHT11 double,
fkEmpresa_dona int, constraint fk_empresa_dona foreign key (fkEmpresa_dona) references empresa (idEmpresa)
);
