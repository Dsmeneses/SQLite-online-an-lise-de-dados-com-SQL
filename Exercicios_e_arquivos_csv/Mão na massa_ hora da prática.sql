/*Traga todos os dados da cliente Maria Silva.*/
SELECT * from clientes where nome like 'Maria Silva%';

/*Busque o ID do pedido e o ID do cliente dos pedidos onde o status esteja como entregue.*/
SELECT id, idcliente from pedidos
where status = 'Entregue';

/*Retorne todos os produtos onde o preço seja maior que 10 e menor que 15.*/
SELECT * from produtos
where preco > 10 and preco < 15;  

/*Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-30.*/
SELECT nome, cargo from colaboradores
where datacontratacao BETWEEN '2022-01-01' AND '2022-06-30';

/*Recupere o nome do cliente que fez o primeiro pedido.*/
SELECT c.nome from clientes c
join pedidos p
where c.id = p.idcliente and p.id = 1;

/*OU*/
SELECT nome from clientes
where id = (SELECT idcliente from pedidos
		order by datahorapedido ASC LIMIT 1);

/*Liste os produtos que nunca foram pedidos.*/
SELECT nome from produtos
where id not in(SELECT idproduto from itenspedidos);

/*Liste os nomes dos clientes que fizeram pedidos entre 2023-01-01 e 2023-12-31.*/
SELECT c.nome, count(c.nome) from clientes c
JOIN pedidos p
ON c.id = p.idcliente 
where p.datahorapedido BETWEEN '2023-01-01' AND '2023-12-31'
GROUP by c.nome;

/*Recupere os nomes dos produtos que estão em menos de 15 pedidos.*/
SELECT p.nome, it.quantidade from produtos p
join itenspedidos it
on p.id = it.idproduto
GROUP by p.nome
HAVING COUNT(it.idpedido) <15;

SELECT * from itenspedidos;
/*Liste os produtos e o ID do pedido que foram realizados pelo cliente "Pedro Alves" ou pela cliente "Ana Rodrigues"*/
SELECT p.nome, ip.idpedido from produtos p
join itenspedidos ip on p.id = ip.idproduto
join pedidos pd on ip.idpedido = pd.id
join clientes c on pd.idcliente = c.id
where c.nome in ('Pedro Alves','Ana Rodrigues');

SELECT * from clientes;

/*Recupere o nome e o ID do cliente que mais comprou(valor) no Serenatto.*/
SELECT p.idcliente, c.nome, SUM(it.quantidade * it.precounitario) as ValorTotal from clientes c
join pedidos p on c.id = p.idcliente
join itenspedidos it on p.id = it.idpedido
GROUP by p.idcliente
ORDER by ValorTotal DESC LIMIT 1;

SELECT * from itenspedidos;