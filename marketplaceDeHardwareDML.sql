-- Inserção na tabela usuário
INSERT INTO Usuarios(cpf, email, nome_completo, hash_senha, saldo_disponivel, saldo_bloqueado, reputacao_vendas , role) VALUES
('12345678910', 'lars.monsen@gmail.com', 'Lars Monsen', 'dhasudakekjfi23', 0, 0, 2, 'ADMIN'),
('10987654321', 'bia.monsen@gmail.com', 'Bia Monsen', 'dffsuw55ekjfi23', 0, 0, 0, 'ADMIN'),
('24924602078', 'osolsi.Sat@gmail.com', 'Osolsi Sat', 'dhasudakekjfi23', 0, 0, 5, 'CLIENTE'),
('80740889010', 'bumse.Sat@gmail.com', 'Bumse Sat', 'djueijgoajsdo', 0, 0, 4.5, 'CLIENTE'),
('42773715071', 'curufuo.gilzu@gmail.com', 'Curufuo Gilzu', '78y312ndajskdbu82', 1110, 0.05, 0, 'CLIENTE');

-- Inserção na tabela Evidencias
INSERT INTO Evidencias(hash_arquivo, url_armazenamento, tipo_mime, data_upload) VALUES
('f10e2821bbbea527ea02200352313bc059445190', 'https://www.4devs.com.br/codificar_sha1', '.html', '2022-04-22 03:42:56'),
('3e017d7e95e17f1492f1b3b0af5e9c5c89daef11', 'https://www.4devs.com.br/codificar_sha1', '.html', '2022-12-01 03:16:27'),
('de84ee61e1192025a597f980b0a00da60f14c943', 'https://www.4devs.com.br/codificar_sha1', '.html', '2022-11-02 17:27:09'),
('f3570c4cbebcfa17cff7a956a1cfa2345a2bc6ff', 'https://www.4devs.com.br/codificar_sha1', '.html', '2022-05-11 21:58:55'),
('61ffeeb53933738514629e7a20aa2c17ea42b0d0', 'https://www.4devs.com.br/codificar_sha1', '.html', '2022-08-02 11:26:46');

-- Inserção na tabela Disputas
INSERT INTO Disputas(protocolo_disputa, motivo, relatorio_comprador, data_abertura, status, veredito, evidencia, moderador) VALUES
('312312312', 'DEFEITO_FUNCIONAL', 'relatorio_comprador', '2022-04-22 03:42:56', 'ABERTA', 'PENDENTE', 'f10e2821bbbea527ea02200352313bc059445190', 2),
('3213123123123', 'DEFEITO_FUNCIONAL', 'relatorio_comprador', '2022-12-01 03:16:27', 'EM_ANALISE','FAVORAVEL_COMPRADOR', 'f10e2821bbbea527ea02200352313bc059445190', 2),
('123434134', 'DANO_TRANSPORTE', 'relatorio_comprador', '2022-11-02 17:27:09', 'EM_ANALISE','FAVORAVEL_COMPRADOR', 'f10e2821bbbea527ea02200352313bc059445190', 1),
('5456456456', 'ITEM_DIVERGENTE', 'relatorio_comprador', '2022-05-11 21:58:55', 'AGUARDANDO_PROVAS','FAVORAVEL_COMPRADOR', '61ffeeb53933738514629e7a20aa2c17ea42b0d0', 1),
('678768678678', 'ITEM_DIVERGENTE', 'relatorio_comprador', '2022-08-02 11:26:46', 'ENCERRADA', 'FAVORAVEL_VENDEDOR', '61ffeeb53933738514629e7a20aa2c17ea42b0d0', 1 );

-- Inserção tabela Envios
INSERT into Envios (codigo_rastreamento, transportadora, data_despacho, data_entrega_efetiva) values
('291317hasidas', 'Transportadora 1', '2023-12-10 07:58:02', '2022-04-22 03:42:56'),
('asdasdwereras', 'Transportadora 2', '2023-12-10 07:58:02', '2022-04-22 03:42:56'),
('4123asdar355', 'Transportadora 1', '2022-12-10 07:58:02', '2022-04-22 03:42:56'),
('asdasdasdasdwereraseras', 'Transportadora 156', '2023-12-20 07:58:02', '2022-04-22 03:42:56'),
('asadweeeef3242', 'Transportadora 12', '2023-12-18 07:58:02', '2012-04-22 04:42:56');

