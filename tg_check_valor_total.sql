/*Impedir venda com valor_total negativo*/
delimiter //
create trigger tg_check_valor_total before insert on vendas
for each row
begin
	if new.valor_total <= 0 then 
    signal SQLSTATE '45000' set message_text = 'Valor da venda deve ser maior que zero';
    end if;
end//

/*Testando o trigger tg_check_valor_total*/
INSERT INTO vendas (data_venda, cpf_cliente, matricula_vendedor, valor_total)
VALUES ('2025-04-22', '122.977.174-31', 'V004', -10.90);