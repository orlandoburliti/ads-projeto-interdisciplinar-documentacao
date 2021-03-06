/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases v6.1.0                     */
/* Target DBMS:           PostgreSQL 8.3                                  */
/* Project file:          modelagem.dez                                   */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2018-10-14 19:10                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Sequences                                                              */
/* ---------------------------------------------------------------------- */
CREATE SEQUENCE seq_aluno INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_aluno_endereco INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_curso INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_disciplina INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_endereco INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_matricula_disciplina INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_matricula INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_matricula_turma INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_nota INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_professor INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_professor_turma_disciplina INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_semestre INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_semestre_disciplina INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_turma INCREMENT 1 MINVALUE 0 START 0;
CREATE SEQUENCE seq_usuario INCREMENT 1 MINVALUE 0 START 0;

/* ---------------------------------------------------------------------- */
/* Domains                                                                */
/* ---------------------------------------------------------------------- */
CREATE DOMAIN id AS NUMERIC(8);
CREATE DOMAIN status AS CHARACTER(1) CHECK (VALUE IN ('A', 'I'));
CREATE DOMAIN sim_nao AS CHARACTER(1) CHECK (VALUE IN ('S', 'N'));

/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "aluno"                                                      */
/* ---------------------------------------------------------------------- */
CREATE TABLE aluno (
    id id  NOT NULL,
    nome CHARACTER VARYING(200),
    cpf CHARACTER VARYING(11),
    rg CHARACTER VARYING(20),
    emissor_rg CHARACTER VARYING(20),
    data_nascimento DATE,
    email CHARACTER VARYING(200),
    senha CHARACTER VARYING(100),
    resetar_senha CHARACTER(1),
    CONSTRAINT PK_aluno PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "usuario"                                                    */
/* ---------------------------------------------------------------------- */
CREATE TABLE usuario (
    id id  NOT NULL,
    nome CHARACTER VARYING(100),
    email CHARACTER VARYING(200),
    cpf CHARACTER VARYING(11),
    senha CHARACTER VARYING(100),
    CONSTRAINT PK_usuario PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "endereco"                                                   */
/* ---------------------------------------------------------------------- */
CREATE TABLE endereco (
    id id  NOT NULL,
    tipo_endereco CHARACTER(1)  NOT NULL,
    cep NUMERIC(8),
    logradouro CHARACTER VARYING(200),
    complemento CHARACTER VARYING(200),
    bairro CHARACTER VARYING(100),
    cidade CHARACTER VARYING(100),
    uf CHARACTER VARYING(2),
    CONSTRAINT PK_endereco PRIMARY KEY (id)
);
ALTER TABLE endereco ADD CONSTRAINT CC_endereco_tipo_endereco 
    CHECK (tipo_endereco IN ('R', 'C'));

/* ---------------------------------------------------------------------- */
/* Add table "aluno_endereco"                                             */
/* ---------------------------------------------------------------------- */
CREATE TABLE aluno_endereco (
    id_aluno id  NOT NULL,
    id_endereco id  NOT NULL,
    CONSTRAINT PK_aluno_endereco PRIMARY KEY (id_aluno, id_endereco)
);

/* ---------------------------------------------------------------------- */
/* Add table "curso"                                                      */
/* ---------------------------------------------------------------------- */
CREATE TABLE curso (
    id id  NOT NULL,
    nome CHARACTER VARYING(100),
    status status  NOT NULL,
    semestres NUMERIC(2)  NOT NULL,
    CONSTRAINT PK_curso PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "disciplina"                                                 */
/* ---------------------------------------------------------------------- */
CREATE TABLE disciplina (
    id id  NOT NULL,
    nome CHARACTER VARYING(100),
    carga_horaria NUMERIC(3),
    CONSTRAINT PK_disciplina PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "semestre"                                                   */
/* ---------------------------------------------------------------------- */
CREATE TABLE semestre (
    id id  NOT NULL,
    id_curso id  NOT NULL,
    numero NUMERIC(2),
    CONSTRAINT PK_semestre PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "semestre_disciplina"                                        */
/* ---------------------------------------------------------------------- */
CREATE TABLE semestre_disciplina (
    id_semestre id  NOT NULL,
    id_disciplina id  NOT NULL,
    CONSTRAINT PK_semestre_disciplina PRIMARY KEY (id_semestre, id_disciplina)
);

/* ---------------------------------------------------------------------- */
/* Add table "turma"                                                      */
/* ---------------------------------------------------------------------- */
CREATE TABLE turma (
    id id  NOT NULL,
    id_semestre id  NOT NULL,
    ano NUMERIC(4)  NOT NULL,
    semestre NUMERIC(2)  NOT NULL,
    data_inicio_aulas DATE,
    data_fim_aulas DATE,
    CONSTRAINT PK_turma PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "matricula"                                                  */
/* ---------------------------------------------------------------------- */
CREATE TABLE matricula (
    id id  NOT NULL,
    id_aluno id  NOT NULL,
    id_curso id  NOT NULL,
    data_ingresso DATE  NOT NULL,
    CONSTRAINT PK_matricula PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "matricula_turma"                                            */
/* ---------------------------------------------------------------------- */
CREATE TABLE matricula_turma (
    id id  NOT NULL,
    id_matricula id  NOT NULL,
    id_turma id  NOT NULL,
    data_matricula DATE  NOT NULL,
    CONSTRAINT PK_matricula_turma PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "professor"                                                  */
/* ---------------------------------------------------------------------- */
CREATE TABLE professor (
    id id  NOT NULL,
    nome CHARACTER VARYING(200),
    cpf CHARACTER VARYING(11)  NOT NULL,
    email CHARACTER VARYING(200)  NOT NULL,
    senha CHARACTER VARYING(100),
    CONSTRAINT PK_professor PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "professor_turma_disciplina"                                 */
/* ---------------------------------------------------------------------- */
CREATE TABLE professor_turma_disciplina (
    id id  NOT NULL,
    id_turma id  NOT NULL,
    id_professor id  NOT NULL,
    id_disciplina id  NOT NULL,
    CONSTRAINT PK_professor_turma_disciplina PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "nota"                                                       */
/* ---------------------------------------------------------------------- */
CREATE TABLE nota (
    id id  NOT NULL,
    id_matricula_disciplina id  NOT NULL,
    nota NUMERIC(4),
    falta NUMERIC(4),
    CONSTRAINT PK_nota PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "matricula_disciplina"                                       */
/* ---------------------------------------------------------------------- */
CREATE TABLE matricula_disciplina (
    id id  NOT NULL,
    id_disciplina id  NOT NULL,
    id_matricula id  NOT NULL,
    CONSTRAINT PK_matricula_disciplina PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */
ALTER TABLE aluno_endereco ADD CONSTRAINT aluno_aluno_endereco 
    FOREIGN KEY (id_aluno) REFERENCES aluno (id);
ALTER TABLE aluno_endereco ADD CONSTRAINT endereco_aluno_endereco 
    FOREIGN KEY (id_endereco) REFERENCES endereco (id);
ALTER TABLE semestre ADD CONSTRAINT curso_semestre 
    FOREIGN KEY (id_curso) REFERENCES curso (id);
ALTER TABLE semestre_disciplina ADD CONSTRAINT semestre_semestre_disciplina 
    FOREIGN KEY (id_semestre) REFERENCES semestre (id);
ALTER TABLE semestre_disciplina ADD CONSTRAINT disciplina_semestre_disciplina 
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id);
ALTER TABLE turma ADD CONSTRAINT semestre_turma 
    FOREIGN KEY (id_semestre) REFERENCES semestre (id);
ALTER TABLE matricula ADD CONSTRAINT aluno_matricula 
    FOREIGN KEY (id_aluno) REFERENCES aluno (id);
ALTER TABLE matricula ADD CONSTRAINT curso_matricula 
    FOREIGN KEY (id_curso) REFERENCES curso (id);
ALTER TABLE matricula_turma ADD CONSTRAINT turma_matricula_turma 
    FOREIGN KEY (id_turma) REFERENCES turma (id);
ALTER TABLE matricula_turma ADD CONSTRAINT matricula_matricula_turma 
    FOREIGN KEY (id_matricula) REFERENCES matricula (id);
ALTER TABLE professor_turma_disciplina ADD CONSTRAINT turma_professor_turma_disciplina 
    FOREIGN KEY (id_turma) REFERENCES turma (id);
ALTER TABLE professor_turma_disciplina ADD CONSTRAINT professor_professor_turma_disciplina 
    FOREIGN KEY (id_professor) REFERENCES professor (id);
ALTER TABLE professor_turma_disciplina ADD CONSTRAINT disciplina_professor_turma_disciplina 
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id);
ALTER TABLE nota ADD CONSTRAINT matricula_disciplina_nota 
    FOREIGN KEY (id_matricula_disciplina) REFERENCES matricula_disciplina (id);
ALTER TABLE matricula_disciplina ADD CONSTRAINT matricula_matricula_disciplina 
    FOREIGN KEY (id_matricula) REFERENCES matricula (id);
ALTER TABLE matricula_disciplina ADD CONSTRAINT disciplina_matricula_disciplina 
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id);
