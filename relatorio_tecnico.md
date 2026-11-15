# Relatório Técnico — Sistema de Gerenciamento de Autopeças

## 1. Capa e identificação
**Instituição:** AFYA Centro Universitário  
**Curso:** Engenharia da Computação  
**Disciplina:** Banco de Dados  
**Projeto:** Sistema de Gerenciamento de Autopeças  
**Integrantes:** Pablo Fernandes de Souza e Lucas Oliveira Alves  
**Semestre:** 6º Semestre

## 2. Resumo executivo
O projeto propõe um banco de dados relacional para apoiar as atividades de uma loja de autopeças. O sistema organiza informações de clientes, funcionários, fornecedores, categorias e produtos, além de registrar compras, vendas, itens e pagamentos.

A implementação foi planejada em MySQL, com tabelas relacionadas por chaves primárias e estrangeiras. O banco permite consultar produtos, acompanhar operações comerciais e produzir informações como total vendido por funcionário, faturamento por categoria e histórico de compras.

## 3. Domínio e regras de negócio
O domínio escolhido é o comércio de peças automotivas. Cada produto pertence a uma categoria. Um cliente pode realizar várias vendas e cada venda é registrada por um funcionário. Uma venda pode conter vários produtos, e um mesmo produto pode aparecer em diferentes vendas; por isso, a relação entre venda e produto é resolvida pela tabela `item_venda`.

A loja também realiza compras de fornecedores. Uma compra pode conter vários produtos e um produto pode aparecer em diferentes compras; essa relação é resolvida por `item_compra`. Cada compra e cada venda possuem um funcionário responsável. No modelo desenvolvido, cada venda pode ter no máximo um registro de pagamento, garantido pela restrição UNIQUE em `pagamento.id_venda`.

Regras principais:
- CPF, CNPJ, e-mail e código do produto não podem se repetir quando definidos como únicos.
- Preços, salários, quantidades e valores monetários devem respeitar as verificações CHECK definidas no banco.
- Uma venda deve estar associada a um cliente e a um funcionário.
- Um produto deve pertencer a uma categoria.
- Os registros associados não podem ser excluídos quando isso violar as regras de integridade referencial.

## 4. Diagrama entidade-relacionamento
O diagrama editável está em `../diagrama/diagrama_autopecas.drawio`. Ele apresenta as dez tabelas e seus principais relacionamentos.

Relacionamentos:
- `categoria` 1:N `produto`.
- `cliente` 1:N `venda`.
- `funcionario` 1:N `venda`.
- `funcionario` 1:N `compra`.
- `fornecedor` 1:N `compra`.
- `venda` 1:N `item_venda` e `produto` 1:N `item_venda`, formando N:N entre venda e produto.
- `compra` 1:N `item_compra` e `produto` 1:N `item_compra`, formando N:N entre compra e produto.
- `venda` 1:0..1 `pagamento`, devido à chave UNIQUE em `pagamento.id_venda`.

## 5. Dicionário de dados
O dicionário completo, com campos, tipos, restrições e descrições, está no arquivo `dicionario_de_dados.md`.

## 6. Justificativa da normalização
O esquema foi organizado para buscar a Terceira Forma Normal (3FN). Na Primeira Forma Normal (1FN), os atributos armazenam valores individuais, sem listas de produtos dentro de uma única coluna. Na Segunda Forma Normal (2FN), os dados que dependem de uma combinação de chaves foram separados das entidades principais. Por exemplo, quantidade e preço aplicado de cada produto vendido ficam em `item_venda`, cuja chave primária é composta por `id_venda` e `id_produto`.

Na Terceira Forma Normal (3FN), informações de entidades independentes ficam em suas próprias tabelas. O nome da categoria não é repetido em cada produto; `produto` guarda apenas `id_categoria`. Da mesma forma, os dados do cliente e do funcionário ficam em suas tabelas, enquanto `venda` guarda suas referências. Essa separação reduz repetição e evita anomalias de atualização.

## 7. Catálogo de consultas
O arquivo `../sql/consultas_autopecas.sql` contém 12 consultas comentadas:
1. Produtos ativos em ordem alfabética.
2. Produtos com preço em uma faixa.
3. Pesquisa de produtos pelo nome com LIKE.
4. Produtos de categorias selecionadas com IN.
5. Formas de pagamento distintas.
6. Detalhes de vendas com cliente, funcionário e produtos (INNER JOIN).
7. Unidades e faturamento por categoria (INNER JOIN, COUNT, SUM, GROUP BY e HAVING).
8. Compras com fornecedor, funcionário e produtos (INNER JOIN).
9. Preço médio, maior e menor por categoria (AVG, MAX e MIN).
10. Total vendido por funcionário (INNER JOIN, COUNT, SUM e GROUP BY).
11. Produtos acima do preço médio (subconsulta).
12. Todos os produtos e unidades vendidas, inclusive sem venda (LEFT JOIN).

Cada consulta deve ser executada no MySQL Workbench e seu resultado explicado durante a demonstração.

## 8. Instruções de execução
1. Iniciar o MySQL Server e abrir uma conexão no MySQL Workbench.
2. Executar `sql/01_estrutura_autopecas.sql`.
3. Executar `sql/02_dados_autopecas.sql`.
4. Executar `sql/consultas_autopecas.sql`, preferencialmente uma consulta por vez para demonstrar os resultados.
5. Conferir o resultado de contagem no final do script de dados.

Os scripts devem ser executados na ordem indicada. Os registros são dados fictícios criados para demonstração acadêmica.

## 9. Considerações finais
O projeto reúne conceitos de modelagem relacional, integridade referencial, normalização e consultas SQL. Uma das decisões importantes foi utilizar tabelas associativas para representar vendas e compras com vários produtos. Como evolução, o sistema poderia incluir controle automático de estoque após cada operação, histórico de movimentações, endereço de clientes, parcelamento de pagamentos e relatórios por período.

## 10. Referências bibliográficas
- ORACLE. **MySQL 8.0 Reference Manual**. Disponível em: https://dev.mysql.com/doc/refman/8.0/en/. Acesso em: preencher a data de consulta.
- ELMASRI, Ramez; NAVATHE, Shamkant B. **Sistemas de Banco de Dados**. Pearson.
- MATERIAL didático da disciplina Banco de Dados. AFYA Centro Universitário. (Completar os dados conforme o material utilizado.)
