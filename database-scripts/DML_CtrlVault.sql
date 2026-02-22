-- ============================================
-- TIPOS DE USUÁRIO
-- ============================================

INSERT INTO tb_tipo_usuario (descricao) VALUES
('ADMIN'),
('GESTOR'),
('USUARIO');

-- ============================================
-- USUÁRIOS
-- ============================================

INSERT INTO tb_usuario 
(nome, email, senha, id_tipo_usuario, ativo, data_criacao)
VALUES
('Carlos Admin', 'admin@projectdocs.com', '$2a$10$hashadmin123', 1, 1, NOW()),
('Marina Gestora', 'gestor@projectdocs.com', '$2a$10$hashgestor123', 2, 1, NOW()),
('João Silva', 'joao@projectdocs.com', '$2a$10$hashusuario123', 3, 1, NOW()),
('Ana Souza', 'ana@projectdocs.com', '$2a$10$hashusuario456', 3, 1, NOW()),
('Pedro Lima', 'pedro@projectdocs.com', '$2a$10$hashusuario789', 3, 1, NOW());

-- ============================================
-- PROJETOS
-- ============================================

INSERT INTO tb_projeto
(descricao, data_inicio, data_fim, data_criacao)
VALUES
('Sistema de Gestão Escolar', '2025-01-01', '2025-06-30', NOW()),
('Portal Corporativo', '2025-02-01', '2025-08-31', NOW()),
('Aplicativo Mobile Financeiro', '2025-03-01', '2025-12-31', NOW());

-- ============================================
-- RELACIONAMENTO USUÁRIO x PROJETO
-- ============================================

INSERT INTO tb_usuario_projeto (id_usuario, id_projeto) VALUES
(1,1), -- Admin no Projeto 1
(2,1), -- Gestor no Projeto 1
(3,1), -- João no Projeto 1
(4,2), -- Ana no Projeto 2
(2,2), -- Gestor no Projeto 2
(5,3), -- Pedro no Projeto 3
(1,3); -- Admin no Projeto 3

-- ============================================
-- CONTEÚDOS
-- ============================================

INSERT INTO tb_conteudo
(id_projeto, tipo_conteudo, conteudo, ordem_exibicao, data_criacao, data_edicao, id_usuario_criacao, id_usuario_edicao)
VALUES
(1, 'DOCUMENTO', 'Documento inicial de requisitos.', 1, NOW(), NULL, 2, NULL),
(1, 'IMAGEM', 'Diagrama UML do sistema.', 2, NOW(), NOW(), 2, 1),
(2, 'VIDEO', 'Apresentação do Portal Corporativo.', 1, NOW(), NULL, 4, NULL),
(3, 'DOCUMENTO', 'Planejamento financeiro inicial.', 1, NOW(), NOW(), 5, 2);

-- ============================================
-- CONTATOS / MENSAGENS
-- ============================================

INSERT INTO tb_contato
(id_projeto, id_usuario, mensagem, flg_lida, data_envio)
VALUES
(1,3,'Tenho dúvidas sobre os requisitos do projeto.', 0, NOW()),
(1,4,'Podemos marcar reunião para alinhar escopo?', 1, NOW()),
(2,5,'Enviei nova versão do documento.', 0, NOW()),
(3,3,'Precisamos revisar o cronograma.', 1, NOW());