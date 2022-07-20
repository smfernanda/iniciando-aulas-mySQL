/** AULA 01: */
/** eliminando base de dados e só executando se existir: */
DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

/** criando tabelas: */
/** modelo 01:
CREATE TABLE estado (
id INT NOT NULL PRIMARY KEY
,nome VARCHAR(200) NOT NULL UNIQUE  -- constraint inline
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL
,data_cadastro DATETIME NOT NULL
, CHECK (ativo IN ('S', 'N'))   -- constraint out of line
);
*/

/** modelo 02:
CREATE TABLE estado (
id INT NOT NULL
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL
,data_cadastro DATETIME NOT NULL
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT coluna_ativo_regra_s_ou_n CHECK (ativo IN ('S', 'N')) 
);
*/

/** modelo 03: */
CREATE TABLE estado (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT estado_ativo_regra_s_ou_n CHECK (ativo IN ('S', 'N')) 
);

INSERT INTO estado (nome, sigla) VALUES ('PARANÁ', 'PR');
INSERT INTO estado (nome, sigla) VALUES ('ESPIRITO SANTO', 'ES');
INSERT INTO estado (nome, sigla) VALUES ('SÃO PAULO', 'SP');

SELECT id, nome, sigla, ativo,data_cadastro FROM ESTADO;

/** AULA 02: */
CREATE TABLE cidade (
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
, CONSTRAINT cidade_ativo_regra_s_ou_n CHECK (ativo IN ('S', 'N'))
,CONSTRAINT cidade_unica UNIQUE (nome, estado_id)
);

INSERT INTO cidade (nome, estado_id) VALUES ('GUARULHOS', '2');

SELECT * FROM CIDADE;