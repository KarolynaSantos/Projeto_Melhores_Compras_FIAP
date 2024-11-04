-- Remover as chaves estrangeiras primeiro
ALTER TABLE dim_mc_bairro DROP CONSTRAINT fk_mc_dim_cidade_bairro;
ALTER TABLE dim_mc_cidade DROP CONSTRAINT fk_mc_dim_estado_cidade;
ALTER TABLE dim_mc_estado DROP CONSTRAINT fk_mc_dim_regiao_bairro;
ALTER TABLE dim_mc_produto DROP CONSTRAINT categ_prod;
ALTER TABLE dim_mc_sub_categoria_prod DROP CONSTRAINT subcateg;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT formpagto_pes;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT func_pesq_sat;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT orig_vda_pes;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT pesqsatisf;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT prod_pesq;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT stat_vda;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT vda_pes;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT bairro_cli_psc;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT cd_pesq_sat;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT cliente_pesq;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT dt_pedido;

-- Remover as chaves primárias 
ALTER TABLE dim_mc_bairro DROP CONSTRAINT pk_mc_dim_bairro;
ALTER TABLE dim_mc_categoria_prod DROP CONSTRAINT pk_mc_dim_categoria_prod;
ALTER TABLE dim_mc_centro_distribuicao DROP CONSTRAINT pk_mc_dim_cd;
ALTER TABLE dim_mc_cidade DROP CONSTRAINT pk_mc_dim_cidade;
ALTER TABLE dim_mc_cliente DROP CONSTRAINT pk_mc_dim_cliente;
ALTER TABLE dim_mc_estado DROP CONSTRAINT pk_mc_dim_estado;
ALTER TABLE dim_mc_forma_pagto DROP CONSTRAINT pk_mc_dim_forma_pagto;
ALTER TABLE dim_mc_funcionario DROP CONSTRAINT pk_mc_dim_funcionario;
ALTER TABLE dim_mc_origem_vda DROP CONSTRAINT pk_mc_dim_origem_venda;
ALTER TABLE dim_mc_pedido_venda DROP CONSTRAINT pk_mc_dim_pedido_venda;
ALTER TABLE dim_mc_produto DROP CONSTRAINT pk_mc_dim_produto;
ALTER TABLE dim_mc_regiao DROP CONSTRAINT pk_mc_dim_regiao;
ALTER TABLE dim_mc_status_venda DROP CONSTRAINT pk_mc_dim_status_venda;
ALTER TABLE dim_mc_sub_categoria_prod DROP CONSTRAINT pk_mc_dim_sub_categoria_prod;
ALTER TABLE dim_mc_tempo DROP CONSTRAINT pk_mc_dim_tempo;
ALTER TABLE dim_mc_tipo_venda DROP CONSTRAINT pk_mc_dim_tipo_venda;
ALTER TABLE fto_entrega_prd_pesq_satisf_cd DROP CONSTRAINT pk_mc_fto_pesq_satisf_entg_prd;

-- Agora dropar as tabelas
DROP TABLE dim_mc_bairro;
DROP TABLE dim_mc_categoria_prod;
DROP TABLE dim_mc_centro_distribuicao;
DROP TABLE dim_mc_cidade;
DROP TABLE dim_mc_cliente;
DROP TABLE dim_mc_estado;
DROP TABLE dim_mc_forma_pagto;
DROP TABLE dim_mc_funcionario;
DROP TABLE dim_mc_origem_vda;
DROP TABLE dim_mc_pedido_venda;
DROP TABLE dim_mc_produto;
DROP TABLE dim_mc_regiao;
DROP TABLE dim_mc_status_venda;
DROP TABLE dim_mc_sub_categoria_prod;
DROP TABLE dim_mc_tempo;
DROP TABLE dim_mc_tipo_venda;
DROP TABLE fto_entrega_prd_pesq_satisf_cd;
