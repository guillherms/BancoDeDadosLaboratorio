create database dbteste;
use dbteste;
create table tabelab(nome varchar (50));
create table tabelac(nome varchar (50));

INSERT INTO tabelab VALUES ('Fernanda');
INSERT INTO tabelab VALUES ('Josefa');
INSERT INTO tabelab VALUES ('Luiz');
INSERT INTO tabelab VALUES ('Fernando');

INSERT INTO tabelac VALUES ('Carlos');
INSERT INTO tabelac VALUES ('Marcel');
INSERT INTO tabelac VALUES ('Luiz');
INSERT INTO tabelac VALUES ('Fernando');

SELECT b.nome, c.nome FROM tabelab as b inner join tabelac as c on b.nome = c.nome;

SELECT b.nome, c.nome from tabelab as b right join tabelac as c on b.nome = c.nome;

SELECT b.nome, b.nome from tabelab as b left join tabelac as c on b.nome = c.nome;
