CREATE DATABASE IF NOT EXISTS sistema_autopecas
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE sistema_autopecas;

-- 1. Clientes
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE),
    status CHAR(1) NOT NULL DEFAULT 'A',
    CONSTRAINT ck_cliente_status CHECK (status IN ('A', 'I'))
) ENGINE=InnoDB;

-- 2. Funcionarios
CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(60) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL,
    status CHAR(1) NOT NULL DEFAULT 'A',
    CONSTRAINT ck_funcionario_salario CHECK (salario > 0),
    CONSTRAINT ck_funcionario_status CHECK (status IN ('A', 'I'))
) ENGINE=InnoDB;

-- 3. Fornecedores
CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(140) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    status CHAR(1) NOT NULL DEFAULT 'A',
    CONSTRAINT ck_fornecedor_status CHECK (status IN ('A', 'I'))
) ENGINE=InnoDB;

-- 4. Categorias de produtos
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    status CHAR(1) NOT NULL DEFAULT 'A',
    CONSTRAINT ck_categoria_status CHECK (status IN ('A', 'I'))
) ENGINE=InnoDB;

-- 5. Produtos
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nome VARCHAR(120) NOT NULL,
    marca VARCHAR(80) NOT NULL,
    modelo_aplicacao VARCHAR(120),
    preco_venda DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    estoque_minimo INT NOT NULL DEFAULT 5,
    status CHAR(1) NOT NULL DEFAULT 'A',
    CONSTRAINT ck_produto_preco CHECK (preco_venda > 0),
    CONSTRAINT ck_produto_estoque CHECK (quantidade_estoque >= 0),
    CONSTRAINT ck_produto_estoque_min CHECK (estoque_minimo >= 0),
    CONSTRAINT ck_produto_status CHECK (status IN ('A', 'I')),
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 6. Vendas
CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(15) NOT NULL DEFAULT 'CONCLUIDA',
    CONSTRAINT ck_venda_status CHECK (status IN ('ABERTA', 'CONCLUIDA', 'CANCELADA')),
    CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_venda_funcionario FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id_funcionario)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 7. Itens da venda: tabela associativa entre venda e produto (N:N)
CREATE TABLE item_venda (
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (id_venda, id_produto),
    CONSTRAINT ck_item_venda_quantidade CHECK (quantidade > 0),
    CONSTRAINT ck_item_venda_preco CHECK (preco_unitario > 0),
    CONSTRAINT ck_item_venda_desconto CHECK (desconto >= 0),
    CONSTRAINT fk_item_venda_venda FOREIGN KEY (id_venda)
        REFERENCES venda(id_venda)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_item_venda_produto FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 8. Compras realizadas junto aos fornecedores
CREATE TABLE compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_compra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(15) NOT NULL DEFAULT 'RECEBIDA',
    CONSTRAINT ck_compra_status CHECK (status IN ('PENDENTE', 'RECEBIDA', 'CANCELADA')),
    CONSTRAINT fk_compra_fornecedor FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor(id_fornecedor)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_compra_funcionario FOREIGN KEY (id_funcionario)
        REFERENCES funcionario(id_funcionario)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 9. Itens da compra: tabela associativa entre compra e produto (N:N)
CREATE TABLE item_compra (
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    custo_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_compra, id_produto),
    CONSTRAINT ck_item_compra_quantidade CHECK (quantidade > 0),
    CONSTRAINT ck_item_compra_custo CHECK (custo_unitario > 0),
    CONSTRAINT fk_item_compra_compra FOREIGN KEY (id_compra)
        REFERENCES compra(id_compra)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_item_compra_produto FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 10. Pagamentos: venda-pagamento e uma relacao 1:1
CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL UNIQUE,
    forma_pagamento VARCHAR(20) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(15) NOT NULL DEFAULT 'APROVADO',
    CONSTRAINT ck_pagamento_valor CHECK (valor > 0),
    CONSTRAINT ck_pagamento_forma CHECK (
        forma_pagamento IN ('DINHEIRO', 'PIX', 'DEBITO', 'CREDITO', 'TRANSFERENCIA')
    ),
    CONSTRAINT ck_pagamento_status CHECK (status IN ('PENDENTE', 'APROVADO', 'RECUSADO')),
    CONSTRAINT fk_pagamento_venda FOREIGN KEY (id_venda)
        REFERENCES venda(id_venda)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Conferencia: listar as tabelas criadas
SHOW TABLES;