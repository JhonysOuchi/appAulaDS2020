SET @OLD_UNIQUE_CHECKS = @@ UNIQUE_CHECKS, UNIQUE_CHECKS = 0 ;
SET @OLD_FOREIGN_KEY_CHECKS = @@ FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 ;
SET @OLD_SQL_MODE = @@ SQL_MODE, SQL_MODE = ' ONLY_FULL_GROUP_BY, STRICT_TRANS_TABLES, NO_ZERO_IN_DATE, NO_ZERO_DATE, ERROR_FOR_DIVISION_BY_ZERO, NO_ENGINE_SUBSTITION' ;


CRIAR SCHEMA SE  NÃO  EXISTE  ` dbaulads ` PADRÃO CHARACTER  SET utf8;
USO  ` dbaulads ` ;


CRIAR  TABELA  SE  NÃO  EXISTE  ` dbaulads ` . ` CATEGORIAS ` (
  ` Idcategoria `  INT ( 11 ) NÃO  NULL AUTO_INCREMENT,
  ` Nomo `  VARCHAR ( 60 ) não  nulo ,
  ` Ativo `  VARCHAR ( 1 ) NÃO  NULL ,
  ` Datacriacao `  DATETIME  NOT  NULL ,
  ` Datamodificacao `  DATETIME  NOT  NULL ,
  PRIMÁRIA  CHAVE ( ` idcategoria ` ))
MOTOR = InnoDB
AUTO_INCREMENT =  69
PADRÃO PERSONALIZADO  SET  = utf8;


CRIAR  TABELA  SE  NÃO  EXISTE  ` dbaulads ` . ` Clientes ` (
  ` Idcliente `  INT ( 11 ) NÃO  NULL AUTO_INCREMENT,
  ` Nomo `  VARCHAR ( 60 ) não  nulo ,
  ` Email `  VARCHAR ( 100 ) NULL PADRÃO NULL ,
  ` Telefone `  VARCHAR ( 15 ) NULL PADRÃO NULL ,
  ` Ativo `  CHAR ( 1 ) NÃO  NULL ,
  ` Datacriacao `  DATETIME  NOT  NULL ,
  ` Datamodificacao `  DATETIME  NOT  NULL ,
  PRIMÁRIA  CHAVE ( ` idcliente ` ))
MOTOR = InnoDB
PADRÃO PERSONALIZADO  SET  = utf8;


CRIAR  TABELA  SE  NÃO  EXISTE  ` dbaulads ` . ` Formas_pagamento ` (
  ` Idformas_pagamento `  INT ( 11 ) NÃO  NULL AUTO_INCREMENT,
  ` Nomo `  VARCHAR ( 45 ) não  nulo ,
  ` Tera_troco `  CHAR ( 1 ) NÃO  NULL ,
  ` Tera_parcelamento `  CHAR ( 1 ) NÃO  NULL ,
  ` Ativo `  CHAR ( 1 ) NÃO  NULL ,
  ` Datacriacao `  DATETIME  NOT  NULL ,
  ` Datamodificacao `  DATETIME  NOT  NULL ,
  PRIMÁRIA  CHAVE ( ` idformas_pagamento ` ))
MOTOR = InnoDB
PADRÃO PERSONALIZADO  SET  = utf8;


