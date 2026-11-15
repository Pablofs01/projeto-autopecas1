-- SISTEMA DE AUTOPECAS  
USE sistema_autopecas;
START TRANSACTION;

INSERT INTO cliente (id_cliente, nome, cpf, telefone, email, data_cadastro, status) VALUES
(1, 'Cliente 01 - Joao Almeida', '10000000001', '38991000001', 'cliente01@email.com', '2026-01-02', 'A'),
(2, 'Cliente 02 - Maria Santos', '10000000002', '38991000002', 'cliente02@email.com', '2026-01-03', 'A'),
(3, 'Cliente 03 - Carlos Souza', '10000000003', '38991000003', 'cliente03@email.com', '2026-01-04', 'A'),
(4, 'Cliente 04 - Ana Oliveira', '10000000004', '38991000004', 'cliente04@email.com', '2026-01-05', 'A'),
(5, 'Cliente 05 - Lucas Pereira', '10000000005', '38991000005', 'cliente05@email.com', '2026-01-06', 'A'),
(6, 'Cliente 06 - Joao Almeida', '10000000006', '38991000006', 'cliente06@email.com', '2026-01-07', 'A'),
(7, 'Cliente 07 - Maria Santos', '10000000007', '38991000007', 'cliente07@email.com', '2026-01-08', 'A'),
(8, 'Cliente 08 - Carlos Souza', '10000000008', '38991000008', 'cliente08@email.com', '2026-01-09', 'A'),
(9, 'Cliente 09 - Ana Oliveira', '10000000009', '38991000009', 'cliente09@email.com', '2026-01-10', 'A'),
(10, 'Cliente 10 - Lucas Pereira', '10000000010', '38991000010', 'cliente10@email.com', '2026-01-11', 'A'),
(11, 'Cliente 11 - Joao Almeida', '10000000011', '38991000011', 'cliente11@email.com', '2026-01-12', 'A'),
(12, 'Cliente 12 - Maria Santos', '10000000012', '38991000012', 'cliente12@email.com', '2026-01-13', 'A'),
(13, 'Cliente 13 - Carlos Souza', '10000000013', '38991000013', 'cliente13@email.com', '2026-01-14', 'A'),
(14, 'Cliente 14 - Ana Oliveira', '10000000014', '38991000014', 'cliente14@email.com', '2026-01-15', 'A'),
(15, 'Cliente 15 - Lucas Pereira', '10000000015', '38991000015', 'cliente15@email.com', '2026-01-16', 'A');

INSERT INTO funcionario (id_funcionario, nome, cpf, cargo, salario, data_admissao, status) VALUES
(1, 'Roberto Mendes', '20000000001', 'Gerente', 4200, '2024-02-10', 'A'),
(2, 'Patricia Araujo', '20000000002', 'Vendedora', 2600, '2024-03-10', 'A'),
(3, 'Felipe Andrade', '20000000003', 'Vendedor', 2550, '2024-04-10', 'A'),
(4, 'Vanessa Lopes', '20000000004', 'Caixa', 2300, '2024-05-10', 'A'),
(5, 'Gustavo Freitas', '20000000005', 'Estoquista', 2400, '2024-06-10', 'A'),
(6, 'Aline Batista', '20000000006', 'Gerente', 4200, '2024-07-10', 'A'),
(7, 'Thiago Ribeiro', '20000000007', 'Vendedora', 2600, '2024-08-10', 'A'),
(8, 'Monica Campos', '20000000008', 'Vendedor', 2550, '2024-09-10', 'A'),
(9, 'Eduardo Pires', '20000000009', 'Caixa', 2300, '2024-10-10', 'A'),
(10, 'Renata Cardoso', '20000000010', 'Estoquista', 2400, '2024-11-10', 'A'),
(11, 'Samuel Costa', '20000000011', 'Gerente', 4200, '2024-12-10', 'A'),
(12, 'Priscila Moura', '20000000012', 'Vendedora', 2600, '2024-01-10', 'A'),
(13, 'Anderson Vieira', '20000000013', 'Vendedor', 2550, '2024-02-10', 'A'),
(14, 'Debora Nascimento', '20000000014', 'Caixa', 2300, '2024-03-10', 'A'),
(15, 'Leonardo Faria', '20000000015', 'Estoquista', 2400, '2024-04-10', 'A');

