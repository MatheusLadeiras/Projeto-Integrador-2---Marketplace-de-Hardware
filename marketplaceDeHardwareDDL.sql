-- Criar e acessar o banco de dados
CREATE DATABASE marketplaceDeHardware
USE marketplaceDeHardware

-- Criar tabela Usuarios
create table Usuarios (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY, -- diferente
	cpf varchar(11) NOT NULL,
	email varchar(255) NOT NULL,
	nome_completo varchar(255) NOT NULL,
	hash_senha varchar(255) NOT NULL,
	saldo_disponivel float(10,2) CHECK (saldo_disponivel >= 0),
	saldo_bloqueado float(10,2) CHECK (saldo_bloqueado >= 0),
	reputacao_vendas float CHECK (5.0 <= reputacao_vendas >= 0),
	role enum ('ADMIN', 'CLIENTE') NOT NULL,
	UNIQUE (cpf, email, hash_senha)
);

-- Criar tabela Evidencias
create table Evidencias (
	hash_arquivo varchar(255) PRIMARY KEY,
	url_armazenamento varchar(255),
	tipo_mime varchar(255),
	data_upload datetime
);

-- Criar tabela Disputas
create table Disputas (
	protocolo_disputa varchar(255) PRIMARY KEY,
	motivo enum ('DEFEITO_FUNCIONAL', 'DANO_TRANSPORTE', 'ITEM_DIVERGENTE') NOT NULL,
	relatorio_comprador varchar(255),
	data_abertura datetime,
	status enum ('ABERTA', 'EM_ANALISE', 'AGUARDANDO_PROVAS', 'ENCERRADA') NOT NULL,
	veredito enum ('PENDENTE', 'FAVORAVEL_COMPRADOR', 'FAVORAVEL_VENDEDOR') NOT NULL,
	evidencia varchar(255), 
	moderador int,
	foreign key (evidencia) references Evidencias(hash_arquivo),
	foreign key (moderador) references Usuarios(id_usuario)
);

-- Criar tabela Envios
create table Envios (
	codigo_rastreamento varchar(255) PRIMARY KEY,
	transportadora varchar(255),
	data_despacho datetime,
	data_entrega_efetiva datetime
);

-- Criar tabela ContasCustodia
create table ContasCustodia (
	id_custodia_transacao INT AUTO_INCREMENT PRIMARY KEY, -- diferente,
	montante_pedido float(10,2) CHECK (montante_pedido >= 0),
	status enum('RETIRADA', 'CONGELADA_DISPUTA', 'LIQUIDA_VENDEDOR', 'ESTORNADA_COMPRADOR')
);

-- Criar tabela Categorias
create table Categorias (
	slug_categoria varchar(255) PRIMARY KEY,
	nome varchar(255) NOT NULL,
	descricao varchar(255)
);

-- Criar tabela ModelosHardware
create table ModelosHardware (
	id_parte INT AUTO_INCREMENT PRIMARY KEY, -- diferente
	fabricante varchar(255),
	linha_modelo varchar(255),
	especificacao_tecnica varchar(255),
	preco_mediano_historico float(10,2) CHECK (preco_mediano_historico >= 0),
	categoria varchar(255),
	foreign key (categoria) references Categorias(slug_categoria)
);

-- Criar tabela Anuncios
create table Anuncios (
	codigo_anuncio varchar(255) PRIMARY KEY,
	vendedor INT NOT NULL, -- diferente
	titulo varchar(255) NOT NULL,
	preco_venda float(10,2) NOT null CHECK (preco_venda >= 0),
	aliquota_taxa_aplicada float(10,2) CHECK (aliquota_taxa_aplicada >= 0),
	valor_taxa_plataforma float(10,2) CHECK (valor_taxa_plataforma >= 0),
	valor_liquido_vendedor float(10,2) CHECK (valor_liquido_vendedor >= 0),
	estado_item enum('NOVO', 'USADO_EXCELENTE', 'USADO_BOM', 'USADO_DEFEITO') NOT NULL,
	status enum('RASCUNHO', 'ATIVO', 'PAUSADO', 'VENDIDO') NOT NULL,
	id_parte INT NOT NULL, -- diferente
	foreign key (vendedor) references Usuarios(id_usuario),
	foreign key (id_parte) references ModelosHardware(id_parte)
);

-- Criar tabela Pedidos
create table Pedidos (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY, -- diferente
	data_hora_criacao datetime,
	valor_total_transacao float(10,2) NOT null CHECK (valor_total_transacao >= 0),
	status_pedido enum('AGUARDANDO_ENVIO', 'ENVIADO', 'ENTREGUE', 'EM_DISPUTA', 'CONCLUIDO', 'CANCELADO') NOT NULL,
	data_limite_homologacao datetime,
	
	comprador INT NOT NULL, -- diferente
	anuncio varchar(255) NOT NULL,
	disputa varchar(255),
	Envio varchar(255), 
	Conta INT, -- diferente
	
	foreign key (comprador) references Usuarios(id_usuario),
	foreign key (anuncio) references Anuncios(codigo_anuncio),
	foreign key (disputa) references Disputas(protocolo_disputa),
	foreign key (Envio) references Envios(codigo_rastreamento),
	foreign key (Conta) references ContasCustodia(id_custodia_transacao)
);












