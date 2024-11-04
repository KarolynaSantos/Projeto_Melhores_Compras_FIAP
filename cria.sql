-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2024-10-29 10:16:54 BRT
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012


CREATE TABLE dim_mc_bairro 
    (
     sk_bairro NUMERIC (28) NOT NULL IDENTITY(1,1), -- Definido como autoincremental
     dim_mc_cidade NUMERIC (28) NOT NULL, 
     nm_bairro VARCHAR (50) NOT NULL, 
     nr_populacao NUMERIC (10), 
     nr_nivel_seguranca NUMERIC (1) 
    )
GO 

EXEC sp_addextendedproperty 'MS_Description', 'Esse atributo irá receber a chave surrogate key da dimensão LOJA. Seu conteúdo será numérico e sequencial e deve ser preenchido na fase de ETL seguindo regras pré-estabelecidas.'
, 'USER', 'dbo', 'TABLE', 'dim_mc_bairro', 'COLUMN', 'sk_bairro' 
GO

EXEC sp_addextendedproperty 'MS_Description', 'Esse atributo irá receber a data de fundação da loja que entregou o produto adquirido pelo cliente. O conteúdo será obrigatório, do tipo data.'
, 'USER', 'dbo', 'TABLE', 'dim_mc_bairro', 'COLUMN', 'nm_bairro' 
GO

ALTER TABLE dim_mc_bairro ADD CONSTRAINT pk_mc_dim_bairro PRIMARY KEY CLUSTERED (sk_bairro)
     WITH (
     ALLOW_PAGE_LOCKS = ON, 
     ALLOW_ROW_LOCKS = ON)
GO

