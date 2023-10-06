-- 1. Selecione todos os nomes das competiC'C5es.
SELECT nome
FROM Competicoes;

-- 2. Selecione todas as pistas cuja distC"ncia de volta seja superior a 5 km.
SELECT Nome, DistanciaVolta
FROM Pistas
WHERE DistanciaVolta > 5;

-- 3. Selecione o nC:mero de voltas da competiC'C#o com o ID igual a 1.
SELECT NumeroVoltas
FROM Competicoes
WHERE id = 1;

-- 4. Selecione todas as informaC'C5es (Classe, Marca, Modelo, PotC*ncia, Cilindrada, Peso, Ano de Fabrico, AceleraC'C#o 0-100) dos carros que participam da competiC'C#o com o ID igual a 3.
SELECT *
FROM Carros
WHERE id = 3;

-- 5. Selecione o nome e o paC-s de origem de todas as marcas de carros.
SELECT Nome, PaisOrigem
FROM Marcas;

-- 6. Selecione o nome e a distC"ncia da volta de todas as pistas.
SELECT Pistas.nome, COUNT(Competicoes.id) AS quantidade_competicoes
FROM Pistas
LEFT JOIN Competicoes ON Pistas.id = Competicoes.Pista
GROUP BY Pistas.id, Pistas.Nome;
-- isto determina a quantidade de competições em cada Pistas

SELECT Carros.id, Carros.Marca, Carros.Modelo, SUM(Competicoes.NumeroVoltas * Pistas.distanciaVolta) AS distancia_percorrida
FROM Carros
JOIN CarrosCompeticao ON Carros.id = CarrosCompeticao.carro
JOIN Competicoes ON CarrosCompeticao.competicao = Competicoes.id
JOIN Pistas ON Competicoes.Pista = Pistas.id
GROUP BY Carros.id, Carros.Marca, Carros.Modelo
ORDER BY distancia_percorrida DESC limit 1;
-- carro com maior distancia percorrida


--qual o carro com mais potencia
SELECT *
FROM Carros
ORDER BY Potencia DESC limit 1;


--obter a média de potência dos carros de cada marca.
SELECT Marca, AVG(Potencia)
FROM Carros
GROUP BY Marca
ORDER BY Potencia;


-- 7. Selecione todas as competiC'C5es que ocorrem em pistas cujo paC-s seja "Brasil".


-- 8. Selecione a classe e o modelo dos carros que possuem uma potC*ncia superior a 450.


-- 9. Selecione o nome da competiC'C#o e o nome da pista em que ocorrem todas as competiC'C5es.


-- 10. Selecione o nome e o paC-s de origem das marcas de carros fundadas antes de 2000.


-- 11. Selecione o nome das competiC'C5es que ocorrem em pistas com distC"ncia de volta superior a 3 km.


-- 12. Selecione o nome, a classe e o modelo dos carros que participam da competiC'C#o com o ID igual a 2.


-- 13. Selecione o nome da pista e o paC-s de origem das marcas dos carros que participam da competiC'C#o com o ID igual a 4.


-- 14. Selecione todas as competiC'C5es que ocorrem em pistas localizadas na Alemanha e possuem mais de 10 voltas.


-- 15. Selecione o nome da competiC'C#o, o nome da pista e o nC:mero de voltas de todas as competiC'C5es.


-- 16. Selecione o nome, a marca e o modelo dos carros que possuem uma aceleraC'C#o de 0 a 100 km/h inferior a 5 segundos.


-- 17. Selecione o nome e o paC-s de origem das marcas cujos carros participam da competiC'C#o com o ID igual a 1.


-- 18. Selecione o nome, a distC"ncia de volta e o paC-s da pista onde ocorre a competiC'C#o com o ID igual a 3.


-- 19. Selecione a classe, o modelo e a potC*ncia dos carros cuja cilindrada seja superior a 2000.


-- 20. Selecione o nome da competiC'C#o, o nome da pista e a marca dos carros que participam da competiC'C#o com o ID igual a 5.


-- 21. Liste o nC:mero de competiC'C5es por paC-s.


-- 22. Calcule a mC)dia da distC"ncia de volta de cada paC-s.


-- 23. Conte quantos carros existem em cada classe.


-- 24. Calcule a soma das potC*ncias dos carros de cada marca.


-- 25. Determine a quantidade de competiC'C5es em cada pista.


-- 26. Liste a quantidade de carros por competiC'C#o.


-- 27. Calcule a mC)dia da cilindrada dos carros de cada classe.


-- 28. Determine a quantidade de marcas de carros fundadas em cada paC-s.


-- 29. Calcule o total de voltas percorridas em cada competiC'C#o.


-- 30. Liste a soma do peso de todos os carros de cada marca.