-- Inserção tabela ContasCustodia
INSERT into ContasCustodia (montante_pedido, status) values
(103.22, 'RETIRADA'),
(777.22, 'CONGELADA_DISPUTA'),
(103.72, 'RETIRADA'),
(103, 'LIQUIDA_VENDEDOR'),
(1036.22, 'ESTORNADA_COMPRADOR');

-- Inserção tabela Categorias
INSERT into Categorias (slug_categoria, nome, descricao) values
('slug_categoria1', 'nome4', 'descricao1'),
('slug_categoria3', 'nome3', 'descricao2'),
('slug_categoria2', 'nome36', 'descricao3'),
('slug_categoria5', 'nome2', 'descricao5'),
('slug_categoria6', 'nome1', 'descricao4');

-- Inserção tabela ModelosHardware
INSERT into ModelosHardware (fabricante, linha_modelo, especificacao_tecnica, preco_mediano_historico, categoria) values
('fabricante', 'linha_modelo', 'especificacao_tecnica', 1123.33, 'slug_categoria3'),
('fabricante2', 'linha_modelo', 'especificacao_tecnica', 12223.33, 'slug_categoria2'),
('fabricante3', 'linha_modelo', 'especificacao_tecnica', 1233333.33, 'slug_categoria5'),
('fabricante4', 'linha_modelo', 'especificacao_tecnica', 12443.33, 'slug_categoria1'),
('fabricante5', 'linha_modelo', 'especificacao_tecnica', 123, 'slug_categoria6');

-- Inserção tabela Anuncios
INSERT into Anuncios (codigo_anuncio, vendedor, titulo, preco_venda, aliquota_taxa_aplicada, valor_taxa_plataforma, valor_liquido_vendedor, estado_item, status, id_parte) values
('codigo_anuncio1', 1, 'titulo', 123, 123, 123, 123, 'NOVO', 'RASCUNHO', 1),
('codigo_anuncio2', 2, 'titulo', 123, 123, 123, 123, 'NOVO', 'RASCUNHO', 2),
('codigo_anuncio3', 3, 'titulo', 123, 123, 123, 123, 'NOVO', 'RASCUNHO', 3),
('codigo_anuncio4', 4, 'titulo', 123, 123, 123, 123, 'NOVO', 'RASCUNHO', 4),
('codigo_anuncio5', 5, 'titulo', 123, 123, 123, 123, 'NOVO', 'RASCUNHO', 5);

-- Inserção tabela Pedidos
INSERT into Pedidos (data_hora_criacao, valor_total_transacao, status_pedido, data_limite_homologacao, comprador, anuncio, disputa, Envio, Conta) values
('2022-06-07 02:01:32', 1020.12, 'AGUARDANDO_ENVIO', '2023-06-27 18:40:16', 3, 'codigo_anuncio2', '312312312', '291317hasidas', 1),
('2022-06-07 02:01:32', 100.12, 'ENVIADO', '2023-06-27 18:40:16', 4, 'codigo_anuncio3', '312312312', '291317hasidas', 3),
('2022-06-07 02:01:32', 1040.12, 'ENTREGUE', '2023-06-27 18:40:16', 4, 'codigo_anuncio2', '3213123123123', '291317hasidas', 2),
('2022-06-07 02:01:32', 100.12, 'EM_DISPUTA', '2023-06-27 18:40:16', 5, 'codigo_anuncio2', '678768678678', '291317hasidas', 4),
('2022-06-07 02:01:32', 1060.12, 'CANCELADO', '2023-06-27 18:40:16', 4, 'codigo_anuncio5', '3213123123123', '291317hasidas', 2),
('2022-06-07 02:01:32', 7100.12, 'CONCLUIDO', '2023-06-27 18:40:16', 1, 'codigo_anuncio2', '678768678678', '291317hasidas', 5);

-- 4devs & mockdatagen 