/*Análise de sazonalidade - Quadro geral*/
/*Planilha exportada para o google Sheets*/
SELECT STRFTIME('%Y/%m', data_venda) as Ano_e_mes, count(*) as Qtd_vendas from vendas
GROUP by Ano_e_mes
order by Ano_e_mes;

/*Comparação com múltiplos períodos anteriores*/


SELECT STRFTIME('%m', data_venda) as Mes, STRFTIME('%Y', data_venda) as Ano, count(*) as Qtd_vendas from vendas
GROUP by Mes
order by Mes;

/*Criando subconsulta*/
SELECT Mes, SUM(Case when Ano == '2020' Then Qtd_vendas ELse 0 end) as Vendas_2020,
			SUM(Case when Ano == '2021' Then Qtd_vendas ELse 0 end) as Vendas_2021,
            SUM(Case when Ano == '2022' Then Qtd_vendas ELse 0 end) as Vendas_2022,
            SUM(Case when Ano == '2023' Then Qtd_vendas ELse 0 end) as Vendas_2023
from(
  SELECT STRFTIME('%m', data_venda) as Mes, STRFTIME('%Y', data_venda) as Ano, count(*) as Qtd_vendas from vendas
  GROUP by Mes, Ano
  order by Mes)
GROUP by Mes;

/*Métricas*/

SELECT count(*) as Qtd_vendas, STRFTIME('%Y', v.data_venda) as Ano from vendas v
where STRFTIME('%m', v.data_venda) = '11' AND Ano != '2022'
GROUP by Ano;

/*Subconsulta*/

SELECT AVG(Qtd_vendas) as Media_de_vendas
from(
  SELECT count(*) as Qtd_vendas, STRFTIME('%Y', v.data_venda) as Ano from vendas v
  where STRFTIME('%m', v.data_venda) = '11' AND Ano != '2022'
  GROUP by Ano);

/*Vendas Black friday 2022*/
SELECT count(*) as Qtd_vendas, STRFTIME('%Y', v.data_venda) as Ano from vendas v
where STRFTIME('%m', v.data_venda) = '11' AND Ano = '2022'
GROUP by Ano;

/*Subconsultas Black Friday 2022*/

SELECT Qtd_vendas as Vendas_atuais
from(
  SELECT count(*) as Qtd_vendas, STRFTIME('%Y', v.data_venda) as Ano from vendas v
  where STRFTIME('%m', v.data_venda) = '11' AND Ano = '2022'
  GROUP by Ano);
 
 
With Media_vendas_anteriores as (SELECT AVG(Qtd_vendas) as Media_de_vendas
  from(
    SELECT count(*) as Qtd_vendas, STRFTIME('%Y', v.data_venda) as Ano from vendas v
    where STRFTIME('%m', v.data_venda) = '11' AND Ano != '2022'
    GROUP by Ano)),
  Vendas_Atual As ( SELECT Qtd_Vendas as Qtd_Vendas_Atual
  From(                   
    SELECT count(*) as Qtd_vendas, STRFTIME('%Y', v.data_venda) as Ano 
    from vendas v
    WHERE STRFTIME('%m', v.data_venda) = '11' AND Ano = '2022'
    GROUP by Ano))
  SELECT Mva.Media_de_vendas, va.Qtd_Vendas_Atual, ROUND(((va.Qtd_Vendas_Atual - Mva.Media_de_vendas)/ Mva.Media_de_vendas) * 100, 2) || '%' as Porcentagem
  from Vendas_Atual va, Media_vendas_anteriores Mva;