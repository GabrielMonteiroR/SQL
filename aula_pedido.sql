CREATE DATABASE aula_pedido;

USE aula_pedido;

CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25) UNIQUE NOT NULL,
);

INSERT INTO categoria VALUES
(NULL,"Lanches"),
(NULL,"Pizza");

SELECT * FROM categoria;

INSERT INTO categoria VALUES
(NULL,"Bebidas")

CREATE TABLE FormaPagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) UNIQUE NOT NULL,
    taxa FLOAT NOT NULL
);

INSERT INTO FormaPagamento VALUES
(NULL,"PIX",0),
(NULL,"Dinheiro",0),
(NULL,"Cartão de Débito",2.99),
(NULL,"Cartão de Crédito",4.99);

INSERT INTO FormaPagamento (descricao,taxa) VALUES
("Fiado",5),
("Troca de Serivço",0);

SELECT * FROM FormaPagamento;