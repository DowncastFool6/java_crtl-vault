-- =====================================================
-- CRIAÇÃO DO DATABASE
-- =====================================================

CREATE DATABASE IF NOT EXISTS projectdocs;
USE projectdocs;

-- =====================================================
-- TABELA: tb_tipo_usuario
-- =====================================================

CREATE TABLE tb_tipo_usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL UNIQUE
);

-- =====================================================
-- TABELA: tb_usuario
-- =====================================================

CREATE TABLE tb_usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    id_tipo_usuario INT NOT NULL,
    ativo TINYINT(1) NOT NULL DEFAULT 1,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_usuario_tipo
        FOREIGN KEY (id_tipo_usuario)
        REFERENCES tb_tipo_usuario(id)
        ON DELETE RESTRICT
);

-- =====================================================
-- TABELA: tb_projeto
-- =====================================================

CREATE TABLE tb_projeto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABELA: tb_usuario_projeto (Relacionamento N:N)
-- =====================================================

CREATE TABLE tb_usuario_projeto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_projeto INT NOT NULL,

    CONSTRAINT fk_usuario_projeto_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES tb_usuario(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_usuario_projeto_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES tb_projeto(id)
        ON DELETE CASCADE,

    UNIQUE (id_usuario, id_projeto)
);

-- =====================================================
-- TABELA: tb_conteudo
-- =====================================================

CREATE TABLE tb_conteudo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_projeto INT NOT NULL,
    tipo_conteudo VARCHAR(50) NOT NULL,
    conteudo TEXT NOT NULL,
    ordem_exibicao INT,
    data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_edicao DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    id_usuario_criacao INT NOT NULL,
    id_usuario_edicao INT,

    CONSTRAINT fk_conteudo_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES tb_projeto(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_conteudo_usuario_criacao
        FOREIGN KEY (id_usuario_criacao)
        REFERENCES tb_usuario(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_conteudo_usuario_edicao
        FOREIGN KEY (id_usuario_edicao)
        REFERENCES tb_usuario(id)
        ON DELETE SET NULL
);

-- =====================================================
-- TABELA: tb_contato
-- =====================================================

CREATE TABLE tb_contato (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_projeto INT NOT NULL,
    id_usuario INT NOT NULL,
    mensagem TEXT NOT NULL,
    flg_lida TINYINT(1) NOT NULL DEFAULT 0,
    data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_contato_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES tb_projeto(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_contato_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES tb_usuario(id)
        ON DELETE CASCADE
);