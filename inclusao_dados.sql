use loja_eletronicos;

start transaction;

insert into produtos (codigo, nome, marca, tipo, preco, estoque) values
('P001', 'Smartphone Galaxy S21', 'Samsung', 'Celular', 3999.90, 50),
('P002', 'Notebook Inspiron 15', 'Dell', 'Notebook', 4499.00, 30),
('P003', 'Smart TV 50"', 'LG', 'Televisão', 2899.99, 20),
('P004', 'Fone Bluetooth AirPods', 'Apple', 'Acessório', 1399.00, 100),
('P005', 'Tablet M10', 'Lenovo', 'Tablet', 999.90, 40);

select * from produtos;

insert into vendedores(matricula, nome, departamento, comissao, data_admissao, de_ferias) values
('V001','Carlos Souza', 'Eletrônicos', 5.00, '2021-03-15', 0),
('V002', 'Juliana Mendes', 'Informática', 4.50, '2020-07-10', 1),
('V003', 'André Silva', 'TV e Vídeo', 6.00, '2019-11-25', 0),
('V004', 'Mariana Costa', 'Acessórios', 5.50, '2022-01-05', 0);

select * from vendedores;

/*Outra forma de insert, quando a irdem dos values respeita a ordem da tabela*/
insert into clientes values
('123.456.789-00', 'João Pereira', 'joao@gmail.com', '(11)99999-1111', 'São Paulo'),
('987.654.321-00', 'Ana Lima', 'ana@hotmail.com', '(21)98888-2222', 'Rio de Janeiro'),
('111.222.333-44', 'Pedro Martins', 'pedro@yahoo.com', '(31)97777-3333', 'Belo Horizonte'),
('555.666.777-88', 'Luciana Rocha', 'luciana@gmail.com', '(41)96666-4444', 'Curitiba');

select * from clientes;

insert into vendas(data_venda, cpf_cliente, matricula_vendedor, valor_total) values
('2025-03-01', '123.456.789-00', 'V001', 5398.90),
('2025-03-02', '987.654.321-00', 'V003', 2899.99),
('2025-03-03', '111.222.333-44', 'V002', 999.90),
('2025-03-04', '555.666.777-88', 'V004', 1399.00);

select * from vendas;

insert into itens_venda(id_venda, codigo_produto, quantidade, preco_unitario) values
(1, 'P001', 1, 3999.90),
(1, 'P004', 1, 1399.00),
(2, 'P003', 1, 2899.99),
(3, 'P005', 1, 999.90),
(4, 'P004', 1, 1399.00);

select * from itens_venda;

/*Inserindo tabela de outro banco de dados*/

select * from sucos_vendas.notas_fiscais;

create table notas like sucos_vendas.notas_fiscais;

insert into notas select * from sucos_vendas.notas_fiscais;

alter table notas rename column CPF to cpf;
alter table notas rename column NUMERO to numero;
alter table notas rename column IMPOSTO to impsoto;
alter table notas rename column MATRICULA to cadastro;
alter table notas rename column DATA_VENDA to data_da_venda;

select * from notas;


-- Se estiver tudo OK:
commit;

-- Se não:
rollback;