INSERT INTO fornecedor (id_fornecedor, razao_social, cnpj, telefone, email, status) VALUES
(1, 'Autopecas Minas Ltda', '30000000000001', '3133000001', 'vendas01@fornecedor.com.br', 'A'),
(2, 'Brasil Auto Distribuidora Ltda', '30000000000002', '3133000002', 'vendas02@fornecedor.com.br', 'A'),
(3, 'Freios e Cia Ltda', '30000000000003', '3133000003', 'vendas03@fornecedor.com.br', 'A'),
(4, 'Motor Forte Ltda', '30000000000004', '3133000004', 'vendas04@fornecedor.com.br', 'A'),
(5, 'Baterias Nacional Ltda', '30000000000005', '3133000005', 'vendas05@fornecedor.com.br', 'A'),
(6, 'Lubrificantes Gerais Ltda', '30000000000006', '3133000006', 'vendas06@fornecedor.com.br', 'A'),
(7, 'Suspensao Total Ltda', '30000000000007', '3133000007', 'vendas07@fornecedor.com.br', 'A'),
(8, 'Eletrica Automotiva Ltda', '30000000000008', '3133000008', 'vendas08@fornecedor.com.br', 'A'),
(9, 'Filtros Brasil Ltda', '30000000000009', '3133000009', 'vendas09@fornecedor.com.br', 'A'),
(10, 'Pneus e Rodas Centro Ltda', '30000000000010', '3133000010', 'vendas10@fornecedor.com.br', 'A'),
(11, 'Embreagem Minas Ltda', '30000000000011', '3133000011', 'vendas11@fornecedor.com.br', 'A'),
(12, 'Arrefecimento Ideal Ltda', '30000000000012', '3133000012', 'vendas12@fornecedor.com.br', 'A'),
(13, 'Acessorios Estrada Ltda', '30000000000013', '3133000013', 'vendas13@fornecedor.com.br', 'A'),
(14, 'Iluminacao Veicular Ltda', '30000000000014', '3133000014', 'vendas14@fornecedor.com.br', 'A'),
(15, 'Autopecas Regional Ltda', '30000000000015', '3133000015', 'vendas15@fornecedor.com.br', 'A');

INSERT INTO categoria (id_categoria, nome, descricao, status) VALUES
(1, 'Freios', 'Componentes e pecas da categoria freios', 'A'),
(2, 'Motor', 'Componentes e pecas da categoria motor', 'A'),
(3, 'Filtros', 'Componentes e pecas da categoria filtros', 'A'),
(4, 'Lubrificantes', 'Componentes e pecas da categoria lubrificantes', 'A'),
(5, 'Suspensao', 'Componentes e pecas da categoria suspensao', 'A'),
(6, 'Eletrica', 'Componentes e pecas da categoria eletrica', 'A'),
(7, 'Baterias', 'Componentes e pecas da categoria baterias', 'A'),
(8, 'Arrefecimento', 'Componentes e pecas da categoria arrefecimento', 'A'),
(9, 'Embreagem', 'Componentes e pecas da categoria embreagem', 'A'),
(10, 'Transmissao', 'Componentes e pecas da categoria transmissao', 'A'),
(11, 'Iluminacao', 'Componentes e pecas da categoria iluminacao', 'A'),
(12, 'Pneus', 'Componentes e pecas da categoria pneus', 'A'),
(13, 'Acessorios', 'Componentes e pecas da categoria acessorios', 'A'),
(14, 'Direcao', 'Componentes e pecas da categoria direcao', 'A'),
(15, 'Escapamento', 'Componentes e pecas da categoria escapamento', 'A');

