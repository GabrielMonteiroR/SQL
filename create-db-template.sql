CREATE DATABASE exemplo;

USE exemplo;

CREATE TABLE cliente (
    nome VARCHAR(30),
    sexo CHAR(1),
    email VARCHAR(30),
    cpf INT(11),
    telefone VARCHAR(30),
    endereco VARCHAR(100)
);

SHOW TABLES;

DESC cliente;

INSERT INTO cliente
VALUES
("Ronaldo",'M',"R9@g1alactico.com","01234567891","(44) 1123456789","Casa1"),
("Ronaldo2",'M',"R9@g2alactico.com","01234567891","(44) 1123456789","Casa2"),
("Ronaldo3",'M',"R9@3galactico.com","01234567891","(44) 1123456789","Csa3"),
("Ronaldo4",'M',"R9@4galactico.com","01234567891","(44) 1123456789","Casa4");

/*Comandos Select
Seleção projeção e junção*/





