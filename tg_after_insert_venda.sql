/*Criando tabela cópia da tabela vendas de forma automatizada, sem precisar dar inserts diretamente*/
create table log_vendas(
id int auto_increment primary key,
id_venda int,
cpf_cliente varchar(14),
matricula_vendedor varchar(5),
data_venda date,
valor_total decimal(10,2),
data_log timestamp default current_timestamp
);

delimiter //
create trigger tg_after_insert_venda after insert on vendas
for each row 
begin
	insert into log_vendas(id_venda,cpf_cliente,matricula_vendedor, data_venda,valor_total)
    values (new.id,new.cpf_cliente,new.matricula_vendedor,new.data_venda, new.valor_total);
end//

/*Testando o trigger tg_after_insert_venda*/
INSERT INTO vendas (data_venda, cpf_cliente, matricula_vendedor, valor_total)
VALUES ('2025-04-22', '122.977.174-31', 'V004', 1999.90);

select * from log_vendas;