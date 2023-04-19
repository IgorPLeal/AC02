
CREATE TABLE tb_estados (
  id_estado INT NOT NULL AUTO_INCREMENT,
  uf_estado VARCHAR(2) NOT NULL,
  nome_estado VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_estado)
);
CREATE TABLE TB_CLIENTE (
							id_cliente INT NOT NULL AUTO_INCREMENT
						,	nome_cliente VARCHAR(50) NOT NULL 
                        ,	fantasia_cliente VARCHAR(20) NULL
                        ,	endereco_cliente	VARCHAR(60) NULL
                        ,	bairro_cliente		VARCHAR(30) NULL
                        ,	estado_cliente	INT NOT NULL
                        ,	cep_cliente 	VARCHAR(8) NULL
                        ,	tipo_cliente 	VARCHAR(1) NOT NULL
                        ,	cpf_cnpj		VARCHAR(18) NULL
                        ,	insc_estadual_cliente VARCHAR(15) NULL
                        ,	fone1_clinete	VARCHAR(15) NULL
                        ,	fone2_cliente 	VARCHAR(15) NULL
                        ,	email_cliente	VARCHAR(35) NULL
                        ,	data_cadastro	DATETIME NULL
                        ,	PRIMARY KEY (id_cliente)
					)
;

### criando tabela produtos e afins
CREATE TABLE tb_produtos (
							id_produto  	INT NOT NULL AUTO_INCREMENT
						 ,	nome_produto 	VARCHAR(50) NOT NULL
                         ,	descricao_produto	VARCHAR(50) NOT NULL
                         ,	sku_produto			VARCHAR(20) NOT NULL
                         ,	id_unidade			INT NULL   ###chave estrangeira
                         , 	id_tipo_produto		INT NULL   ###chave estrangeira
                         ,	preco_custo			NUMERIC(18, 4) NULL
                         ,	preco_venda			NUMERIC(18, 4) NULL
                         ,	ncm_produto			VARCHAR(10) NULL
                         ,	peso_liq_produto	NUMERIC(18, 2) NULL	
                         ,	peso_bruto_produto	NUMERIC(18, 2) NULL	
                         ,	codbarras_produto	VARCHAR(13) NULL
                         ,	cod_prod_fonercedor VARCHAR(20) NULL
                         ,	ipi_produto			NUMERIC(18, 2) NULL	
                         ,	cofins_produto		NUMERIC(18, 2) NULL	
                         ,	icms_produto		NUMERIC(18, 2) NULL	
                         ,	cod_local_estoque	SMALLINT NULL    ###chave estrangeira
                         ,	PRIMARY KEY (id_produto)
                         )
;
CREATE TABLE tb_unidade ( 
							id_unidade INT NOT NULL AUTO_INCREMENT
						,	nome_unidade VARCHAR(10)
                        ,   descricao_unidade VARCHAR(20)
                        ,   PRIMARY KEY (id_unidade)
                        )
;
CREATE TABLE tb_tipo_produto ( 
								id_tipo_produto INT NOT NULL AUTO_INCREMENT
							,	tipo_produto VARCHAR(10)
							,   descricao_tipo VARCHAR(20)
							,   PRIMARY KEY (id_tipo_produto)
							)
;

CREATE TABLE tb_local_estoque ( 
								cod_local_estoque INT NOT NULL AUTO_INCREMENT
							,	local_estoque VARCHAR(10)
							,   descricao_estoque VARCHAR(20)
							,   PRIMARY KEY (cod_local_estoque)
							)
;
ALTER TABLE tb_produtos
ADD CONSTRAINT fk_unidade
FOREIGN KEY (id_unidade)
REFERENCES  tb_unidade(id_unidade)
;
ALTER TABLE tb_produtos
ADD CONSTRAINT fk_tipo
FOREIGN KEY (id_tipo_produto)
REFERENCES  tb_tipo_produto(id_tipo_produto)
;
ALTER TABLE tb_produtos
ADD CONSTRAINT fk_local_estoque
FOREIGN KEY (cod_local_estoque)
REFERENCES  tb_local_estoque(cod_local_estoque)
;
ALTER TABLE tb_cliente
ADD CONSTRAINT fk_estado
FOREIGN KEY (estado_cliente)
REFERENCES  tb_estados(id_estado)
on delete restrict 
;

CREATE TABLE tb_orcamento (
							id_orcamento  	  INT NOT NULL AUTO_INCREMENT
						 ,	nome_orcamento   		VARCHAR(50) NOT NULL
                         ,	descricao_orcamento		VARCHAR(50) NOT NULL
                         ,	observacao_orcamento	VARCHAR(200) NOT NULL
                         ,	id_cliente				INT NULL   ###chave estrangeira
                         , 	nvalor_orcamento		NUMERIC(18, 4) NULL   
                         ,	nvalor_servico			NUMERIC(18, 4) NULL
                         ,	nvalor_produto			NUMERIC(18, 4) NULL
                         ,	observacao_cliente		VARCHAR(200) NOT NULL
                         ,	produto_cliente			VARCHAR(20) NOT NULL
                         ,	PRIMARY KEY (id_orcamento)
                         )
