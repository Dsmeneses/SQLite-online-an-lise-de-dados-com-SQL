/*Entendendo os dados*/

SELECT * from vendas LIMIT 5;

/*Análise temporal: ciclos de vendas*/

SELECT strftime('%Y',data_venda) FROM vendas LIMIT 5;

SELECT DISTINCT(strftime('%Y', data_venda)) AS Ano from vendas
order by Ano;

SELECT strftime('%Y', data_venda) as Ano, COUNT(id_venda) as Total_Vendas from vendas
GROUP by Ano
ORDER by Ano;

SELECT strftime('%Y', data_venda) as Ano, strftime('%m', data_venda) as Mes, COUNT(id_venda) as Total_Vendas from vendas
GROUP by Ano, Mes
ORDER by Ano;

/*Separando dados da Black Friday*/

SELECT strftime('%Y', data_venda) as Ano, strftime('%m', data_venda) as Mes, COUNT(id_venda) as Total_Vendas from vendas
where Mes = '01' OR Mes = '11' Or Mes = '12'
GROUP by Ano, Mes
ORDER by Ano;

