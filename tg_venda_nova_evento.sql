/*Trigger para enviar mensagem via fila(integração com sistemas externos)*/
/*Padrão: Trigger -> Tabela Intermediaria(fila) -> Serviço Externo Lê*/

create table fila_eventos(
id int auto_increment primary key,
tipo_evento varchar(50),
payload json,
status varchar(20) default 'pendente',
criado_em timestamp default current_timestamp,
processado_em TIMESTAMP NULL
);


delimiter //
create trigger tg_venda_nova_evento after insert on vendas
for each row
begin
	insert into fila_eventos(tipo_evento, payload, status) values
    ('Venda Criada', 
    json_object(
    'id_venda', new.id,
    'data_venda', new.data_venda,
    'cpf_cliente', new.cpf_cliente,
    'matricula_vendedor', new.matricula_vendedor,
    'valor_total', new.valor_total
    ),
    'pendente');
end// 

/*Testando a Trigger*/
INSERT INTO vendas (data_venda, cpf_cliente, matricula_vendedor, valor_total)
VALUES ('2025-04-22', '122.977.174-31', 'V004', 100.90);   
    
select * from fila_eventos;


/*
Enviando uma fila diretamente do SQL:

1- A trigger tg_venda_nova_evento tem função de inserir um registro JSON na tabela fila_eventos
2- Um serviço externo(pode ser em Java ou Python) monitora a tabela fila_eventos
3- O serviço externo lê o campo payload(JSON) da tabela fila_eventos
4- O serviço externo envia o JSON para uma serviço de mensageria como RabbitMQ por exemplo
5- O status é atualizado para 'PROCESSADO'
*/
