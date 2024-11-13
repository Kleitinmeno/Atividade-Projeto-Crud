-SERVIDOR-
-O projeto foi criado utiliazndo o servidor apache tomcar 10.1.24



-BANCO DE DADOS-
-Para que o Projeto possa ser executado primeiramente é necessário a criação do banco de dados sql com o seguinte código

CREATE DATABASE candidatos_concurso;

CREATE TABLE candidatos(
	  nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    escolaridade VARCHAR(50) NOT NULL
);



-CONFIGURAÇÕES-
-Após a criação do banco de dados é necessário que seja instalado o "mysql-connector-j" disponivel em: https://dev.mysql.com/downloads/connector/j/
-Com o mysql-connector-j baixado é necessario inserilo no projeto. Para isso basta clicar com o botão direito no projeto e seguir o seguinte caminho: Build path -> configure build path -> Libaries -> classpath -> add external JARs e selecionar o mysql-connector-j
