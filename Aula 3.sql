/*Preparando querys para a reunião trimestral*/

-- Papel dos Fornecedores na Black Friday

SELECT STRFTIME('%Y/%m', v.data_venda) as Ano_e_Mes, f.nome as Nome_fornecedor, COUNT(it.produto_id) as Qtd_vendas from itens_venda it
JOIN vendas v on v.id_venda = it.venda_id
JOIN produtos p on p.id_produto = it.produto_id
join fornecedores f on f.id_fornecedor = p.fornecedor_id
GROUP by Nome_fornecedor, Ano_e_Mes
ORDER by Nome_fornecedor;

-- Categoria de Produtos na Black Friday

SELECT STRFTIME('%Y', v.data_venda) as Ano_e_Mes, c.nome_categoria, COUNT(it.produto_id) as Qtd_vendas From itens_venda it
join vendas v on v.id_venda = it.venda_id
JOIN produtos p on p.id_produto = it.produto_id
join categorias c on c.id_categoria = p.categoria_id
where STRFTIME('%m', v.data_venda) = '11'
GROUP by nome_categoria, Ano_e_mes
ORDER by nome_categoria, Qtd_vendas DESC;

/*Respondendo dúvidas*/

SELECT STRFTIME('%Y', v.data_venda) as Ano_e_Mes, f.nome as Nome_fornecedor, COUNT(it.produto_id) as Qtd_vendas from itens_venda it
JOIN vendas v on v.id_venda = it.venda_id
JOIN produtos p on p.id_produto = it.produto_id
join fornecedores f on f.id_fornecedor = p.fornecedor_id
where STRFTIME('%m', v.data_venda) = '11'
GROUP by Nome_fornecedor, Ano_e_Mes
ORDER by Nome_fornecedor;

/*Dever de casa*/

SELECT strftime('%Y/%m', v.data_venda) AS "Ano/Mes", f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
GROUP BY Nome_Fornecedor, "Ano/Mes"
ORDER BY "Ano/Mes", Qtd_Vendas;

SELECT STRFTIME('%Y/%m', v.data_venda) as Ano_e_Mes, COUNT(it.produto_id) as Qtd_vendas from itens_venda it
JOIN vendas v on v.id_venda = it.venda_id
JOIN produtos p on p.id_produto = it.produto_id
join fornecedores f on f.id_fornecedor = p.fornecedor_id
where f.nome = 'NebulaNetworks'
GROUP by f.nome, Ano_e_Mes
ORDER by Ano_e_mes, Qtd_vendas DESC;