CREATE TABLE dim_mc_categoria_prod 
    (
     sk_categoria_prod NUMERIC (28) NOT NULL IDENTITY(1,1), 
     nm_categoria_prod VARCHAR (60) NOT NULL , 
     st_categoria VARCHAR (8) NOT NULL , 
     qt_nota_categoria_prod NUMERIC (2) 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o LOJA. Seu conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.
' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_categoria_prod' , 'COLUMN' , 'sk_categoria_prod' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a data de funda  o da loja que entregou o produto adquirido pelo cliente. O conte do ser  obrigat rio, do tipo data. ' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_categoria_prod' , 'COLUMN' , 'nm_categoria_prod' 
GO

ALTER TABLE dim_mc_categoria_prod ADD CONSTRAINT pk_mc_dim_categoria_prod PRIMARY KEY CLUSTERED (sk_categoria_prod)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_centro_distribuicao 
    (
     sk_centro_distribuicao NUMERIC (28) NOT NULL IDENTITY(1,1), 
     nm_centro_distribuicao VARCHAR (60) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o LOJA. Seu conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.
' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_centro_distribuicao' , 'COLUMN' , 'sk_centro_distribuicao' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a data de funda  o da loja que entregou o produto adquirido pelo cliente. O conte do ser  obrigat rio, do tipo data. ' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_centro_distribuicao' , 'COLUMN' , 'nm_centro_distribuicao' 
GO

ALTER TABLE dim_mc_centro_distribuicao ADD CONSTRAINT pk_mc_dim_cd PRIMARY KEY CLUSTERED (sk_centro_distribuicao)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_cidade 
    (
     sk_cidade NUMERIC (28) NOT NULL IDENTITY(1,1), 
     dim_mc_estado NUMERIC (28) NOT NULL , 
     nm_cidade VARCHAR (25) NOT NULL , 
     nr_populacao NUMERIC (10) , 
     cd_ibge NUMERIC (8) , 
     nr_altitude_mar NUMERIC (8) 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o LOJA. Seu conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.
' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_cidade' , 'COLUMN' , 'sk_cidade' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a data de funda  o da loja que entregou o produto adquirido pelo cliente. O conte do ser  obrigat rio, do tipo data. ' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_cidade' , 'COLUMN' , 'nm_cidade' 
GO

ALTER TABLE dim_mc_cidade ADD CONSTRAINT pk_mc_dim_cidade PRIMARY KEY CLUSTERED (sk_cidade)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_cliente 
    (
     sk_cliente NUMERIC (28) NOT NULL IDENTITY(1,1), 
     nm_cliente VARCHAR (60) NOT NULL , 
     nr_estrelas NUMERIC (1) , 
     st_cliente VARCHAR (8) NOT NULL , 
     dt_nascimento DATE 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o LOJA. Seu conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.
' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_cliente' , 'COLUMN' , 'sk_cliente' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a data de funda  o da loja que entregou o produto adquirido pelo cliente. O conte do ser  obrigat rio, do tipo data. ' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_cliente' , 'COLUMN' , 'nm_cliente' 
GO

ALTER TABLE dim_mc_cliente ADD CONSTRAINT pk_mc_dim_cliente PRIMARY KEY CLUSTERED (sk_cliente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_estado 
    (
     sk_estado NUMERIC (28) NOT NULL IDENTITY(1,1), 
     dim_mc_regiao NUMERIC (28) NOT NULL , 
     sg_estado CHAR (2) NOT NULL , 
     nm_estado VARCHAR (25) NOT NULL , 
     nm_gentilico VARCHAR (40) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o LOJA. Seu conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.
' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_estado' , 'COLUMN' , 'sk_estado' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a data de funda  o da loja que entregou o produto adquirido pelo cliente. O conte do ser  obrigat rio, do tipo data. ' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_estado' , 'COLUMN' , 'nm_estado' 
GO

ALTER TABLE dim_mc_estado ADD CONSTRAINT pk_mc_dim_estado PRIMARY KEY CLUSTERED (sk_estado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_forma_pagto 
    (
     sk_forma_pagto NUMERIC (28) NOT NULL IDENTITY(1,1), 
     ds_forma_pagto VARCHAR (35) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esta   a Surrogate Key da Dimens o de forma de pagamento. Seu conte do deve ser obrigat rio e do tipo num rico.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_forma_pagto' , 'COLUMN' , 'sk_forma_pagto' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo representa a forma de pagamento escolhida pelo cliente no momento da venda.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_forma_pagto' , 'COLUMN' , 'ds_forma_pagto' 
GO

ALTER TABLE dim_mc_forma_pagto ADD CONSTRAINT pk_mc_dim_forma_pagto PRIMARY KEY CLUSTERED (sk_forma_pagto)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_funcionario 
    (
     sk_funcionario NUMERIC (28) NOT NULL IDENTITY(1,1), 
     nm_funcionario VARCHAR (60) NOT NULL , 
     ds_cargo VARCHAR (50) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o LOJA. Seu conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.
' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_funcionario' , 'COLUMN' , 'sk_funcionario' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a data de funda  o da loja que entregou o produto adquirido pelo cliente. O conte do ser  obrigat rio, do tipo data. ' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_funcionario' , 'COLUMN' , 'nm_funcionario' 
GO

ALTER TABLE dim_mc_funcionario ADD CONSTRAINT pk_mc_dim_funcionario PRIMARY KEY CLUSTERED (sk_funcionario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_origem_vda 
    (
     sk_origem_venda NUMERIC (28) NOT NULL IDENTITY(1,1), 
     ds_origem_venda VARCHAR (30) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esta   a Surrogate Key da Dimens o Pedido de Venda. Seu conte do deve ser obrigat rio e do tipo num rico.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_origem_vda' , 'COLUMN' , 'sk_origem_venda' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este   n mero do pedido no modelo relacional.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_origem_vda' , 'COLUMN' , 'ds_origem_venda' 
GO

ALTER TABLE dim_mc_origem_vda ADD CONSTRAINT pk_mc_dim_origem_venda PRIMARY KEY CLUSTERED (sk_origem_venda)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_pedido_venda 
    (
     sk_pedido_venda NUMERIC (28) NOT NULL IDENTITY(1,1), 
     nr_pedido_origem INTEGER NOT NULL , 
     nr_item_pedido_origem INTEGER NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esta   a Surrogate Key da Dimens o Pedido de Venda. Seu conte do deve ser obrigat rio e do tipo num rico.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_pedido_venda' , 'COLUMN' , 'sk_pedido_venda' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este   n mero do pedido no modelo relacional.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_pedido_venda' , 'COLUMN' , 'nr_pedido_origem' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este   n mero do item do  pedido no modelo relacional.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_pedido_venda' , 'COLUMN' , 'nr_item_pedido_origem' 
GO

ALTER TABLE dim_mc_pedido_venda ADD CONSTRAINT pk_mc_dim_pedido_venda PRIMARY KEY CLUSTERED (sk_pedido_venda)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_produto 
    (
     sk_produto NUMERIC (28) NOT NULL IDENTITY(1,1), 
     dim_mc_sub_categoria_prod NUMERIC (28) NOT NULL , 
     nm_produto VARCHAR (90) NOT NULL , 
     nm_tipo_embalagem VARCHAR (60) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o PRODUTO. O conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_produto' , 'COLUMN' , 'sk_produto' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber o nome do produto cadastrado e que participou de uma venda na Pet Shop Arca de No . Seu conte do ser  obrigat rio, podendo possuir at  90 caracteres.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_produto' , 'COLUMN' , 'nm_produto' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber o tipo de embalagem do produto cadastrado que participou de uma venda na Pet Shop Arca de No . Seu conte do ser  obrigat rio, podendo possuir at  60 caracteres.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_produto' , 'COLUMN' , 'nm_tipo_embalagem' 
GO

ALTER TABLE dim_mc_produto ADD CONSTRAINT pk_mc_dim_produto PRIMARY KEY CLUSTERED (sk_produto)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_regiao 
    (
     sk_regiao NUMERIC (28) NOT NULL IDENTITY(1,1), 
     nm_regiao VARCHAR (25) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o LOJA. Seu conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.
' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_regiao' , 'COLUMN' , 'sk_regiao' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a data de funda  o da loja que entregou o produto adquirido pelo cliente. O conte do ser  obrigat rio, do tipo data. ' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_regiao' , 'COLUMN' , 'nm_regiao' 
GO

ALTER TABLE dim_mc_regiao ADD CONSTRAINT pk_mc_dim_regiao PRIMARY KEY CLUSTERED (sk_regiao)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_status_venda 
    (
     sk_status_venda NUMERIC (28) NOT NULL IDENTITY(1,1), 
     ds_status_venda VARCHAR (40) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esta   a Surrogate Key da Dimens o Pedido de Venda. Seu conte do deve ser obrigat rio e do tipo num rico.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_status_venda' , 'COLUMN' , 'sk_status_venda' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este   n mero do pedido no modelo relacional.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_status_venda' , 'COLUMN' , 'ds_status_venda' 
GO

ALTER TABLE dim_mc_status_venda ADD CONSTRAINT pk_mc_dim_status_venda PRIMARY KEY CLUSTERED (sk_status_venda)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_sub_categoria_prod 
    (
     sk_sub_categoria_prod NUMERIC (28) NOT NULL IDENTITY(1,1), 
     dim_mc_categoria_prod NUMERIC (28) NOT NULL , 
     nm_sub_categoria_prod VARCHAR (60) NOT NULL , 
     st_sub_categoria VARCHAR (8) NOT NULL , 
     qt_nota_sub_categoria_prod NUMERIC (2) 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o LOJA. Seu conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.
' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_sub_categoria_prod' , 'COLUMN' , 'sk_sub_categoria_prod' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a data de funda  o da loja que entregou o produto adquirido pelo cliente. O conte do ser  obrigat rio, do tipo data. ' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_sub_categoria_prod' , 'COLUMN' , 'nm_sub_categoria_prod' 
GO

ALTER TABLE dim_mc_sub_categoria_prod ADD CONSTRAINT pk_mc_dim_sub_categoria_prod PRIMARY KEY CLUSTERED (sk_sub_categoria_prod)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_tempo 
    (
     sk_mc_tempo NUMERIC (28) NOT NULL IDENTITY(1,1), 
     nr_ano INTEGER , 
     nr_semestre INTEGER , 
     ds_semestre_ano VARCHAR (20) , 
     ds_semestre VARCHAR (20) , 
     nr_trimestre INTEGER , 
     ds_trimestre_ano VARCHAR (20) , 
     ds_trimestre VARCHAR (20) , 
     nr_mes INTEGER , 
     nr_ano_mes INTEGER , 
     ds_mes_ano VARCHAR (20) , 
     ds_mes VARCHAR (20) , 
     ds_abv_mes CHAR (3) , 
     ds_abv_mes_ano VARCHAR (20) , 
     ds_dia_semana VARCHAR (20) , 
     ds_data VARCHAR (20) , 
     nr_dia_mes INTEGER , 
     nr_dia_semana INTEGER , 
     nr_dia_ano INTEGER , 
     ds_dia_util_feriado VARCHAR (30) , 
     ds_fim_semana VARCHAR (30) , 
     ds_data_extenso VARCHAR (30) , 
     dt_criacao_rgt DATE 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a chave surrogate key da dimens o TEMPO. O conte do ser  num rico e sequencial e deve ser preenchido na fase de ETL seguindo regras pr -estabelecidas.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_tempo' , 'COLUMN' , 'sk_mc_tempo' 
GO

ALTER TABLE dim_mc_tempo ADD CONSTRAINT pk_mc_dim_tempo PRIMARY KEY CLUSTERED (sk_mc_tempo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE dim_mc_tipo_venda 
    (
     sk_tipo_venda NUMERIC (28) NOT NULL IDENTITY(1,1), 
     ds_tipo_vnda VARCHAR (30) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esta   a Surrogate Key da Dimens o Pedido de Venda. Seu conte do deve ser obrigat rio e do tipo num rico.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_tipo_venda' , 'COLUMN' , 'sk_tipo_venda' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este   n mero do pedido no modelo relacional.' , 'USER' , 'dbo' , 'TABLE' , 'dim_mc_tipo_venda' , 'COLUMN' , 'ds_tipo_vnda' 
GO

ALTER TABLE dim_mc_tipo_venda ADD CONSTRAINT pk_mc_dim_tipo_venda PRIMARY KEY CLUSTERED (sk_tipo_venda)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE fto_entrega_prd_pesq_satisf_cd 
    (
     sk_mc_pesq_satisf_prod NUMERIC (28) NOT NULL IDENTITY(1,1), 
     dim_mc_tempo NUMERIC (28) NOT NULL , 
     dim_mc_bairro NUMERIC (28) NOT NULL , 
     dim_mc_centro_distribuicao NUMERIC (28) NOT NULL , 
     dim_mc_produto NUMERIC (28) NOT NULL , 
     dim_mc_funcionario NUMERIC (28) NOT NULL , 
     dim_mc_pedido_venda NUMERIC (28) NOT NULL , 
     dim_mc_cliente NUMERIC (28) NOT NULL , 
     dim_mc_forma_pagto NUMERIC (28) NOT NULL , 
     dim_mc_origem_vda NUMERIC (28) NOT NULL , 
     dim_mc_status_venda NUMERIC (28) NOT NULL , 
     dim_mc_tipo_venda NUMERIC (28) NOT NULL , 
     vl_unitario NUMERIC (10,2) NOT NULL , 
     qt_venda NUMERIC (10,4) NOT NULL , 
     vl_tot_venda NUMERIC (10,2) NOT NULL , 
     dt_pedido DATE NOT NULL , 
     vl_perc_icms NUMERIC (8,2) , 
     qt_venda_entregue NUMERIC (10,4) , 
     qt_nota_embalagem NUMERIC (2) , 
     qt_nota_pontualidade NUMERIC (2) , 
     qt_nota_cortesia NUMERIC (2) 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber a quantidade de venda de um determinado produto em um determinado pedido. Seu conte do ser  obrigat rio, contendo 6 n meros inteiros e 4 casas decimais e somente valores positivos s o v lidos.' , 'USER' , 'dbo' , 'TABLE' , 'fto_entrega_prd_pesq_satisf_cd' , 'COLUMN' , 'qt_venda' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir  receber o valor total de venda de um determinado produto em um pedido. Seu conte do ser  obrigat rio, contendo n meros inteiros e 2 casas decimais e somente valores positivos s o v lidos.
' , 'USER' , 'dbo' , 'TABLE' , 'fto_entrega_prd_pesq_satisf_cd' , 'COLUMN' , 'vl_tot_venda' 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd ADD CONSTRAINT pk_mc_fto_pesq_satisf_entg_prd PRIMARY KEY CLUSTERED (sk_mc_pesq_satisf_prod)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT bairro_cli_psc FOREIGN KEY 
    ( 
     dim_mc_bairro
    ) 
    REFERENCES dim_mc_bairro 
    ( 
     sk_bairro 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE dim_mc_produto 
    ADD CONSTRAINT categ_prod FOREIGN KEY 
    ( 
     dim_mc_sub_categoria_prod
    ) 
    REFERENCES dim_mc_sub_categoria_prod 
    ( 
     sk_sub_categoria_prod 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT cd_pesq_sat FOREIGN KEY 
    ( 
     dim_mc_centro_distribuicao
    ) 
    REFERENCES dim_mc_centro_distribuicao 
    ( 
     sk_centro_distribuicao 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT cliente_pesq FOREIGN KEY 
    ( 
     dim_mc_cliente
    ) 
    REFERENCES dim_mc_cliente 
    ( 
     sk_cliente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT dt_pedido FOREIGN KEY 
    ( 
     dim_mc_tempo
    ) 
    REFERENCES dim_mc_tempo 
    ( 
     sk_mc_tempo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE dim_mc_bairro 
    ADD CONSTRAINT fk_mc_dim_cidade_bairro FOREIGN KEY 
    ( 
     dim_mc_cidade
    ) 
    REFERENCES dim_mc_cidade 
    ( 
     sk_cidade 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE dim_mc_cidade 
    ADD CONSTRAINT fk_mc_dim_estado_cidade FOREIGN KEY 
    ( 
     dim_mc_estado
    ) 
    REFERENCES dim_mc_estado 
    ( 
     sk_estado 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE dim_mc_estado 
    ADD CONSTRAINT fk_mc_dim_regiao_bairro FOREIGN KEY 
    ( 
     dim_mc_regiao
    ) 
    REFERENCES dim_mc_regiao 
    ( 
     sk_regiao 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT formpagto_pes FOREIGN KEY 
    ( 
     dim_mc_forma_pagto
    ) 
    REFERENCES dim_mc_forma_pagto 
    ( 
     sk_forma_pagto 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT func_pesq_sat FOREIGN KEY 
    ( 
     dim_mc_funcionario
    ) 
    REFERENCES dim_mc_funcionario 
    ( 
     sk_funcionario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT orig_vda_pes FOREIGN KEY 
    ( 
     dim_mc_origem_vda
    ) 
    REFERENCES dim_mc_origem_vda 
    ( 
     sk_origem_venda 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT pesqsatisf FOREIGN KEY 
    ( 
     dim_mc_pedido_venda
    ) 
    REFERENCES dim_mc_pedido_venda 
    ( 
     sk_pedido_venda 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT prod_pesq FOREIGN KEY 
    ( 
     dim_mc_produto
    ) 
    REFERENCES dim_mc_produto 
    ( 
     sk_produto 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT stat_vda FOREIGN KEY 
    ( 
     dim_mc_status_venda
    ) 
    REFERENCES dim_mc_status_venda 
    ( 
     sk_status_venda 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE dim_mc_sub_categoria_prod 
    ADD CONSTRAINT subcateg FOREIGN KEY 
    ( 
     dim_mc_categoria_prod
    ) 
    REFERENCES dim_mc_categoria_prod 
    ( 
     sk_categoria_prod 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE fto_entrega_prd_pesq_satisf_cd 
    ADD CONSTRAINT vda_pes FOREIGN KEY 
    ( 
     dim_mc_tipo_venda
    ) 
    REFERENCES dim_mc_tipo_venda 
    ( 
     sk_tipo_venda 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             33
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
