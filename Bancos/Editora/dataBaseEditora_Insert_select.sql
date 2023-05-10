-- Conta quantas tuplas/linhas há na tabela Ranking_Semanal
select count(*)
from Ranking_Semanal;

-- i.Mostre todos os autores cadastrados; 
select * from Autor;

-- ii.Mostre apenas os nomes dos autores;
select nome
from Autor;

-- iii.Mostre o nome e a identificação do autor, nesta ordem;
select nome, idAutor
from Autor;

-- iv.Mostre o nome dos autores que aparecem na tabela Livro_Autor;
select Autor.nome
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor;

SELECT distinct(Autor.nome)
FROM Autor
INNER JOIN Livro_Autor
ON Autor.idAutor = Livro_Autor.idAutor;

-- v.Mostre o nome dos autores, sem repetição, presentes na tabela Livro_Autor; 
select distinct(Autor.nome)
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor;

-- vi.Mostre os autores em ordem alfabética;
select distinct(Autor.nome)
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor
order by Autor.nome;

-- vii.Mostre o título dos livros que são da editora Rocco ou da editora Scipione; 
select Livro.titulo, Editora.nome
from Livro, Editora 
where (Editora.nome = "Rocco" or Editora.nome = "Scipione") and Livro.idEditora = Editora.idEditora;
      
-- viii.Mostre, em ordem alfabética, os autores que começam com M;
select nome
from Autor
where nome like "M%"
order by nome;

-- ix.Mostre, em ordem alfabética, os autores que começam com L;
select nome
from Autor
where nome like "L%"
order by nome;

-- x.Mostre, em ordem alfabética, os autores que NÃO começam com L; 
select nome
from Autor
where nome not like "L%"
order by nome;

-- xi.Mostre, em qualquer ordem, os autores que não começam com M;
select nome
from Autor
where nome not like "M%"
order by nome;

-- xii.Liste apenas os livros das editoras 1 OU 5;
select Livro.titulo, Editora.nome
from Livro, Editora
where (Editora.idEditora = 1 or Editora.idEditora = 5) and
      Livro.idEditora = Editora.idEditora;

-- xiii.Mostre os livros infantis das editoras 1 e 5;
select Livro.titulo, Genero.descricao, Livro.idEditora "Código Editora", Editora.nome
from Livro, Genero, Editora
where  Genero.descricao = "Infantil" and
       Livro.idGenero = Genero.idGenero and
       (Livro.idEditora = 1 or Livro.idEditora = 5) and
       Livro.idEditora = Editora.idEditora;
      
-- xiv.Mostre os códigos e os títulos dos livros, com seus respectivos preços;
select idLivro, titulo, preco 
from Livro;

-- xv.Mostre os autores em ordem contrária à alfabética;
select * 
from autor 
order by nome desc;

-- xvi.Liste os livros, na ordem de preços do mais caro ao mais barato; 
select * 
from Livro 
order by preco desc;

-- xvii.Liste os livros, na ordem de preços do mais barato ao mais caro;
select * 
from Livro 
order by preco;

-- xviii.Mostre apenas os livros de auto-ajuda, na ordem crescente de preço; 
select livro.titulo, livro.preco 
from livro 
where idGenero = '4' 
order by preco;

SELECT * 
FROM Livro, Genero 
WHERE Livro.idGenero = Genero.idGenero AND 
Genero.descricao = "Auto-ajuda" 
ORDER BY preco ASC;

select livro.* 
from livro,genero 
where descricao = "Auto-Ajuda" and livro.id_genero = genero.id_genero 
order by preco asc;

-- xix.Mostre quantos autores estão cadastros;
select count(*)
from autor;

-- xx.Mostre os preços dos livros mais baratos e mais caros da editora 1; 
select max(preco) as livroMaisCaro, min(preco) as livroMaisBarato 
from Livro
where Livro.idEditora = 1;

select max(preco), min(preco) 
from livro 
where idEditora = '1';

select titulo, preco 
from livro 
where preco = (select max(preco) 
			   from livro 
               where idEditora = 1) or 
	  preco = (select min(preco) 
               from livro 
               where idEditora = 1);

