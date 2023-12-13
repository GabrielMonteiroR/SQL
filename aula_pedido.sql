-- Active: 1702404134199@@127.0.0.1@3306@aula_pedido
CREATE DATABASE aula_pedido;

USE aula_pedido;

CREATE TABLE categoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25) UNIQUE NOT NULL
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

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    telefone VARCHAR(14) NULL
);

INSERT INTO usuario (nome,email,senha,telefone) VALUES 
("Henrique","henrique@gmail.com","123456",NULL),
("Gabriel","Gabriel@gmail.com","789401","(44) 9 99101122");

SELECT * FROM usuario ORDER BY nome;

INSERT INTO usuario (nome,email,senha,telefone) VALUES
("Jackson","jackson@gmail.com",MD5("pastel"),NULL);

SELECT nome FROM usuario WHERE id = 3;

SELECT nome FROM usuario WHERE nome <> 'G';

SELECT nome FROM usuario WHERE nome like '%A%' ORDER BY nome;

SELECT nome,senha FROM usuario
WHERE senha = MD5("pastel");

SELECT * FROM categoria;

CREATE TABLE produto (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor FLOAT NOT NULL,
    descricao TEXT NOT NULL,
    imagem VARCHAR(100) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

INSERT INTO produto (nome,valor,descricao,imagem,categoria_id) VALUES
("X-Bacon",39.90,"Hamburguer,Salada,bacon,queijo prato,cebola","xbacon.svg",1),
("X-Salada", 25.90,"Hamburguer,Salada,tomate,mussarela,azeitona","xsalada.svg",1),
("Pizza de Calabresa",40.00,"Massa,calabresa,mussarela,orégano","pizzacalabre.svg",5),
("Coca-cola 2L",08.00,"Açucar,xarope,coca,cola","coca.svg",6),
("Sprite 2L",05.00,"Açucar,xarope, Suco de Limão","sprite.svg",6);

SELECT id,nome,valor FROM produto ORDER BY valor DESC;

DELETE FROM produto WHERE id IN  (8,6,9,10);

CREATE TABLE pedido (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    data DATETIME NOT NULL,
    usuario_id INT NOT NULL,
    formaPagamento_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (formaPagamento_id) REFERENCES formaPagamento(id)
);

SELECT * FROM formapagamento;

INSERT INTO pedido (data,usuario_id,formaPagamento_id) VALUES
("2023-11-24 22:31",3,3),
("2023-11-24 22:31",2,4);

SELECT * FROM pedido;

INSERT INTO pedido (data,usuario_id,formaPagamento_id) VALUES
(NOW(),2,1);

INSERT INTO pedido (data,usuario_id,formaPagamento_id) VALUES
(NOW(),1,1),
(NOW(),1,3);





