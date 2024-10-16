CREATE SCHEMA PROVA;
USE PROVA; 

#CRIANDO A TABELA AUTORES (SE NÃO EXISTIR)
CREATE TABLE IF NOT EXISTS AUTORES(
# NOME_ATRIBUTO TIPO RESTRIÇÃO
ID_AUTOR INT PRIMARY KEY,
NOME VARCHAR(50) NOT NULL,
NACIONALIDADE VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS EDITORAS(
ID_EDITORA INT PRIMARY KEY,
NOME_EDITORA VARCHAR(30) NOT NULL,
LOCAL_EDITORA VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS CLIENTES(
CPF_CLIENTE VARCHAR(15) PRIMARY KEY,
NOME_CLIENTE VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS LIVROS(
ISBN_LIVRO VARCHAR(15) PRIMARY KEY,
TITULO_LIVRO VARCHAR(50) NOT NULL,
ANO_LIVRO YEAR NOT NULL,
EDITORA_LIVRO INT NOT NULL,
#NOME DA RESTRIÇÃO -> CHAVE ESTRANGEIRA
CONSTRAINT FK_EDITORA FOREIGN KEY (EDITORA_LIVRO) 
REFERENCES EDITORAS(ID_EDITORA)
#CHAVE ESTRANGEIRA (NOME DA COLUNA) REFERENCIA
#TABELA(CHAVE PRIMÁRIA)
);

CREATE TABLE IF NOT EXISTS EMPRESTIMOS(
ID_EMPRESTIMO INT PRIMARY KEY,
DATA_EMPRESTIMO DATE NOT NULL,
DATA_DEVOLUCAO DATE NOT NULL,
CLIENTE_EMPRESTIMO VARCHAR(15) NOT NULL,
CONSTRAINT FK_CLIENTE_EMPR FOREIGN KEY (CLIENTE_EMPRESTIMO)
REFERENCES CLIENTES(CPF_CLIENTE)
);

CREATE TABLE IF NOT EXISTS LIVROS_EMPRESTIMOS(
EMPRESTIMO INT ,
LIVRO VARCHAR(15),
PRIMARY KEY(EMPRESTIMO,LIVRO),
CONSTRAINT FK_EMPR_LIVRO FOREIGN KEY (EMPRESTIMO)
REFERENCES EMPRESTIMOS(ID_EMPRESTIMO),
CONSTRAINT FK_LIVRO_EMPR FOREIGN KEY (LIVRO)
REFERENCES LIVROS(ISBN_LIVRO)
);

CREATE TABLE IF NOT EXISTS LIVROS_AUTORES(
AUTOR INT,
LIVRO VARCHAR(15),
PRIMARY KEY (AUTOR, LIVRO),
CONSTRAINT FK_AUTOR_LIVRO FOREIGN KEY (AUTOR)
REFERENCES AUTORES(ID_AUTOR),
CONSTRAINT FK_LIVRO_AUTOR FOREIGN KEY (LIVRO)
REFERENCES LIVROS(ISBN_LIVRO)
);