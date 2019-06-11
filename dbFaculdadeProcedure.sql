create database dbFaculdade;
use dbFaculdade;
create table tbInstrutores(id int(10) primary key auto_increment not null, nome varchar(50), email varchar(50), Valor_hora int(10), certificados varchar(255));
create table tbCursos(id int(10) primary key auto_increment not null, nome varchar(50), requisito varchar(255), carga_horaria smallint(5), preço double);
create table tbAlunos(id int(11) primary key auto_increment not null, cpf char(11), nome varchar(50), email  varchar(50), fone char(14), data_nascimento date);
create table tbTurmas (id int(10) primary key auto_increment not null, data_inicio date, data_final date, carga_horaria smallint(5));
alter table tbTurmas add instrutores_id int(11);
alter table tbTurmas add  cursos_id int(10);
alter table tbTurmas add constraint fkturmas_FKIndex1 foreign key (instrutores_id) references tbInstrutores(id);
create table tbMatriculas (id int(10) primary key auto_increment not null, turmas_id int(10), alunos_id int(11), data_matricula date);
alter table tbTurmas add constraint fkturmas_FKIndex2 foreign key (cursos_id) references tbCursos (id);
alter table tbMatriculas add constraint fkmatriculas_FKIndex1 foreign key(alunos_id) references tbAlunos(id);
alter table tbMatriculas add constraint fkmatriculas_FKIndex3 foreign key(turmas_id) references tbTurmas(id);

/*INSERT*/

INSERT INTO tbinstrutores(nome,email,valor_hora,certificados) VALUES("ROGER", "roger@gmail.com", 2, "java e sql");
INSERT INTO tbinstrutores(nome,email,valor_hora,certificados) VALUES("PAULA", "paula33@gmail.com", 3, "TI FSA");
INSERT INTO tbcursos(nome,requisito,carga_horaria,preço) VALUES("TI", "ENSINO MÉDIO COMPLETO", 20, 3000);
INSERT INTO tbcursos(nome,requisito,carga_horaria,preço) VALUES("BANCO DE DADOS", "ENSINO TECNICO COMPLETO", 24, 2150);
INSERT INTO tbturmas(instrutores_id,cursos_id,data_inicio,data_final, carga_horaria) VALUES(2, 1, 10/02/2020, 31/12/2024 , 30);
INSERT INTO tbturmas(instrutores_id,cursos_id,data_inicio,data_final, carga_horaria) VALUES(1, 2, 10/02/2020, 31/12/2023 , 50);
INSERT INTO tbalunos(cpf,nome,email,fone,data_nascimento) VALUES(45404408880, "GUILHERME", "GUILHERMES@gmail.com", 40028152 , 15/08/2000 );
INSERT INTO tbalunos(cpf,nome,email,fone,data_nascimento) VALUES(49424704839, "MURILO", "MFANTINATI@gmail.com", 45058922 , 17/10/1996 );
INSERT INTO tbmatriculas(turmas_id,alunos_id,data_matricula) VALUES(1, 1, 03/11/2019);
INSERT INTO tbmatriculas(turmas_id,alunos_id,data_matricula) VALUES(2, 2, 04/11/2019);

SELECT b.nome, c.nome FROM tbinstrutores as b INNER JOIN tbalunos as c on b.nome = c.nome;
SELECT b.nome, c.nome FROM tbinstrutores as b LEFT JOIN tbalunos as c on b.nome = c.nome;
SELECT b.nome, c.nome FROM tbinstrutores as b RIGHT JOIN tbalunos as c on b.nome = c.nome;

select * from instrutores;

/*PROCEDURE*/

DELIMITER $$
CREATE PROCEDURE selecionar_alunos (IN quantidade int)
BEGIN
SELECT * FROM tbalunos LIMIT quantidade;
END $$
DELIMITER ; 

CALL selecionar_alunos(2); 

DELIMITER $$
CREATE PROCEDURE Verificar_Quantidade_Alunos(OUT quantidade INT)
BEGIN
	SELECT COUNT(*) INTO quantidade FROM tbalunos;
END $$
DELIMITER ; 

CALL Verificar_Quantidade_Alunos(@total);
SELECT @total;

/* PROCEDURE INTRUTORES */
DELIMITER $$
CREATE PROCEDURE incluir_instrutor (IN snome varchar(50), semail varchar(50), svalor_hora int(10), scertificados varchar(255))
BEGIN
INSERT INTO tbinstrutores(nome, email, valor_hora, certificados) VALUES (snome, semail, svalor_hora, scertificados);
END $$
DELIMITER ; 

CALL incluir_instrutor("VINICIUS SAUGO", "CHAMAN@gmail.com", 13, "ALURA");

/* PROCEDURE MATRICULAS */
DELIMITER $$
CREATE PROCEDURE selecionar_matriculas (IN quantidade int)
BEGIN
SELECT * FROM tbmatriculas LIMIT quantidade;
END $$
DELIMITER ; 

CALL selecionar_matriculas(2); 

DELIMITER $$
CREATE PROCEDURE Verificar_Quantidade_matriculas(OUT quantidade INT)
BEGIN
	SELECT COUNT(*) INTO quantidade FROM tbmatriculas;
END $$
DELIMITER ; 

CALL Verificar_Quantidade_matriculas(@total);
SELECT @total;

/* PROCEDURE TURMAS */
DELIMITER $$
CREATE PROCEDURE selecionar_turmas (IN quantidade int)
BEGIN
SELECT * FROM turmas LIMIT quantidade;
END $$
DELIMITER ; 

CALL selecionar_turmas(2); 

DELIMITER $$
CREATE PROCEDURE Verificar_Quantidade_turmas(OUT quantidade INT)
BEGIN
	SELECT COUNT(*) INTO quantidade FROM tbturmas;
END $$
DELIMITER ; 

CALL Verificar_Quantidade_turmas(@total);
SELECT @total;

/* PROCEDURE CURSOS */
DELIMITER $$
CREATE PROCEDURE incluir_cursos (IN snome varchar(50), srequisito varchar(255), scarga_horaria smallint(5), spreco double)
BEGIN
INSERT INTO cursos(nome, requisito , carga_horaria ,preco) VALUES (snome, srequisito, scarga_horaria, spreco);
END $$
DELIMITER ; 

CALL incluir_cursos("GEOGRAFIA", "ENSINO MÉDIO", 21, 500); 


