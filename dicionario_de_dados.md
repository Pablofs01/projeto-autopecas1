# Dicionário de Dados — Sistema de Autopeças

Tipos apresentados conforme o script MySQL. `PK` = chave primária; `FK` = chave estrangeira.

| Tabela | Campo | Tipo | Restrição | Descrição |
|---|---|---|---|---|
| cliente | id_cliente | INT | PK, AUTO_INCREMENT | Identificador do cliente |
| cliente | nome | VARCHAR(120) | NOT NULL | Nome completo |
| cliente | cpf | CHAR(11) | NOT NULL, UNIQUE | CPF sem pontuação |
| cliente | telefone | VARCHAR(20) | — | Telefone |
| cliente | email | VARCHAR(120) | UNIQUE | E-mail |
| cliente | data_cadastro | DATE | NOT NULL, DEFAULT | Data do cadastro |
| cliente | status | CHAR(1) | NOT NULL, DEFAULT, CHECK | A=ativo; I=inativo |
| funcionario | id_funcionario | INT | PK, AUTO_INCREMENT | Identificador do funcionário |
| funcionario | nome | VARCHAR(120) | NOT NULL | Nome |
| funcionario | cpf | CHAR(11) | NOT NULL, UNIQUE | CPF sem pontuação |
| funcionario | cargo | VARCHAR(60) | NOT NULL | Função na loja |
| funcionario | salario | DECIMAL(10,2) | NOT NULL, CHECK | Salário positivo |
| funcionario | data_admissao | DATE | NOT NULL | Data de admissão |
| funcionario | status | CHAR(1) | NOT NULL, DEFAULT, CHECK | A=ativo; I=inativo |
| fornecedor | id_fornecedor | INT | PK, AUTO_INCREMENT | Identificador do fornecedor |
| fornecedor | razao_social | VARCHAR(140) | NOT NULL | Nome empresarial |
| fornecedor | cnpj | CHAR(14) | NOT NULL, UNIQUE | CNPJ sem pontuação |
| fornecedor | telefone | VARCHAR(20) | — | Telefone |
| fornecedor | email | VARCHAR(120) | UNIQUE | E-mail |
| fornecedor | status | CHAR(1) | NOT NULL, DEFAULT, CHECK | A=ativo; I=inativo |
| categoria | id_categoria | INT | PK, AUTO_INCREMENT | Identificador da categoria |
| categoria | nome | VARCHAR(80) | NOT NULL, UNIQUE | Nome da categoria |
| categoria | descricao | VARCHAR(255) | — | Descrição |
| categoria | status | CHAR(1) | NOT NULL, DEFAULT, CHECK | A=ativa; I=inativa |
| produto | id_produto | INT | PK, AUTO_INCREMENT | Identificador do produto |
| produto | id_categoria | INT | FK, NOT NULL | Categoria do produto |
| produto | codigo | VARCHAR(30) | NOT NULL, UNIQUE | Código interno |
| produto | nome | VARCHAR(120) | NOT NULL | Nome da peça |
| produto | marca | VARCHAR(80) | NOT NULL | Fabricante/marca |
| produto | modelo_aplicacao | VARCHAR(120) | — | Veículo ou aplicação |
| produto | preco_venda | DECIMAL(10,2) | NOT NULL, CHECK | Preço positivo |
| produto | quantidade_estoque | INT | NOT NULL, DEFAULT, CHECK | Quantidade disponível |
| produto | estoque_minimo | INT | NOT NULL, DEFAULT, CHECK | Limite para reposição |
| produto | status | CHAR(1) | NOT NULL, DEFAULT, CHECK | A=ativo; I=inativo |
| venda | id_venda | INT | PK, AUTO_INCREMENT | Identificador da venda |
| venda | id_cliente | INT | FK, NOT NULL | Cliente da venda |
| venda | id_funcionario | INT | FK, NOT NULL | Funcionário responsável |
| venda | data_venda | DATETIME | NOT NULL, DEFAULT | Data e hora |
| venda | status | VARCHAR(15) | NOT NULL, DEFAULT, CHECK | ABERTA, CONCLUIDA ou CANCELADA |
| item_venda | id_venda | INT | PK composta, FK | Venda relacionada |
| item_venda | id_produto | INT | PK composta, FK | Produto vendido |
| item_venda | quantidade | INT | NOT NULL, CHECK | Unidades vendidas |
| item_venda | preco_unitario | DECIMAL(10,2) | NOT NULL, CHECK | Preço aplicado na venda |
| item_venda | desconto | DECIMAL(10,2) | NOT NULL, DEFAULT, CHECK | Desconto em reais no item |
| compra | id_compra | INT | PK, AUTO_INCREMENT | Identificador da compra |
| compra | id_fornecedor | INT | FK, NOT NULL | Fornecedor da compra |
| compra | id_funcionario | INT | FK, NOT NULL | Funcionário responsável |
| compra | data_compra | DATETIME | NOT NULL, DEFAULT | Data e hora |
| compra | status | VARCHAR(15) | NOT NULL, DEFAULT, CHECK | PENDENTE, RECEBIDA ou CANCELADA |
| item_compra | id_compra | INT | PK composta, FK | Compra relacionada |
| item_compra | id_produto | INT | PK composta, FK | Produto comprado |
| item_compra | quantidade | INT | NOT NULL, CHECK | Unidades compradas |
| item_compra | custo_unitario | DECIMAL(10,2) | NOT NULL, CHECK | Custo por unidade |
| pagamento | id_pagamento | INT | PK, AUTO_INCREMENT | Identificador do pagamento |
| pagamento | id_venda | INT | FK, NOT NULL, UNIQUE | Venda paga; UNIQUE limita a um pagamento por venda |
| pagamento | forma_pagamento | VARCHAR(20) | NOT NULL, CHECK | PIX, dinheiro, débito, crédito ou transferência |
| pagamento | valor | DECIMAL(10,2) | NOT NULL, CHECK | Valor pago |
| pagamento | data_pagamento | DATETIME | NOT NULL, DEFAULT | Data e hora do pagamento |
| pagamento | status | VARCHAR(15) | NOT NULL, DEFAULT, CHECK | PENDENTE, APROVADO ou RECUSADO |
