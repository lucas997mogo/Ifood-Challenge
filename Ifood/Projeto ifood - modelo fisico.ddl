-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-06-14 11:45:07 BRT
--   site:      Oracle Database 12c
--   tipo:      Oracle Database 12c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    id_cliente VARCHAR2(255 BYTE) NOT NULL,
    nome       VARCHAR2(255 CHAR) NOT NULL,
    contato    VARCHAR2(255 BYTE) NOT NULL,
    endereço   VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE conta_digital (
    id_conta             VARCHAR2(255 BYTE) NOT NULL,
    saldo                VARCHAR2(255 BYTE) NOT NULL,
    parceiro_id_parceiro VARCHAR2(255) NOT NULL
);

ALTER TABLE conta_digital ADD CONSTRAINT conta_digital_pk PRIMARY KEY ( id_conta );

CREATE TABLE fornecedor (
    id_fornecedor VARCHAR2(255 BYTE) NOT NULL,
    nome          VARCHAR2(255 CHAR) NOT NULL,
    contato       VARCHAR2(255 CHAR) NOT NULL,
    endereço      VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE fornecedor ADD CONSTRAINT fornecedor_pk PRIMARY KEY ( id_fornecedor );

CREATE TABLE pagamento (
    id_pagamento             VARCHAR2(255 BYTE) NOT NULL,
    data                     DATE NOT NULL,
    valor                    VARCHAR2(255 BYTE) NOT NULL,
    descrição                VARCHAR2(255 CHAR) NOT NULL,
    status                   VARCHAR2(255 CHAR) NOT NULL,
    metodo_pagamento         VARCHAR2(255 CHAR) NOT NULL,
    conta_digital_id_conta   VARCHAR2(255 BYTE) NOT NULL,
    fornecedor_id_fornecedor VARCHAR2(255 BYTE) NOT NULL
);

ALTER TABLE pagamento ADD CONSTRAINT pagamento_pk PRIMARY KEY ( id_pagamento );

CREATE TABLE parceiro (
    id_parceiro VARCHAR2(255) NOT NULL,
    nome        VARCHAR2(255 CHAR) NOT NULL,
    cnpj        VARCHAR2(255 BYTE) NOT NULL,
    endereço    VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE parceiro ADD CONSTRAINT parceiro_pk PRIMARY KEY ( id_parceiro );

CREATE TABLE permissão_usuário (
    usuário_id_usuário      VARCHAR2(255),
    permissões_id_permissão VARCHAR2(255 BYTE) NOT NULL
);

CREATE TABLE permissões (
    id_permissão VARCHAR2(255 BYTE) NOT NULL,
    nome         VARCHAR2(255 CHAR) NOT NULL,
    descrição    VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE permissões ADD CONSTRAINT permissões_pk PRIMARY KEY ( id_permissão );

CREATE TABLE recebível (
    attribute_1            VARCHAR2(255 BYTE) NOT NULL,
    data                   DATE NOT NULL,
    valor                  VARCHAR2(255 BYTE) NOT NULL,
    decrição               VARCHAR2(255 CHAR) NOT NULL,
    status                 VARCHAR2(255 CHAR) NOT NULL,
    metodo_pagamento       VARCHAR2(255 CHAR) NOT NULL,
    conta_digital_id_conta VARCHAR2(255 BYTE) NOT NULL,
    cliente_id_cliente     VARCHAR2(255 BYTE) NOT NULL
);

ALTER TABLE recebível ADD CONSTRAINT recebível_pk PRIMARY KEY ( attribute_1 );

CREATE TABLE relatório (
    id_relatorio         VARCHAR2(255 BYTE) NOT NULL,
    tipo                 VARCHAR2(255 CHAR) NOT NULL,
    data_geração         DATE NOT NULL,
    conteudo             VARCHAR2(255 CHAR) NOT NULL,
    parceiro_id_parceiro VARCHAR2(255) NOT NULL
);

ALTER TABLE relatório ADD CONSTRAINT relatório_pk PRIMARY KEY ( id_relatorio );

CREATE TABLE transação (
    id_transação           VARCHAR2(255 BYTE) NOT NULL,
    tipo_transação         VARCHAR2(255 CHAR) NOT NULL,
    valor                  VARCHAR2(255 BYTE) NOT NULL,
    data                   DATE NOT NULL,
    descrição              VARCHAR2(255 BYTE) NOT NULL,
    metodo_pagamento       VARCHAR2(255 CHAR) NOT NULL,
    conta_digital_id_conta VARCHAR2(255 BYTE) NOT NULL
);

ALTER TABLE transação ADD CONSTRAINT transação_pk PRIMARY KEY ( id_transação );

CREATE TABLE usuário (
    id_usuário           VARCHAR2(255) NOT NULL,
    nome                 VARCHAR2(255 CHAR) NOT NULL,
    email                VARCHAR2(255) NOT NULL,
    senha                VARCHAR2(255 CHAR) NOT NULL,
    tipo_usuário         VARCHAR2(255 CHAR) NOT NULL,
    parceiro_id_parceiro VARCHAR2(255) NOT NULL
);

ALTER TABLE usuário ADD CONSTRAINT usuário_pk PRIMARY KEY ( id_usuário );

ALTER TABLE conta_digital
    ADD CONSTRAINT conta_digital_parceiro_fk FOREIGN KEY ( parceiro_id_parceiro )
        REFERENCES parceiro ( id_parceiro );

ALTER TABLE pagamento
    ADD CONSTRAINT pagamento_conta_digital_fk FOREIGN KEY ( conta_digital_id_conta )
        REFERENCES conta_digital ( id_conta );

ALTER TABLE pagamento
    ADD CONSTRAINT pagamento_fornecedor_fk FOREIGN KEY ( fornecedor_id_fornecedor )
        REFERENCES fornecedor ( id_fornecedor );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE permissão_usuário
    ADD CONSTRAINT permissão_usuário_permissões_fk FOREIGN KEY ( permissões_id_permissão )
        REFERENCES permissões ( id_permissão );

ALTER TABLE permissão_usuário
    ADD CONSTRAINT permissão_usuário_usuário_fk FOREIGN KEY ( usuário_id_usuário )
        REFERENCES usuário ( id_usuário );

ALTER TABLE recebível
    ADD CONSTRAINT recebível_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE recebível
    ADD CONSTRAINT recebível_conta_digital_fk FOREIGN KEY ( conta_digital_id_conta )
        REFERENCES conta_digital ( id_conta );

ALTER TABLE relatório
    ADD CONSTRAINT relatório_parceiro_fk FOREIGN KEY ( parceiro_id_parceiro )
        REFERENCES parceiro ( id_parceiro );

ALTER TABLE transação
    ADD CONSTRAINT transação_conta_digital_fk FOREIGN KEY ( conta_digital_id_conta )
        REFERENCES conta_digital ( id_conta );

ALTER TABLE usuário
    ADD CONSTRAINT usuário_parceiro_fk FOREIGN KEY ( parceiro_id_parceiro )
        REFERENCES parceiro ( id_parceiro );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
