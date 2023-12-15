
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
("Pizza de Calabresa",40.00,"Massa,calabresa,mussarela,orégano","pizzacalabre.svg",2),
("Coca-cola 2L",08.00,"Açucar,xarope,coca,cola","coca.svg",3),
("Sprite 2L",05.00,"Açucar,xarope, Suco de Limão","sprite.svg",3);

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

SELECT * FROM categoria;

ALTER TABLE categoria
ADD ativo char(1);

UPDATE categoria SET ativo = 'S' WHERE id = 1;

UPDATE categoria SET nome = "Pizzas", ativo = "S" WHERE id = 2;

ALTER TABLE categoria
MODIFY COLUMN ativo char(3);

UPDATE categoria set ativo = "Sim";

ALTER TABLE categoria
DROP COLUMN ativo;

CREATE TABLE item (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    pedido_id BIGINT NOT NULL,
    produto_id BIGINT NOT NULL,
    quantidade INT NOT NULL,
    valor FLOAT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

SELECT * FROM produto;

INSERT INTO item (pedido_id,produto_id,quantidade,valor)
VALUES
(1,16,2,9.99),
(1,20,4,5.99);

SELECT produto.id,produto.nome,produto.valor,
(SELECT categoria.nome FROM categoria WHERE categoria.id = produto.categoria_id) categoria
FROM produto ORDER BY produto.nome;

SELECT pedido.*, 
(SELECT usuario.nome FROM usuario WHERE usuario.id = pedido.usuario_id) nome_do_usuario
FROM pedido;

SELECT p.*,
(SELECT u.nome FROM usuario u WHERE u.id = p.usuario_id ) nome_usuario,
(SELECT f.descricao FROM formaPagamento f WHERE f.id = p.formaPagamento_id) forma_pagamento
FROM pedido p;

SELECT i.*,
(SELECT p.nome FROM produto p WHERE p.id = i.produto_id) nome_produto
FROM item i WHERE i.pedido_id = 1;

INSERT INTO produto (nome,valor,descricao,imagem,categoria_id)
VALUES
("X-tudo",50.00,"Pão, hamburguer,salschicha,alface","xtudo.jpg",1);

SELECT nome,valor FROM produto WHERE valor > 30.00 AND categoria_id = 1;

SELECT nome,valor FROM produto WHERE valor <= 39.99 AND categoria_id != 1;

SELECT nome,valor FROM produto WHERE valor BETWEEN 30.00 AND 40.00 ORDER BY valor;

SELECT *, DATE_FORMAT(data,'%d/%m/%Y %h:%m:%s') data_BR
 FROM pedido ORDER BY data DESC;

INSERT INTO pedido VALUES
(NULL,NOW(),2,1),
(NULL,NOW(),3,2),
(NULL,NOW(),1,1),
(NULL,NOW(),1,4);

SELECT * FROM item;

INSERT INTO item VALUES
(NULL ,4 ,16 ,2, 39.99),
(NULL ,4 ,20 ,3, 39.90);

SELECT * FROM item WHERE pedido_id = 1;

SELECT i.id, (SELECT p.nome FROM produto p WHERE p.id = i.produto_id) produto,
i.valor,i.quantidade,
(i.valor * i.quantidade) total
FROM item i WHERE i.pedido_id = 1;

SELECT(
    SELECT SUM(i.valor *i. quantidade) quantidade
    FROM item i 
    WHERE i.pedido_id = p.id
) total FROM pedido p WHERE p.id = 1; 