INSERT INTO produto (id_produto, id_categoria, codigo, nome, marca, modelo_aplicacao, preco_venda, quantidade_estoque, estoque_minimo, status) VALUES
(1, 1, 'PEC-001', 'Pastilha de freio dianteira', 'Fras-le', 'Onix 2018-2023', 189.9, 32, 5, 'A'),
(2, 2, 'PEC-002', 'Disco de freio ventilado', 'Fremax', 'Gol 2017-2022', 249.9, 18, 5, 'A'),
(3, 3, 'PEC-003', 'Correia dentada', 'Gates', 'Palio 2012-2017', 119.9, 25, 5, 'A'),
(4, 4, 'PEC-004', 'Filtro de oleo', 'Tecfil', 'Corolla 2015-2022', 32.9, 60, 5, 'A'),
(5, 5, 'PEC-005', 'Filtro de ar do motor', 'Mann', 'Civic 2014-2020', 54.9, 40, 5, 'A'),
(6, 6, 'PEC-006', 'Oleo de motor 5W30 1L', 'Lubrax', 'Multimarcas', 39.9, 75, 5, 'A'),
(7, 7, 'PEC-007', 'Amortecedor dianteiro', 'Monroe', 'Onix 2013-2019', 389.9, 14, 5, 'A'),
(8, 8, 'PEC-008', 'Alternador 90A', 'Bosch', 'Fox 2010-2017', 689.9, 8, 5, 'A'),
(9, 9, 'PEC-009', 'Bateria 60Ah', 'Moura', 'Veiculos leves', 549.9, 12, 5, 'A'),
(10, 10, 'PEC-010', 'Valvula termostatica', 'Wahler', 'Uno 2010-2016', 89.9, 20, 5, 'A'),
(11, 11, 'PEC-011', 'Kit de embreagem', 'Luk', 'Ford Ka 2015-2020', 729.9, 7, 5, 'A'),
(12, 12, 'PEC-012', 'Junta homocinetica', 'Nakata', 'Corsa 2002-2012', 219.9, 16, 5, 'A'),
(13, 13, 'PEC-013', 'Lampada H4', 'Philips', 'Multimarcas', 29.9, 90, 5, 'A'),
(14, 14, 'PEC-014', 'Pneu 175/70 R14', 'Goodyear', 'Veiculos compactos', 399.9, 22, 5, 'A'),
(15, 15, 'PEC-015', 'Tapete automotivo', 'Bepo', 'Universal', 79.9, 28, 5, 'A');

INSERT INTO venda (id_venda, id_cliente, id_funcionario, data_venda, status) VALUES
(1, 1, 2, '2026-03-01 10:15:00', 'CONCLUIDA'),
(2, 2, 3, '2026-03-02 11:15:00', 'CONCLUIDA'),
(3, 3, 4, '2026-03-03 12:15:00', 'CONCLUIDA'),
(4, 4, 5, '2026-03-04 13:15:00', 'CONCLUIDA'),
(5, 5, 6, '2026-03-05 14:15:00', 'CONCLUIDA'),
(6, 6, 7, '2026-03-06 15:15:00', 'CONCLUIDA'),
(7, 7, 8, '2026-03-07 16:15:00', 'CONCLUIDA'),
(8, 8, 9, '2026-03-08 09:15:00', 'CONCLUIDA'),
(9, 9, 10, '2026-03-09 10:15:00', 'CONCLUIDA'),
(10, 10, 11, '2026-03-10 11:15:00', 'CONCLUIDA'),
(11, 11, 12, '2026-03-11 12:15:00', 'CONCLUIDA'),
(12, 12, 13, '2026-03-12 13:15:00', 'CONCLUIDA'),
(13, 13, 14, '2026-03-13 14:15:00', 'CONCLUIDA'),
(14, 14, 15, '2026-03-14 15:15:00', 'CONCLUIDA'),
(15, 15, 1, '2026-03-15 16:15:00', 'CONCLUIDA');

INSERT INTO item_venda (id_venda, id_produto, quantidade, preco_unitario, desconto) VALUES
(1, 1, 1, 189.9, 0),
(1, 4, 2, 32.9, 0),
(2, 2, 1, 249.9, 10),
(2, 6, 3, 39.9, 0),
(3, 3, 1, 119.9, 0),
(4, 5, 2, 54.9, 0),
(4, 13, 2, 29.9, 0),
(5, 7, 1, 389.9, 20),
(6, 8, 1, 689.9, 0),
(6, 6, 2, 39.9, 0),
(7, 9, 1, 549.9, 0),
(8, 10, 2, 89.9, 0),
(8, 4, 1, 32.9, 0),
(9, 11, 1, 729.9, 30),
(10, 12, 1, 219.9, 0),
(10, 15, 1, 79.9, 0),
(11, 13, 4, 29.9, 0),
(12, 14, 2, 399.9, 20),
(13, 1, 1, 189.9, 0),
(14, 5, 1, 54.9, 0),
(15, 6, 4, 39.9, 0);