-- xxi.Liste a média de preços dos livros da editora 2;
select avg(preco) as precoMedio 
from Livro 
where idEditora=2;

SELECT AVG(preco) 
FROM Livro 
WHERE idEditora=2;

select round(avg(preco),2) 
from livro 
where idEditora = 2;

create view MediaPreco as
select round(avg(preco),2) 
from livro 
where idEditora = 2;

-- xxii.Mostre os livros com seus respectivos nomes de editoras e gêneros;
select Livro.titulo, Editora.nome as editora, Genero.descricao as genero 
from Livro, Editora, Genero 
where Livro.idEditora=Editora.idEditora and 
      Livro.idGenero=Genero.idGenero;

SELECT Livro.titulo, Editora.nome "Editora", Genero.descricao "Genero" 
FROM Livro, Editora, Genero 
WHERE Livro.idGenero = Genero.idGenero AND 
Livro.idEditora = Editora.idEditora;

-- xxiii.Liste os livros, mostrando o titulo de cada um bem como o nome do autor;
SELECT Livro.titulo, Autor.nome 
FROM Livro, Autor, Livro_Autor 
WHERE Livro_Autor.idLivro = Livro.idLivro AND 
Livro_Autor.idAutor = Autor.idAutor;

select Livro.titulo as livro, Autor.nome as autor 
from Livro, Autor, LivroAutor 
where LivroAutor.idAutor=Autor.idAutor and 
LivroAutor.idLivro=Livro.idLivro;

SELECT Livro.titulo, Autor.nome, Editora.nome 
FROM Livro, Autor, Livro_Autor, Editora 
WHERE Livro_Autor.idLivro = Livro.idLivro AND 
Livro_Autor.idAutor = Autor.idAutor AND 
Livro.idEditora = Editora.idEditora 
ORDER BY Livro.titulo;

-- xxiv.Mostre o título do livro que ficou o maior número de semanas consecutivas em 1o lugar;
SELECT Livro.titulo, Ranking_semanal.posicao, Ranking_semanal.semanasConsecutivas 
FROM Livro, Ranking_semanal 
WHERE semanasConsecutivas = (SELECT max(semanasConsecutivas) 
                             FROM Ranking_semanal 
                             WHERE posicao = 1) 
	AND Livro.idLivro = Ranking_semanal.idLivro;

select livro.titulo, ranking_semanal.idLivro, ranking_semanal.semanasConsecutivas 
from ranking_semanal, livro 
where Livro.idLivro = Ranking_semanal.idLivro
order by semanasConsecutivas desc limit 1 ;

-- xxv.Mostre o nome dos autores dos livros que estavam no ranking da semana de 24/08/2003 a 30/08/2003;
select distinct Autor.nome as autor 
from Livro, Autor, Livro_Autor, Ranking, Ranking_Semanal 
where Livro_Autor.idAutor=Autor.idAutor and 
      Livro_Autor.idLivro=Livro.idLivro and 
      Ranking_Semanal.idRanking = Ranking.idRanking and 
      Ranking_Semanal.idLivro=Livro.idLivro and Ranking.idRanking=2;
      
select distinct Autor.nome as autor 
from Livro, Autor, Livro_Autor, Ranking, Ranking_Semanal 
where (Ranking.dataInicial="2003-08-24" and Ranking.dataFinal="2003-08-30") and
Livro_Autor.idAutor=Autor.idAutor and 
Livro_Autor.idLivro=Livro.idLivro and 
Ranking_Semanal.idRanking = Ranking.idRanking and 
Ranking_Semanal.idLivro=Livro.idLivro;

select autor.nome
from autor,ranking, ranking_semanal, livro_autor
where ranking_semanal.idRanking = (select idRanking
									from ranking
									where dataInicial = "2003-08-24" and
									dataFinal = "2003-08-30") 
	and
	ranking.idRanking = ranking_semanal.idRanking and
	ranking_semanal.idLivro = livro_autor.idLivro and
	livro_autor.idAutor = autor.idAutor;