;
CREATE TABLE tb_itens_orcamento (
							id_orcamento  	  INT NOT NULL 
						 ,	id_produto   		INT NOT NULL
                         ,	nome_produto 		VARCHAR(50) NOT NULL
                         ,	preco_venda			NUMERIC(18, 4) NULL
						,	observacao_iten		VARCHAR(40) NULL
								)
;
ALTER TABLE tb_itens_orcamento
ADD CONSTRAINT fk_id_orcamento
FOREIGN KEY (id_orcamento)
REFERENCES  tb_orcamento(id_orcamento)
on delete restrict 
;
ALTER TABLE tb_itens_orcamento
ADD CONSTRAINT fk_id_produto
FOREIGN KEY (id_produto)
REFERENCES  tb_produtos(id_produto)
on delete restrict 
;
ALTER TABLE tb_orcamento ADD COLUMN data_orcamento DATETIME NOT NULL
;
CREATE TABLE tb_servicos (
							id_servico  	INT NOT NULL AUTO_INCREMENT
						 ,	nome_servico 	VARCHAR(50) NOT NULL
                         ,	descricao_servico	VARCHAR(50) NOT NULL
                         ,	PRIMARY KEY (id_servico)
                         )
;

CREATE TABLE tb_servico_orcamento (
							id_orcamento  	  INT NOT NULL 
						 ,	id_servico   		INT NOT NULL
                         ,	nome_servico 		VARCHAR(50) NOT NULL
                         ,	valor_servico		NUMERIC(18, 4) NULL
						,	observacao_servico		VARCHAR(40) NULL
								)
;
ALTER TABLE tb_servico_orcamento
ADD CONSTRAINT fk_id_orcamento_servico
FOREIGN KEY (id_orcamento)
REFERENCES  tb_orcamento(id_orcamento)
on delete restrict 
;
;
ALTER TABLE tb_servico_orcamento

ADD CONSTRAINT fk_id_servico
FOREIGN KEY (id_servico)
REFERENCES  tb_servicos(id_servico)
on delete restrict 
;

CREATE TABLE tb_venda ( 	id_venda 		 INT NOT NULL AUTO_INCREMENT
						 ,	id_orcamento 	 INT NULL
                         ,	id_tipo_venda	 INT NOT NULL
                         ,	id_cliente		 INT NOT NULL
                         ,	descricao_venda VARCHAR(30) NULL
                         ,	data_venda		DATETIME NOT NULL
                         ,	valor_orcamento	NUMERIC(18, 4) NULL
                         ,	PRIMARY KEY (id_venda)
                         )
;
ALTER TABLE tb_venda
ADD CONSTRAINT fk_id_orcamento_venda
FOREIGN KEY (id_orcamento)
REFERENCES  tb_orcamento(id_orcamento)
on delete restrict 
;


CREATE TABLE tb_itens_venda ( 	id_venda 	INT NOT NULL 
							,	nitem		INT NOT NULL 
							,	id_produto	 INT NULL
							,	preco_produto	 INT NOT NULL
							,	descricao_item VARCHAR(30) NULL
                            ,	PRIMARY KEY (id_venda)
							)
;
ALTER TABLE tb_itens_venda
ADD CONSTRAINT fk_id_id_produto
FOREIGN KEY (id_produto)
REFERENCES  tb_produtos(id_produto)
on delete restrict 
;

CREATE TABLE tb_fornecedor (
							id_fornecedor INT NOT NULL AUTO_INCREMENT
						,	nome_fornecedor VARCHAR(50) NOT NULL 
                        ,	fantasia_fornecedor VARCHAR(20) NULL
                        ,	endereco_fornecedor	VARCHAR(60) NULL
                        ,	bairro_fornecedor		VARCHAR(30) NULL
                        ,	estado_fornecedor	INT NOT NULL
                        ,	cep_fornecedor 	VARCHAR(8) NULL
                        ,	tipo_fornecedor 	VARCHAR(1) NOT NULL
                        ,	cpf_cnpj		VARCHAR(18) NULL
                        ,	insc_estadual_fornecedor VARCHAR(15) NULL
                        ,	fone1_fornecedor	VARCHAR(15) NULL
                        ,	fone2_fornecedor 	VARCHAR(15) NULL
                        ,	email_fornecedor	VARCHAR(35) NULL
						,	responsavel_fornecedor	VARCHAR(35) NULL
                        ,	data_fornecedor	DATETIME NULL
                        ,	PRIMARY KEY (id_fornecedor)
					)
;
;
ALTER TABLE tb_fornecedor
ADD CONSTRAINT fk_estado_fornecedor
FOREIGN KEY (estado_fornecedor)
REFERENCES  tb_estados(id_estado)
on delete restrict 
;