CRIAR  TABELA  SE  NÃO  EXISTE  ` dbaulads ` . ` Produtos ` (
  ` Idproduto `  INT ( 11 ) NÃO  NULL AUTO_INCREMENT,
  ` Nomo `  VARCHAR ( 45 ) não  nulo ,
  ` descricao '  TEXTO  NÃO  NULO ,
  ` Estoque `  INT ( 11 ) não  nulo ,
  ` Estoque_min `  INT ( 11 ) não  nulo ,
  ` Valentes `  DECIMAL ( 7 , 2 ) não  nulo ,
  ` Ativo `  CHAR ( 1 ) NÃO  NULL ,
  ` Idcategoria `  INT ( 11 ) não  nulo ,
  ` Imagem `  VARCHAR ( 255 ) NULL ,
  ` Datacriacao `  DATETIME  NOT  NULL ,
  ` Datamodificacao `  DATETIME  NOT  NULL ,
  PRIMÁRIA  CHAVE ( ` idproduto ` ),
  ÍNDICE ` fk_produtos_categorias_idx ` ( ` idcategoria `  ASC ),
  CONSTRAINT  ` fk_produtos_categorias `
    FOREIGN KEY ( ` idcategoria ` )
    Referências  ` dbaulads ` . ` CATEGORIAS ` ( ` idcategoria ` )
    EM EXCLUIR  SEM  AÇÃO
    EM  ATUALIZAÇÃO  SEM  AÇÃO )
MOTOR = InnoDB
PADRÃO PERSONALIZADO  SET  = utf8;


CRIAR  TABELA  SE  NÃO  EXISTE  ` dbaulads ` . ` Vendas ` (
  ` Idvenda `  INT ( 11 ) NÃO  NULL AUTO_INCREMENT,
  ` Data_venda `  DATETIME  NOT  NULL ,
  ` Total_venda `  DECIMAL ( 7 , 2 ) não  nulo ,
  ` Situação `  CHAR ( 1 ) NÃO  NULL ,
  ` Idcliente `  INT ( 11 ) não  nulo ,
  ` Idformas_pagamento `  INT ( 11 ) NULL PADRÃO NULL ,
  PRIMÁRIA  CHAVE ( ` idvenda ` ),
  ÍNDICE ` fk_vendas_clientes1_idx ` ( ` idcliente `  ASC ),
  ÍNDICE ` fk_vendas_formas_pagamento1_idx ` ( ` idformas_pagamento `  ASC ),
  RESTRIÇÃO  ` fk_vendas_clientes1 `
    EXTERNA CHAVE ( ` idcliente ` )
    Referências  ` dbaulads ` . ` Clientes ` ( ` idcliente ` )
    EM EXCLUIR  SEM  AÇÃO
    NA  ATUALIZAÇÃO  SEM  AÇÃO ,
  RESTRIÇÃO  ` fk_vendas_formas_pagamento1 `
    EXTERNA CHAVE ( ` idformas_pagamento ` )
    Referências  ` dbaulads ` . ` Formas_pagamento ` ( ` idformas_pagamento ` )
    EM EXCLUIR  SEM  AÇÃO
    EM  ATUALIZAÇÃO  SEM  AÇÃO )
MOTOR = InnoDB
PADRÃO PERSONALIZADO  SET  = utf8;


CRIAR  TABELA  SE  NÃO  EXISTE  ` dbaulads ` . ` Itens_venda ` (
  ` Iditens_venda `  INT ( 11 ) NÃO  NULL AUTO_INCREMENT,
  ` Idvenda `  INT ( 11 ) não  nulo ,
  ` Idproduto `  INT ( 11 ) não  nulo ,
  ` Quantidade `  INT ( 11 ) não  nulo ,
  ` Valor_unitario `  DECIMAL ( 7 , 2 ) não  nulo ,
  ` Subtotal `  DECIMAL ( 7 , 2 ) não  nulo ,
  PRIMÁRIA  CHAVE ( ` iditens_venda ` ),
  ÍNDICE ` fk_vendas_has_produtos_produtos1_idx ` ( ` idproduto `  ASC ),
  ÍNDICE ` fk_vendas_has_produtos_vendas1_idx ` ( ` idvenda `  ASC ),
  RESTRIÇÃO  ` fk_vendas_has_produtos_produtos1 `
    EXTERNA CHAVE ( ` idproduto ` )
    Referências  ` dbaulads ` . ` Produtos ` ( ` idproduto ` )
    EM EXCLUIR  SEM  AÇÃO
    NA  ATUALIZAÇÃO  SEM  AÇÃO ,
  RESTRIÇÃO  ` fk_vendas_has_produtos_vendas1 `
    EXTERNA CHAVE ( ` idvenda ` )
    Referências  ` dbaulads ` . ` Vendas ` ( ` idvenda ` )
    EM EXCLUIR CASCADE
    EM  ATUALIZAÇÃO  SEM  AÇÃO )
MOTOR = InnoDB
PADRÃO PERSONALIZADO  SET  = utf8;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
