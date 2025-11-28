SELECT * from itens_venda;

/*Quantos dados temos?*/

SELECT * from categorias;

SELECT COUNT(*) from produtos;
SELECT COUNT(*) from fornecedores;
SELECT COUNT(*) from itens_venda;
SELECT COUNT(*) as total_vendas from vendas;

/* Mão na massa: consolidação e comparação de quantidades de registros em tabelas*/
SELECT COUNT(*) as qtd, 'Categorias' as tabela from categorias
UNION ALL
SELECT COUNT(*) as qtd, 'Clientes' as tabela from clientes
UNION ALL
SELECT COUNT(*) as qtd, 'Fornecedores' as tabela from fornecedores
UNION ALL
SELECT COUNT(*) as qtd, 'Itens_venda' as tabela from itens_venda
UNION ALL
SELECT COUNT(*) as qtd, 'Marcas' as tabela from marcas
UNION ALL
SELECT COUNT(*) as qtd, 'Produtos' as tabela from produtos
UNION ALL
SELECT COUNT(*) as qtd, 'Vendas' as tabela from vendas;

/* Desafio: ajuste de valores em bases de produtos*/

SELECT preco, nome_produto from produtos
where preco > 200;

UPDATE produtos set preco = 40
where nome_produto like 'Bola de Futebol';

UPDATE produtos set preco = 30
WHERE nome_produto like 'Chocolate';

UPDATE produtos set preco = 110
WHERE nome_produto like 'Livro de Ficção';

UPDATE produtos set preco = 150
where nome_produto like 'Camisa';