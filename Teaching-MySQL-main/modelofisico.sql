CREATE TABLE VENDEDOR (
    codigo_vendedor NUMERIC(5) PRIMARY KEY,
    nome_vendedor VARCHAR(50),
    endereco_vendedor VARCHAR(50),
    percentual_comissao NUMERIC(2,1)
);

CREATE TABLE PEDIDO (
    codigo_pedido NUMERIC(5) PRIMARY KEY,
    codigo_cliente NUMERIC(5),
    codigo_vendedor NUMERIC(5),
    data_pedido DATE
);

CREATE TABLE CLIENTE (
    codigo_cliente NUMERIC(5) PRIMARY KEY,
    nome_cliente VARCHAR(50),
    endereco_cliente VARCHAR(50),
    limite_credito NUMERIC(9,2),
    faturamento_acumulado NUMERIC(9,2)
);

CREATE TABLE PEDIDO_PECA (
    codigo_peca NUMERIC(5),
    codigo_pedido NUMERIC(5),
    quantidade_solicitada NUMERIC(5),
    cotacao_peca NUMERIC(9,2),
    PRIMARY KEY (codigo_peca, codigo_pedido)
);

CREATE TABLE PECA (
    codigo_peca NUMERIC(5) PRIMARY KEY,
    preco_unitario NUMERIC(9,2),
    descricao_peca VARCHAR(50),
    estoque_peca NUMERIC(5),
    codigo_deposito NUMERIC(5)
);

CREATE TABLE DEPOSITO (
    codigo_deposito NUMERIC(5) PRIMARY KEY,
    endereco_deposito VARCHAR(50)
);
 
ALTER TABLE PEDIDO ADD CONSTRAINT FK_CODIGO_CLIENTE
    FOREIGN KEY (codigo_cliente)
    REFERENCES CLIENTE(codigo_cliente);

ALTER TABLE PEDIDO ADD CONSTRAINT FK_CODIGO_VENDEDOR
    FOREIGN KEY (codigo_vendedor)
    REFERENCES VENDEDOR(codigo_vendedor);
 
ALTER TABLE PEDIDO_PECA ADD CONSTRAINT FK_CODIGO_PECA
    FOREIGN KEY (codigo_peca)
    REFERENCES PECA(codigo_peca);

ALTER TABLE PEDIDO_PECA ADD CONSTRAINT FK_CODIGO_PEDIDO
    FOREIGN KEY (codigo_pedido)
    REFERENCES PEDIDO(codigo_pedido);
 
ALTER TABLE PECA ADD CONSTRAINT FK_CODIGO_DEPOSITO
    FOREIGN KEY (codigo_deposito)
    REFERENCES DEPOSITO(codigo_deposito);


INSERT INTO CLIENTE VALUES (331,'Jeca Tatu','Rua 12 - BH',34.00,544.56);
INSERT INTO CLIENTE VALUES (332,'Manoel','Rua 13 - SP',3434.40,455432.56);

INSERT INTO VENDEDOR VALUES (5454, 'Anna', 'Rua Annador - RJ', 1.2);

INSERT INTO DEPOSITO VALUES (3092, 'avenida central - GO');

INSERT INTO PEDIDO VALUES (222,331,5454,'2022-03-16');

INSERT INTO PECA VALUES (980,233.00,'Carne Assada',21,3092);

INSERT INTO PEDIDO_PECA VALUES (980, 222, 4, 200.00);



select * from VENDEDOR;
select * from PEDIDO;
select * from CLIENTE;
select * from PEDIDO_PECA;
select * from PECA;
select * from DEPOSITO;
