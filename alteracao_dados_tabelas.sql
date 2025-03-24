start transaction;

/*Adicionando mais dados na tabela de vendas*/
insert into vendas(data_venda, cpf_cliente, matricula_vendedor, valor_total) values
('2025-03-22', '123.456.789-00', 'V001', 1999.90);

select * from vendas;


/*Alterando comissão para os vendedores*/
update vendedores set comissao = 1.10*comissao where departamento = 'TV e Vídeo';
select * from vendedores;

-- Checar se algum vendedor passou do limite de comissao
select * from vendedores where comissao > 999.99;

/*Excluindo vendas de um cliente*/
delete from itens_venda where id_venda in(
select id from vendas where cpf_cliente='123.456.789-00'
);

-- Se estiver tudo OK:
commit;

-- Se não:
rollback;

