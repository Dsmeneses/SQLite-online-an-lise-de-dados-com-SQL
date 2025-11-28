/* Tendências simples*/

/*Arquivo exportado via csv, e aberto no google sheets*/

/*Comparando fornecedor*/
/*Arquivo exportado via csv, e aberto no google sheets, gráficos comparativos*/
/*HorizonDistributors / AstroSupply*/
SELECT "Ano/Mes", SUM(CASE WHEN Nome_fornecedor = 'NebulaNetworks' THEN Qtd_Vendas ELSE 0 END) as Qtd_vendas_Nebula,
SUM(CASE WHEN Nome_fornecedor = 'HorizonDistributors' THEN Qtd_Vendas ELSE 0 END) as Qtd_vendas_HorizonDistributors,
SUM(CASE WHEN Nome_fornecedor = 'AstroSupply' THEN Qtd_Vendas ELSE 0 END) as Qtd_vendas_AstroSupply
from(
  SELECT strftime('%Y/%m', v.data_venda) AS "Ano/Mes", f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
  FROM itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  JOIN produtos p ON p.id_produto = iv.produto_id
  JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
  where Nome_fornecedor = 'HorizonDistributors' or Nome_fornecedor = 'AstroSupply' or Nome_fornecedor = 'NebulaNetworks'
  GROUP BY Nome_Fornecedor, "Ano/Mes"
  ORDER BY "Ano/Mes", Qtd_Vendas
)
group by "Ano/Mes";

/*Cálculos de percentual do total*/

SELECT count(*) as Qtd_vendas from itens_venda;

SELECT Nome_Categoria, Qtd_vendas, ROUND(100.0*Qtd_vendas/(SELECT count(*) from itens_venda), 2) || '%' as Porcentagem_Vendas
from(
  SELECT c.nome_categoria as Nome_categoria, COUNT(it.produto_id) as Qtd_vendas From itens_venda it
  join vendas v on v.id_venda = it.venda_id
  JOIN produtos p on p.id_produto = it.produto_id
  join categorias c on c.id_categoria = p.categoria_id
  GROUP by c.nome_categoria
  ORDER by Qtd_vendas DESC
);

/*Mãos na massa*/

/*O objetivo deste desafio é aplicar a mesma lógica que usamos para categorias
mas agora para calcular a porcentagem de vendas de cada marca e cada fornecedor.*/

SELECT Nome_fornecedor, Qtd_vendas, ROUND(100.0*Qtd_vendas/(SELECT count(*) from itens_venda), 2) || '%' as Porcentagem_Vendas
from(
  SELECT f.nome as Nome_fornecedor, COUNT(it.produto_id) as Qtd_vendas From itens_venda it
  join vendas v on v.id_venda = it.venda_id
  JOIN produtos p on p.id_produto = it.produto_id
  join fornecedores f on f.id_fornecedor = p.fornecedor_id
  GROUP by Nome_fornecedor
  ORDER by Qtd_vendas DESC
);