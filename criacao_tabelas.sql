create database loja_eletronicos;

use loja_eletronicos;

create table produtos(
codigo varchar(10) not null, 
nome varchar(100) null, 
marca varchar(50) null,
tipo varchar(50) null,
preco decimal(10,2) null,
estoque int null,
primary key(codigo)
);

select * from produtos;

create table vendedores(
matricula varchar(5) not null,
nome varchar(100) null,
departamento varchar(50) null,
comissao decimal(5,2) null,
data_admissao date null,
de_ferias bit(1) null,
primary key(matricula)
);

select * from vendedores;

create table clientes(
cpf varchar(14) not null,
nome varchar(100) null,
email varchar(100) null,
telefone varchar(20) null,
cidade varchar(50) null,
primary key (cpf)
);

alter table clientes rename column telefone to contato;
alter table clientes alter column cidade set default 'Campina Grande';

select * from clientes;

create table vendas(
id int auto_increment primary key,
data_venda date not null,
cpf_cliente varchar(14) not null,
matricula_vendedor varchar(5) not null,
valor_total decimal(10,2) not null,
foreign key (cpf_cliente) references clientes(cpf),
foreign key (matricula_vendedor) references vendedores(matricula)
);

select * from vendas;

create table itens_venda(
id int auto_increment primary key,
id_venda int not null,
codigo_produto varchar(10) not null,
quantidade int not null,
preco_unitario decimal(10,2) not null,
foreign key (id_venda) references vendas(id),
foreign key (codigo_produto) references produtos(codigo)
);

select * from itens_venda;

