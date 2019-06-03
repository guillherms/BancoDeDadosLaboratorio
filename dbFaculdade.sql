create database Faculdade;
use Faculdade;
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




