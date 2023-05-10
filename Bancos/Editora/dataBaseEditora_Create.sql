#Create database editora;
#Use editora;

#Create table Autor(id_autor int not null Primary Key auto_increment, nome varchar(50));
#Create table Editora(id_editora int not null primary key auto_increment, nome Varchar(50));
#Create table Genero(id_genero int not null primary key auto_increment, descricao varchar(255));
#Create table Ranking(id_ranking int not null primary key auto_increment,data_inicial datetime,data_final datetime);
/*
Create table livr_autor(id_livro_autor int not null primary key auto_increment);

Create table Livro(id_livro int not null primary key auto_increment, titulo varchar(150), preco Decimal(3), autor_id int, editora_id int, Genero_id int,
foreign key (Autor_id) references Autor(id_autor) on Delete no Action on update no action, 
foreign key (editora_id) references Editora(id_editora) on Delete no Action on update no action, 
foreign key (Genero_id) references Genero(id_genero) on Delete no Action on update no action
);

Create table Livro_Ranking(
qtd_sem int, posicao int not null, sem_consec int, pos_sem_ant int, idLivro int,idRanking int,
foreign key (idLivro) references Livro(id_livro) on Delete no Action on update no action, 
foreign key (idRanking) references Ranking(id_ranking) on Delete no Action on update no action
);
*/

/*
CREATE SCHEMA  editora_db;

USE editora_db ;

CREATE TABLE Autor (
  idAutor INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAutor)
);

CREATE TABLE Editora (
  idEditora INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEditora)
);

CREATE TABLE Genero (
  idGenero INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idGenero)
);

CREATE TABLE Livro (
  idLivro INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  preco double not NULL,
  idEditora INT NOT NULL,
  idGenero INT NOT NULL,
  PRIMARY KEY (idLivro),  
  CONSTRAINT fk_Livro_Editora
    FOREIGN KEY (idEditora)
    REFERENCES Editora (idEditora)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Livro_Genero
    FOREIGN KEY (idGenero)
    REFERENCES Genero (idGenero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
*/
CREATE TABLE Livro_Autor (
  idAutor INT NOT NULL,
  idLivro INT NOT NULL,
  PRIMARY KEY (idAutor, idLivro),
  CONSTRAINT fk_Autor_has_Livro_Autor
    FOREIGN KEY (idAutor)
    REFERENCES Autor (idAutor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Livro_has_Livro_Autor
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Ranking (
  idRanking INT NOT NULL,
  dataInicial DATE NOT NULL,
  dataFinal DATE NOT NULL,
  PRIMARY KEY (idRanking)
);

CREATE TABLE Ranking_Semanal (
  idRanking INT NOT NULL,
  idLivro INT NOT NULL,
  posicao DECIMAL(2) NULL,
  quantidadeSemanas DECIMAL(2) NULL,
  semanasConsecutivas DECIMAL(2) NULL,
  posicaoSemanaAnterior DECIMAL(2) NULL,
  PRIMARY KEY (idRanking, idLivro),  
  CONSTRAINT fk_Ranking_has_Livro_Ranking
    FOREIGN KEY (idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Livro_has_Livro_Ranking
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
show tables;
/**/

drop table livro_autor;