INSERT INTO compra (id_compra, id_fornecedor, id_funcionario, data_compra, status) VALUES
(1, 1, 2, '2026-02-01 08:30:00', 'RECEBIDA'),
(2, 2, 3, '2026-02-02 08:30:00', 'RECEBIDA'),
(3, 3, 4, '2026-02-03 08:30:00', 'RECEBIDA'),
(4, 4, 5, '2026-02-04 08:30:00', 'RECEBIDA'),
(5, 5, 6, '2026-02-05 08:30:00', 'RECEBIDA'),
(6, 6, 7, '2026-02-06 08:30:00', 'RECEBIDA'),
(7, 7, 8, '2026-02-07 08:30:00', 'RECEBIDA'),
(8, 8, 9, '2026-02-08 08:30:00', 'RECEBIDA'),
(9, 9, 10, '2026-02-09 08:30:00', 'RECEBIDA'),
(10, 10, 11, '2026-02-10 08:30:00', 'RECEBIDA'),
(11, 11, 12, '2026-02-11 08:30:00', 'RECEBIDA'),
(12, 12, 13, '2026-02-12 08:30:00', 'RECEBIDA'),
(13, 13, 14, '2026-02-13 08:30:00', 'RECEBIDA'),
(14, 14, 15, '2026-02-14 08:30:00', 'RECEBIDA'),
(15, 15, 1, '2026-02-15 08:30:00', 'RECEBIDA');

INSERT INTO item_compra (id_compra, id_produto, quantidade, custo_unitario) VALUES
(1, 1, 10, 120),
(1, 4, 20, 18),
(2, 2, 8, 165),
(2, 6, 30, 24),
(3, 3, 12, 75),
(4, 5, 15, 33),
(4, 13, 40, 16),
(5, 9, 6, 390),
(6, 7, 5, 260),
(6, 10, 10, 55),
(7, 8, 3, 480),
(8, 11, 4, 510),
(8, 12, 8, 140),
(9, 4, 25, 18),
(10, 14, 10, 270),
(11, 15, 20, 45),
(12, 6, 35, 24),
(13, 1, 8, 120),
(14, 13, 50, 16),
(15, 5, 12, 33);

INSERT INTO pagamento (id_pagamento, id_venda, forma_pagamento, valor, data_pagamento, status) VALUES
(1, 1, 'PIX', 255.7, '2026-03-01 18:00:00', 'APROVADO'),
(2, 2, 'CREDITO', 359.6, '2026-03-02 18:00:00', 'APROVADO'),
(3, 3, 'DINHEIRO', 119.9, '2026-03-03 18:00:00', 'APROVADO'),
(4, 4, 'DEBITO', 169.6, '2026-03-04 18:00:00', 'APROVADO'),
(5, 5, 'PIX', 369.9, '2026-03-05 18:00:00', 'APROVADO'),
(6, 6, 'CREDITO', 769.7, '2026-03-06 18:00:00', 'APROVADO'),
(7, 7, 'PIX', 549.9, '2026-03-07 18:00:00', 'APROVADO'),
(8, 8, 'DINHEIRO', 212.7, '2026-03-08 18:00:00', 'APROVADO'),
(9, 9, 'CREDITO', 699.9, '2026-03-09 18:00:00', 'APROVADO'),
(10, 10, 'DEBITO', 299.8, '2026-03-10 18:00:00', 'APROVADO'),
(11, 11, 'PIX', 119.6, '2026-03-11 18:00:00', 'APROVADO'),
(12, 12, 'CREDITO', 779.8, '2026-03-12 18:00:00', 'APROVADO'),
(13, 13, 'DINHEIRO', 189.9, '2026-03-13 18:00:00', 'APROVADO'),
(14, 14, 'PIX', 54.9, '2026-03-14 18:00:00', 'APROVADO'),
(15, 15, 'DEBITO', 159.6, '2026-03-15 18:00:00', 'APROVADO');

COMMIT;

-- Conferencia: todas as tabelas devem ter pelo menos 15 registros.
SELECT 'cliente' AS tabela, COUNT(*) AS total FROM cliente
UNION ALL SELECT 'funcionario', COUNT(*) FROM funcionario
UNION ALL SELECT 'fornecedor', COUNT(*) FROM fornecedor
UNION ALL SELECT 'categoria', COUNT(*) FROM categoria
UNION ALL SELECT 'produto', COUNT(*) FROM produto
UNION ALL SELECT 'venda', COUNT(*) FROM venda
UNION ALL SELECT 'item_venda', COUNT(*) FROM item_venda
UNION ALL SELECT 'compra', COUNT(*) FROM compra
UNION ALL SELECT 'item_compra', COUNT(*) FROM item_compra
UNION ALL SELECT 'pagamento', COUNT(*) FROM pagamento;