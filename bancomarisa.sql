/* criando o banco de dados */
create database projetomarisa;

/* setando o banco de dados como principals */
use projetomarisa;

/* criando a tabela de medicos */
create table medico(
	id int not null primary key auto_increment,
	nome varchar(256),
	crm varchar(25)
);

/* inserções iniciais na  tabela de medico */
insert into medico (nome, crm) values ('Maria', 'CRM-9897');
insert into medico (nome, crm) values ('Paulo', 'CRM-7847');
insert into medico (nome, crm) values ('Roger', 'CRM-9898');

/* select comum na tabela de medicos */
select * from medico;

/* criando a tabela de medicamentos */
create table medicamentos(
 id int not null auto_increment,
 codigo int,
 nome_quimico varchar(256),
 nome_comercial varchar(256),
 primary key (id)
);

/* select comum na tabela de medicamentos */
select * from medicamentos;


/* tabela de estado */
create table estado(
	id int not null auto_increment primary key,
	nome varchar(256),
    sigla varchar(3)
);

/* tabela de municipio */
create table municipio(
	id int not null auto_increment primary key,
	codigo_ibge varchar(8),
	nome varchar(256),
    estado_id int not null,
    constraint fk_municipio_estado_id foreign key (estado_id) references estado(id)
);

/* tabela de bairro */
create table bairro(
	id int not null auto_increment not null primary key,
    nome varchar(256) not null,
    cep varchar(256),
    municipio_id int,
    constraint fk_bairro_municipio foreign key (municipio_id) references municipio(id)
);

/* tabela de endereço */
create table endereco(
	id int not null auto_increment primary key,
	rua varchar(256) not null,
    numero int,
    cep varchar(10),
    bairro_id int,
    constraint fk_bairro_endereco foreign key (bairro_id) references bairro(id)
);

create table hospital(
	id int not null auto_increment primary key,
    codigo varchar(15),
    nome varchar(256) not null,
    endereco_id int,
    telefone varchar(25),
    contato varchar(256)
);