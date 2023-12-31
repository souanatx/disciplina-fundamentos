--1. Listar todos os jogos para a consola PS5. 
SELECT codigo_jogo, numero, consola
FROM exemplares
WHERE consola = 'ps5';

--2. Lista todos os clientes com menos de 23 anos. 
SELECT nome, d_nasc
FROM clientes
WHERE d_nasc > '2000/06/07'
ORDER BY d_nasc;

--3. Listar todos os clientes que se inscreveram antes de 2022. 
SELECT nome, d_insc
FROM clientes
WHERE d_insc < '2022-01-01'
ORDER BY d_insc;

--4. Quais os clientes que se inscreveram entre marC'o de 2022 e junho de 2022? 
SELECT nome, d_insc
FROM clientes
WHERE d_insc > '2022-03-01' AND d_insc < '2022-06-01'
ORDER BY d_insc;

--5. Quais os jogos que mudaram de preC'o, pelo menos, uma vez? 
SELECT codigo_jogo, COUNT(data_preco) as alteracoes_preco
FROM precos
GROUP BY codigo_jogo
HAVING COUNT(data_preco) > 1
--tambC)m funciona HAVING alteracoes_preco > 1
ORDER BY alteracoes_preco;

SELECT codigo_jogo, AVG (preco_aluguer) AS media_preco
FROM precos
GROUP BY codigo_jogo
HAVING media_preco>5;

--6. Obter o nC:mero total de clientes.
SELECT COUNT(uid)
FROM clientes;
-- ou COUNT(*)

--7. Obter a mC)dia de preC'o de aluguer de todos os jogos.
SELECT AVG(preco_aluguer)
FROM precos;

--8. Obter o nC:mero total de exemplares de cada jogo.
SELECT COUNT(codigo_jogo)
FROM exemplares
GROUP BY codigo_jogo;

--9. Obter o nC:mero total de alugueres de cada cliente.
SELECT id_cliente, COUNT(uid)
FROM aluguer
GROUP BY id_cliente;

--10. Obter a mC)dia de multa diC!ria de cada jogo, ordenado de forma crescente.
SELECT codigo_jogo, AVG(multa_diaria) as media_multa
FROM precos
GROUP BY codigo_jogo
ORDER BY media_multa ASC;

--11. Quais os jogos que ainda nC#o foram entregues?
SELECT DISTINCT codigo_jogo
FROM aluguer
WHERE d_entrega IS NULL;

--12. Quais os jogos (codigo_jogo e tC-tulo) existentes na empresa para as consolas PS4 e PS5?
SELECT DISTINCT codigo_jogo
FROM exemplares
WHERE consola = 'ps4' OR 
consola = 'ps5';

--13. Qual a editora com mais exemplares? 
SELECT jogos.codigo_editora, editoras.description, COUNT(jogos.codigo_editora) as n_exemplares
FROM jogos
JOIN exemplares ON exemplares.codigo_jogo = jogos.codigo
JOIN editoras ON editoras.codigo = jogos.codigo_editora
GROUP BY jogos.codigo_editora
ORDER BY n_exemplares desc limit 1;

--14. Qual o cliente mais antigo? 
SELECT nome, d_insc
FROM clientes
ORDER BY d_insc LIMIT 1;

--15. Qual o exemplar mais recente? 
SELECT codigo_jogo, d_compra
FROM exemplares
ORDER BY d_compra DESC LIMIT 1;

--16. Obter os nomes e endereC'os dos clientes que alugaram jogos da editora "Activision" com o cC3digo b ACTb .
SELECT clientes.nome, clientes.morada, jogos.codigo_editora
FROM aluguer
JOIN clientes ON clientes.uid = aluguer.id_cliente
JOIN jogos ON jogos.codigo = aluguer.codigo_jogo
WHERE jogos.codigo_editora = 'ACT';

--17. Qual o jogo disponivel em mais de uma consola? 
SELECT codigo_jogo, COUNT(DISTINCT consola) as numero_consolas 
FROM exemplares
GROUP BY codigo_jogo
HAVING COUNT(DISTINCT consola) > 1;

--18. Listar os jogos com exemplares para PS4 (codigo_jogo, nC:mero de exemplares).
SELECT codigo_jogo, numero
FROM exemplares
WHERE consola = 'ps4';

--19. Listar, por ordem ascendente de nome de cliente, os tC-tulos dos jogos que ainda nC#o alugou.
--SELECT clientes.nome, aluguer.codigo_jogo
--FROM aluguer
--JOIN jogos ON jogos.codigo = aluguer.codigo_jogo
--JOIN clientes ON clientes.uid = aluguer.id_cliente
--ORDER BY clientes.nome;
--GROUP BY ;
SELECT c.uid, c.nome, j.codigo
FROM clientes c, jogos j
WHERE j.codigo NOT IN (
    SELECT codigo_jogo FROM aluguer WHERE uid = c.uid
)
ORDER BY c.nome ASC;

