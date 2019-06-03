create database dbAula;
use dbAula;
create table tbAlunos(id  int primary key auto_increment not null, nome varchar(255));
create table tbDisciplina(id int primary key auto_increment not null, disciplina varchar(255));
alter table tbDisciplina add column id_aluno int;
alter table tbDisciplina add constraint fkAlunos foreign key (id_aluno) references tbAlunos(id);
insert into tbAlunos(nome) values ("Jeferson Roberto de Lima");
select*from tbAlunos;
insert into tbDisciplina (disciplina, id_aluno) values ("Matematica",1);
select*from tbDisciplina;
select * from tbAlunos as a join tbdisciplina as d on a.id = d.id_aluno;
select a.nome, d.disciplina from tbAlunos as a join tbdisciplina as d on a.id =d.id_aluno;
select a.nome, d.disciplina from tbAlunos as a join tbdisciplina as d on a.id =d.id_aluno;





