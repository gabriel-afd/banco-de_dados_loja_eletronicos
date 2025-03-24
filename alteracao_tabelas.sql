/*Alterando tabelas*/
update produtos set nome = 'Smartphone Galaxy S22', preco = 4500, estoque = 20  where codigo = 'P001';
select * from produtos;

update vendedores set comissao = 1.05*comissao where year(data_admissao)>= 2021;
select * from vendedores;

update clientes set contato = '(11)99998-2222' where nome='João Pereira';
select * from clientes; 

/*Apagando toda a tabela notas*/
delete from notas;

