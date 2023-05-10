CREATE TABLE IF NOT EXISTS ranking (
  idRanking INT NOT NULL AUTO_INCREMENT,
  idJogador INT NOT NULL,
  pontos int not null default('0'),
  PRIMARY KEY (`idRanking`),
    INDEX `Index` (pontos DESC) VISIBLE,
  CONSTRAINT `fk_ranking_Jogador`
    FOREIGN KEY (`idJogador`)
    REFERENCES jogador (`idJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)ENGINE = InnoDB;

show tables;
select * from ranking;
select * from jogador;
select * from torneio;

alter table ranking add ano date;
alter table ranking drop ano;

alter table ranking
add Index indexAno (ano DESC) visible;

Insert into Jogador values ('1','Luiz Batista','','Direita');
Insert into Jogador values ('2','Vitor Bortoluzzi','vitinho','Esquerda');
Insert into Jogador values ('3','Guilherme ','Guigui','Direita');
Insert into Jogador values ('4','alexandre','Alex','Esquerda');

Insert into torneio values (null,'2003-02-20','2003-02-25','Dores');
delete from torneio where idTorneio = 2;
Insert into torneio values (null,'2009-02-20','2009-02-25','Dores');

insert into Ranking values (null,'1','100','2020-11-1');
insert into Ranking values (null,'2','90','2021-11-1');
#delete from ranking where idRanking = 3;
insert into Ranking values (null,'2','60','2022-11-1');

