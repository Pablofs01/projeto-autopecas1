-- CONSULTAS SIMPLES (Q1 a Q5)

-- Q1. Listar todos os produtos ativos, em ordem alfabetica.
SELECT codigo, nome, marca, preco_venda
FROM produto
WHERE status = 'A'
ORDER BY nome ASC;

-- Q2. Mostrar produtos com preco entre R$ 50 e R$ 300.
SELECT nome, preco_venda
FROM produto
WHERE preco_venda BETWEEN 50 AND 300
ORDER BY preco_venda;

-- Q3. Pesquisar produtos cujo nome contenha "filtro".
SELECT nome, marca, preco_venda
FROM produto
WHERE nome LIKE '%filtro%';

-- Q4. Listar produtos de algumas categorias especificas.
SELECT nome, marca, id_categoria
FROM produto
WHERE id_categoria IN (1, 3, 4, 7)
ORDER BY id_categoria, nome;

-- Q5. Mostrar as diferentes formas de pagamento utilizadas.
SELECT DISTINCT forma_pagamento
FROM pagamento
ORDER BY forma_pagamento;

-- CONSULTAS COM INNER JOIN (Q6 a Q10)

-- Q6. Mostrar cada venda com cliente, funcionario, produto e quantidade.
SELECT v.id_venda, c.nome AS cliente, f.nome AS funcionario,
       p.nome AS produto, iv.quantidade, iv.preco_unitario,
       (iv.quantidade * iv.preco_unitario - iv.desconto) AS subtotal
FROM venda v
INNER JOIN cliente c ON v.id_cliente = c.id_cliente
INNER JOIN funcionario f ON v.id_funcionario = f.id_funcionario
INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
INNER JOIN produto p ON iv.id_produto = p.id_produto
ORDER BY v.id_venda, p.nome;

-- Q7. Calcular quantidade de itens vendidos e faturamento por categoria.
SELECT cat.nome AS categoria,
       COUNT(iv.id_produto) AS tipos_de_itens_vendidos,
       SUM(iv.quantidade) AS unidades_vendidas,
       ROUND(SUM(iv.quantidade * iv.preco_unitario - iv.desconto), 2) AS faturamento
FROM categoria cat
INNER JOIN produto p ON cat.id_categoria = p.id_categoria
INNER JOIN item_venda iv ON p.id_produto = iv.id_produto
INNER JOIN venda v ON iv.id_venda = v.id_venda
WHERE v.status = 'CONCLUIDA'
GROUP BY cat.id_categoria, cat.nome
HAVING SUM(iv.quantidade) >= 1
ORDER BY faturamento DESC;

-- Q8. Listar compras, fornecedores, funcionarios e produtos recebidos.
SELECT co.id_compra, fo.razao_social AS fornecedor,
       fu.nome AS funcionario, pr.nome AS produto,
       ic.quantidade, ic.custo_unitario,
       (ic.quantidade * ic.custo_unitario) AS total_item
FROM compra co
INNER JOIN fornecedor fo ON co.id_fornecedor = fo.id_fornecedor
INNER JOIN funcionario fu ON co.id_funcionario = fu.id_funcionario
INNER JOIN item_compra ic ON co.id_compra = ic.id_compra
INNER JOIN produto pr ON ic.id_produto = pr.id_produto
ORDER BY co.id_compra;

-- Q9. Calcular preco medio, maior e menor preco dos produtos por categoria.
SELECT cat.nome AS categoria,
       ROUND(AVG(p.preco_venda), 2) AS preco_medio,
       MAX(p.preco_venda) AS maior_preco,
       MIN(p.preco_venda) AS menor_preco
FROM categoria cat
INNER JOIN produto p ON cat.id_categoria = p.id_categoria
GROUP BY cat.id_categoria, cat.nome
ORDER BY preco_medio DESC;

-- Q10. Mostrar o total vendido por funcionario.
SELECT f.nome AS funcionario,
       COUNT(DISTINCT v.id_venda) AS quantidade_vendas,
       ROUND(SUM(iv.quantidade * iv.preco_unitario - iv.desconto), 2) AS total_vendido
FROM funcionario f
INNER JOIN venda v ON f.id_funcionario = v.id_funcionario
INNER JOIN item_venda iv ON v.id_venda = iv.id_venda
WHERE v.status = 'CONCLUIDA'
GROUP BY f.id_funcionario, f.nome
ORDER BY total_vendido DESC;

-- CONSULTAS BONUS

-- Q11. Encontrar produtos com preco acima da media geral (subconsulta).
SELECT nome, marca, preco_venda
FROM produto
WHERE preco_venda > (SELECT AVG(preco_venda) FROM produto)
ORDER BY preco_venda DESC;

-- Q12. Listar todos os produtos, inclusive os que ainda nao aparecem em vendas (LEFT JOIN).
SELECT p.nome AS produto,
       COALESCE(SUM(iv.quantidade), 0) AS unidades_vendidas
FROM produto p
LEFT JOIN item_venda iv ON p.id_produto = iv.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY unidades_vendidas DESC, p.nome;
