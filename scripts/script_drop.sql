/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases v6.1.0                     */
/* Target DBMS:           PostgreSQL 8.3                                  */
/* Project file:          modelagem.dez                                   */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2018-10-14 19:10                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */
ALTER TABLE aluno_endereco DROP CONSTRAINT aluno_aluno_endereco;
ALTER TABLE aluno_endereco DROP CONSTRAINT endereco_aluno_endereco;
ALTER TABLE semestre DROP CONSTRAINT curso_semestre;
ALTER TABLE semestre_disciplina DROP CONSTRAINT semestre_semestre_disciplina;
ALTER TABLE semestre_disciplina DROP CONSTRAINT disciplina_semestre_disciplina;
ALTER TABLE turma DROP CONSTRAINT semestre_turma;
ALTER TABLE matricula DROP CONSTRAINT aluno_matricula;
ALTER TABLE matricula DROP CONSTRAINT curso_matricula;
ALTER TABLE matricula_turma DROP CONSTRAINT turma_matricula_turma;
ALTER TABLE matricula_turma DROP CONSTRAINT matricula_matricula_turma;
ALTER TABLE professor_turma_disciplina DROP CONSTRAINT turma_professor_turma_disciplina;
ALTER TABLE professor_turma_disciplina DROP CONSTRAINT professor_professor_turma_disciplina;
ALTER TABLE professor_turma_disciplina DROP CONSTRAINT disciplina_professor_turma_disciplina;
ALTER TABLE nota DROP CONSTRAINT matricula_disciplina_nota;
ALTER TABLE matricula_disciplina DROP CONSTRAINT matricula_matricula_disciplina;
ALTER TABLE matricula_disciplina DROP CONSTRAINT disciplina_matricula_disciplina;

/* ---------------------------------------------------------------------- */
/* Drop table "nota"                                                      */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE nota DROP CONSTRAINT PK_nota;

/* Drop table */
DROP TABLE nota;

/* ---------------------------------------------------------------------- */
/* Drop table "matricula_disciplina"                                      */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE matricula_disciplina DROP CONSTRAINT PK_matricula_disciplina;

/* Drop table */
DROP TABLE matricula_disciplina;

/* ---------------------------------------------------------------------- */
/* Drop table "professor_turma_disciplina"                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE professor_turma_disciplina DROP CONSTRAINT PK_professor_turma_disciplina;

/* Drop table */
DROP TABLE professor_turma_disciplina;

/* ---------------------------------------------------------------------- */
/* Drop table "professor"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE professor DROP CONSTRAINT PK_professor;

/* Drop table */
DROP TABLE professor;

/* ---------------------------------------------------------------------- */
/* Drop table "matricula_turma"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE matricula_turma DROP CONSTRAINT PK_matricula_turma;

/* Drop table */
DROP TABLE matricula_turma;

/* ---------------------------------------------------------------------- */
/* Drop table "matricula"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE matricula DROP CONSTRAINT PK_matricula;

/* Drop table */
DROP TABLE matricula;

/* ---------------------------------------------------------------------- */
/* Drop table "turma"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE turma DROP CONSTRAINT PK_turma;

/* Drop table */
DROP TABLE turma;

/* ---------------------------------------------------------------------- */
/* Drop table "semestre_disciplina"                                       */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE semestre_disciplina DROP CONSTRAINT PK_semestre_disciplina;

/* Drop table */
DROP TABLE semestre_disciplina;

/* ---------------------------------------------------------------------- */
/* Drop table "semestre"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE semestre DROP CONSTRAINT PK_semestre;

/* Drop table */
DROP TABLE semestre;

/* ---------------------------------------------------------------------- */
/* Drop table "disciplina"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE disciplina DROP CONSTRAINT PK_disciplina;

/* Drop table */
DROP TABLE disciplina;

/* ---------------------------------------------------------------------- */
/* Drop table "curso"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE curso DROP CONSTRAINT PK_curso;

/* Drop table */
DROP TABLE curso;

/* ---------------------------------------------------------------------- */
/* Drop table "aluno_endereco"                                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE aluno_endereco DROP CONSTRAINT PK_aluno_endereco;

/* Drop table */
DROP TABLE aluno_endereco;

/* ---------------------------------------------------------------------- */
/* Drop table "endereco"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE endereco DROP CONSTRAINT PK_endereco;
ALTER TABLE endereco DROP CONSTRAINT CC_endereco_tipo_endereco;

/* Drop table */
DROP TABLE endereco;

/* ---------------------------------------------------------------------- */
/* Drop table "usuario"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE usuario DROP CONSTRAINT PK_usuario;

/* Drop table */
DROP TABLE usuario;

/* ---------------------------------------------------------------------- */
/* Drop table "aluno"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */
ALTER TABLE aluno DROP CONSTRAINT PK_aluno;

/* Drop table */
DROP TABLE aluno;

/* ---------------------------------------------------------------------- */
/* Drop domains                                                           */
/* ---------------------------------------------------------------------- */
DROP DOMAIN id;
DROP DOMAIN status;
DROP DOMAIN sim_nao;

/* ---------------------------------------------------------------------- */
/* Drop sequences                                                         */
/* ---------------------------------------------------------------------- */
DROP SEQUENCE seq_aluno;
DROP SEQUENCE seq_aluno_endereco;
DROP SEQUENCE seq_curso;
DROP SEQUENCE seq_disciplina;
DROP SEQUENCE seq_endereco;
DROP SEQUENCE seq_matricula_disciplina;
DROP SEQUENCE seq_matricula;
DROP SEQUENCE seq_matricula_turma;
DROP SEQUENCE seq_nota;
DROP SEQUENCE seq_professor;
DROP SEQUENCE seq_professor_turma_disciplina;
DROP SEQUENCE seq_semestre;
DROP SEQUENCE seq_semestre_disciplina;
DROP SEQUENCE seq_turma;
DROP SEQUENCE seq_usuario;