--20. Relativamente a cada jogo (codigo_jogo), listar o nC:mero de exemplares existentes para as diversas consolas. 
SELECT codigo_jogo, consola, COUNT(*) as n_exemplares
FROM exemplares
GROUP BY codigo_jogo, consola;

--21. Obter os nomes e endereC'os dos clientes que alugaram jogos da editora "Eletronic Arts"
SELECT clientes.nome, clientes.morada, jogos.codigo_editora
FROM aluguer
JOIN jogos ON jogos.codigo = aluguer.codigo_jogo
JOIN clientes ON clientes.uid = aluguer.id_cliente
GROUP BY clientes.nome, jogos.codigo
HAVING jogos.codigo_editora = 'EAS';
--dava para retirar o group by e o having e fazer sC3 WHERE jogos.codigo_editora = 'EAS';

--22. Quais os clientes que alugaram 3 ou mais jogos diferentes? 
SELECT clientes.nome, COUNT(DISTINCT aluguer.codigo_jogo) as n_jogos_alugados
FROM aluguer
JOIN clientes ON clientes.uid = aluguer.id_cliente
GROUP BY clientes.nome
HAVING COUNT(DISTINCT aluguer.codigo_jogo) > 2;

--23. Quais os clientes que alugaram jogos mais de 15 dias? 
SELECT clientes.nome, codigo_jogo, julianday(d_entrega) - julianday(d_aluguer) as DiasDeAluguer
FROM aluguer
JOIN clientes ON clientes.uid = aluguer.id_cliente
WHERE DiasDeAluguer > 15
GROUP BY nome;

--24. Quais os clientes que ainda nC#o alugaram nenhum jogo? 
-- Seria para criar uma subquery

--25. Qual o jogo que teve a maior descida de preC'o? 
SELECT codigo_jogo, MAX(preco_aluguer) - MIN(preco_aluguer) as diferenca
FROM precos
GROUP BY codigo_jogo
ORDER BY diferenca DESC limit 1;

--26. Quais os clientes que efetuaram mais de 2 alugueres e que nunca pagaram multa? 
SELECT id_cliente, COUNT(id_cliente) as n_alugueres
FROM aluguer
GROUP BY id_cliente
having n_alugueres > 2 and MAX(n_multa) = 0;

--27. HC! algum jogo cujos exemplares tenham sido alugados ao mesmo tempo? Liste todos os jogos. 
-- C) preciso subquery
SELECT e.codigo_jogo, count(a.d_aluguer) as dias_aluguer
FROM aluguer a 
join exemplares e on a.codigo_jogo=e.codigo_jogo
GROUP BY a.codigo_jogo
having a.d_aluguer=a.d_aluguer
ORDER by dias_aluguer;

--28. Qual o melhor cliente? Cujo valor total (alugueres + multa) C) o superior?
SELECT nome
FROM aluguer
JOIN clientes ON clientes.uid = aluguer.id_cliente
GROUP BY id_cliente
ORDER BY SUM(n_normais) + SUM(n_multa) DESC limit 1;

--29. Quais os jogos para a consola PS4 (codigo_jogo e nB: exemplar) que, neste momento, se encontram disponiveis para alugar? 
--SELECT exemplares.codigo_jogo, n_exemplar
SELECT exemplares.codigo_jogo, exemplares.consola, exemplares.numero, n_exemplar, d_aluguer, d_entrega
from exemplares
left join aluguer on exemplares.codigo_jogo = aluguer.codigo_jogo and exemplares.numero = n_exemplar
WHERE consola = 'ps4' and (d_entrega is not null or d_aluguer is null)
GROUP by exemplares.codigo_jogo, numero
having max(d_entrega) is not null;
-- o witcher, exemplar 1, o C:ltimo aluguer ainda nC#o foi devolvido. ele assume o primeiro resultado que aparece na lista

--30. Quais os clientes (nB: cliente e nome) que nunca alugaram jogos para o PC? 
SELECT clientes.uid, clientes.nome
from clientes
join aluguer on clientes.uid = aluguer.id_cliente
join exemplares on aluguer.codigo_jogo = exemplares.codigo_jogo and aluguer.n_exemplar = exemplares.numero
WHERE not EXISTS (
SELECT 1
FROM aluguer
INNER JOIN exemplares ON aluguer.codigo_jogo = exemplares.codigo_jogo
WHERE aluguer.id_cliente = clientes.uid
and exemplares.consola = 'pc'
)
group by clientes.nome;



--DESAFIOS
--1. Quais os clientes que pagaram mais de 50b, em multas?


--2. Relativamente a cada aluguer que terminou em multa, identificar qual o cliente envolvido (nB:cliente e nome), qual o valor da multa paga, e de que jogo (tC-tulo) se tratava.


--3. Qual o maior valor de multa alguma vez ocorrido? Qual o cliente (nB: cliente e nome) e jogo (codigo_jogo e titulo) envolvidos?


--4. HC! algum cliente que tenha alugado o mesmo jogo em duas alturas distintas? Se sim, liste todos os clientes.