-- 1. (1 Valor) Imprima uma lista com todos os aeroportos, por ordem alfabética
SELECT *
FROM Aeroportos
ORDER BY nome;

--2. (1 Valor) Quais são os aeroportos de Portugal?
SELECT *
FROM Aeroportos
WHERE pais = 'Portugal';

--3. (1 Valor) Qual é a média de peso das bagagens despachadas em todos os voos?
SELECT ROUND(AVG(peso)) as media
FROM Bagagens
WHERE tipo = 'Mala despachada';

--4. (1 Valor) Quantas bagagens de cada tipo ('Mala de mão' e 'Mala despachada') foram registadas no voo com ID 15?
SELECT tipo, COUNT(*) AS quantidade
FROM Bagagens
WHERE voo = 15
GROUP BY tipo;

--5. (1 Valor) Quantos pilotos foram contratados entre os anos de 2020 e 2023 (inclusive)?
SELECT COUNT(*) AS quantidade_contratados
FROM Pilotos
WHERE anoContratacao BETWEEN 2020 AND 2023;

--6. (1 Valor) Quantos voos foram realizados pela companhia aérea com o nome 'TAP'?
SELECT COUNT(*) AS quantidade_voos
FROM Voos
JOIN CompanhiasAereas ON Voos.companhia = CompanhiasAereas.id
WHERE CompanhiasAereas.nome = 'TAP';

--7. (1 Valor) Qual é o piloto com mais experiência (data de contratação mais antiga)?
SELECT id, nome, anoContratacao
FROM Pilotos
ORDER BY anoContratacao
LIMIT 1;

--8. (1 Valor) Quais são os voos que tiveram lotação acima de 200 passageiros?
SELECT *
FROM Voos
WHERE lotacao > 200;

--9. (1 Valor) Quantos voos foram realizados em cada país? Fiz só para os voos de origem mas podia acrescentar no Join "OR Voos.destino = Aeroportos.id" para ter tudo
SELECT pais, COUNT(*) AS quantidade_voos
FROM Voos
JOIN Aeroportos ON Voos.origem = Aeroportos.id 
GROUP BY pais;

--10. (1 Valor) Qual o aeroporto mais procurado como destino?
SELECT A.nome AS aeroporto_destino,COUNT(*) AS quantidade_voos
FROM Voos V
JOIN Aeroportos A ON V.destino = A.id
GROUP BY V.destino, A.nome
ORDER BY quantidade_voos DESC
LIMIT 1;

--11. (2 Valores) Qual a companhia aérea com mais incidentes?
SELECT C.nome AS companhia_aerea, COUNT(I.id) AS quantidade_incidentes
FROM CompanhiasAereas C
JOIN Voos V ON C.id = V.companhia
JOIN Incidentes I ON V.id = I.voo
GROUP BY C.nome
ORDER BY quantidade_incidentes DESC
LIMIT 1;

--12. (2 Valores) Qual a companhia aérea com mais voos realizados?
SELECT C.nome AS companhia_aerea, COUNT(V.id) AS quantidade_voos
FROM CompanhiasAereas C
JOIN Voos V ON C.id = V.companhia
GROUP BY C.nome
ORDER BY quantidade_voos DESC
LIMIT 1;

--13. (2 Valores) Qual o voo com mais lugares livres?
SELECT V.id AS voo_id, V.lotacao, A.capacidadePassageiros, A.capacidadePassageiros - V.lotacao AS lugaresLivres
FROM Voos V
JOIN Avioes A ON V.aviao = A.id
ORDER BY lugaresLivres DESC
LIMIT 1;

--14. (2 Valores) Quais os voos que tiveram lotação completa?
SELECT V.id, V.lotacao, A.capacidadePassageiros, A.capacidadePassageiros - V.lotacao AS lugaresLivres
FROM Voos V
JOIN Avioes A ON V.aviao = A.id
WHERE lotacao = capacidadePassageiros OR lotacao > capacidadePassageiros;

--15. (2 Valores) Qual é a média de idade dos passageiros que possuem bagagens registadas?
SELECT ROUND(AVG(P.idade)) AS media_idade
FROM Passageiros P
JOIN Bagagens B ON P.id = B.passageiro;