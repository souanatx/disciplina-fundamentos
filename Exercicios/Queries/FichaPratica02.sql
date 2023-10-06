-- 1. Listar todos os jogos para a consola PS5.
SELECT  DISTINCT codigo_jogo
FROM exemplares
WHERE consola='ps5';

-- 2. Lista todos os clientes com menos de 23 anos.
SELECT *
FROM clientes
WHERE d_nasc > '2000-06-21';

-- 3. Listar todos os clientes que se inscreveram antes de 2022.
SELECT *
FROM clientes
WHERE d_insc <  '2022-01-01';

-- 4. Quais os clientes que se inscreveram entre março de 2022 e junho de 2022?
SELECT *
FROM clientes
WHERE d_insc >=  '2022-03-01' AND d_insc <=  '2022-06-30';

-- 5. Quais os jogos que mudaram de preço, pelo menos, uma vez?
SELECT codigo_jogo, COUNT(*) AS precos_diferentes
FROM precos
GROUP BY codigo_jogo
HAVING precos_diferentes>1;
--A cláusula GROUP BY agrupa os registros da tabela "precos" por código do jogo.
--A função COUNT(DISTINCT data_preco) conta quantas datas de preço diferentes existem para cada jogo. A cláusula DISTINCT é usada para contar cada data apenas uma vez.
--A cláusula HAVING filtra os resultados da consulta para incluir apenas os jogos que têm mais de uma data de preço, ou seja, aqueles que mudaram de preço pelo menos uma vez.
--A coluna "codigo_jogo" é selecionada na consulta para exibir apenas os códigos dos jogos que atendem aos critérios de filtro.

-- 6. Obter o número total de clientes.
SELECT COUNT(*) AS numero_total_clientes
FROM clientes;

-- 7. Obter a média de preço de aluguer de todos os jogos.
SELECT AVG(preco_aluguer) as media_precos
FROM precos;

-- 8. Obter o número total de exemplares de cada jogo.
SELECT codigo_jogo, COUNT(*) AS numero_de_copias
FROM exemplares
GROUP BY codigo_jogo;

-- 9. Obter o número total de alugueres de cada cliente.
SELECT id_cliente, COUNT(*) AS numero_de_alugueres
FROM aluguer
GROUP BY id_cliente;

-- 10. Obter a média de multa diária de cada jogo, ordenado de forma crescente.
SELECT codigo_jogo, AVG(multa_diaria) AS media_multa
FROM precos
GROUP BY codigo_jogo
ORDER BY media_multa ASC;

-- 11.Quais os jogos que ainda não foram entregues?
SELECT DISTINCT codigo_jogo
FROM aluguer
WHERE d_entrega IS NULL;
 
 -- 12. Quais os jogos (codigo_jogo e título) existentes na empresa para as consolas PS4 e PS5?
 SELECT DISTINCT codigo_jogo
FROM exemplares
WHERE consola='ps5' OR  consola='ps4';

-- 13. Qual a editora com mais exemplares?
SELECT codigo_editora, description, COUNT(*) AS numero_copias
FROM editoras
JOIN jogos ON editoras.codigo = jogos.codigo_editora
JOIN exemplares ON exemplares.codigo_jogo = jogos.codigo
GROUP BY codigo_editora
ORDER BY numero_copias DESC
LIMIT 1;

-- 14. Cliente mais antigo
SELECT nome, d_insc
FROM clientes
ORDER BY d_insc
LIMIT 1;

-- 15. Exemplar mais recente
SELECT * 
FROM exemplares 
ORDER BY d_compra DESC LIMIT 1;

-- 16. 

-- 17. Jogos disponiveis em mais de uma consola?
SELECT codigo_jogo
FROM exemplares
GROUP BY codigo_jogo
HAVING COUNT(DISTINCT consola) > 1;

-- 18. Todos os jogos ps4
SELECT jogos.codigo, COUNT(exemplares.numero) AS num_exemplares
FROM jogos
JOIN exemplares ON jogos.codigo = exemplares.codigo_jogo
WHERE exemplares.consola = 'ps4'
GROUP BY jogos.codigo;

--Selecionamos as colunas que queremos mostrar: o código do jogo, o título e o número de exemplares.
--Especificamos as tabelas que vamos usar: jogos e exemplares.
--Usamos a cláusula JOIN para combinar as duas tabelas usando o campo codigo_jogo.
--Adicionamos um filtro na cláusula WHERE para selecionar apenas os jogos com exemplares para a consola PS4.
--Agrupamos os resultados por código de jogo e título usando a cláusula GROUP BY.
--Contamos o número de exemplares disponíveis para cada jogo usando a função COUNT.


-- 19. Ordem ascendente de nome cliente, os titulos de jogos que ainda não alugou 

SELECT c.uid, c.nome, j.codigo
FROM clientes c, jogos j
WHERE j.codigo NOT IN (
    SELECT codigo_jogo FROM aluguer WHERE uid = c.uid
)
ORDER BY c.nome ASC;


-- 20. Exemplares de cada consola
SELECT jogos.codigo, exemplares.consola, COUNT(exemplares.numero) AS num_exemplares
FROM jogos
JOIN exemplares ON jogos.codigo = exemplares.codigo_jogo
GROUP BY jogos.codigo, exemplares.consola
ORDER BY codigo;

--Selecionamos as colunas que queremos mostrar: o código do jogo, o título, a consola e o número de exemplares.
--Especificamos as tabelas que vamos usar: jogos e exemplares.
--Usamos a cláusula JOIN para combinar as duas tabelas usando o campo codigo_jogo.
--Agrupamos os resultados por código de jogo, título e consola usando a cláusula GROUP BY.
--Contamos o número de exemplares disponíveis para cada combinação de código de jogo, título e consola usando a função COUNT.

-- 21. 

-- 22. Clientes que alugaram 3 ou mais jogos diferentes
SELECT c.uid, c.nome, COUNT(DISTINCT a.codigo_jogo) AS jogos_diferentes
FROM clientes c
INNER JOIN aluguer a
  ON c.uid = a.id_cliente
GROUP BY c.uid
HAVING COUNT(DISTINCT a.codigo_jogo) >= 3;

--A cláusula INNER JOIN combina as tabelas "clientes" e "aluguer", incluindo apenas as linhas que têm correspondência em ambas as tabelas (ou seja, os clientes que alugaram jogos).
--A condição ON c.uid = a.uid_cliente especifica como as tabelas devem ser combinadas, com base no campo "uid" da tabela "clientes" e no campo "uid_cliente" da tabela "aluguer".
--A cláusula GROUP BY agrupa os registros da tabela "aluguer" por código do usuário (uid).
--A função COUNT(DISTINCT a.codigo_jogo) conta quantos códigos de jogos diferentes cada usuário alugou. A cláusula DISTINCT é usada para contar cada código de jogo apenas uma vez.
--A cláusula HAVING filtra os resultados da consulta para incluir apenas os usuários que alugaram 3 ou mais jogos diferentes.
--A coluna "uid" e "nome" da tabela "clientes" são selecionadas para exibir o código do usuário e o nome dos clientes que atendem aos critérios de filtro.

-- 23. Clientes que alugaram jogos mais de 15 dias
SELECT c.uid, c.nome, a.d_entrega-a.d_aluguer AS dias_alugados
FROM clientes c
INNER JOIN aluguer a
  ON c.uid = a.id_cliente
WHERE JULIANDAY(a.d_entrega)-JULIANDAY(a.d_aluguer) > 15;


-- 24. Clientes sem alugueres
SELECT c.uid, c.nome
FROM clientes c
LEFT JOIN aluguer a
  ON c.uid = a.id_cliente
WHERE a.id_cliente IS NULL;

-- 25. Maior descida de preço
SELECT j.codigo,  MAX(p.preco_aluguer) - MIN(p.preco_aluguer) AS maior_descida_preco
FROM jogos j
JOIN precos p ON j.codigo = p.codigo_jogo
GROUP BY j.codigo
ORDER BY maior_descida_preco DESC
LIMIT 1;

-- 26. Clientes que não falham
SELECT c.uid, c.nome
FROM clientes c
JOIN aluguer a ON a.id_cliente = c.uid
GROUP BY c.uid, c.nome
HAVING COUNT(DISTINCT a.uid) > 2
   AND MAX(a.n_multa) = 0;
   
   -- 27. Há algum jogo cujos exemplares tenham sido alugados ao mesmo tempo? Liste todos os jogos.
SELECT j.codigo, j.codigo_editora
FROM jogos j
WHERE j.codigo IN (
  SELECT e.codigo_jogo
  FROM exemplares e
  JOIN aluguer a1 ON e.codigo_jogo = a1.codigo_jogo AND e.numero = a1.n_exemplar
  JOIN aluguer a2 ON e.codigo_jogo = a2.codigo_jogo AND a1.d_aluguer = a2.d_aluguer AND a1.uid <> a2.uid
);


-- 28. Melhor cliente
SELECT c.uid, c.nome, SUM(a.n_normais * p.preco_aluguer + a.n_multa * p.multa_diaria) AS valor_total
FROM clientes c
INNER JOIN aluguer a
  ON c.uid = a.id_cliente
INNER JOIN precos p
  ON a.codigo_jogo = p.codigo_jogo
WHERE a.d_entrega IS NOT NULL
GROUP BY c.uid, c.nome
ORDER BY valor_total DESC
LIMIT 1;


-- 29. Jogos da ps4 que estão disponiveis
SELECT codigo_jogo, numero
FROM exemplares
WHERE consola = 'ps4' AND NOT EXISTS (
  SELECT *
  FROM aluguer
  WHERE aluguer.codigo_jogo = exemplares.codigo_jogo AND aluguer.n_exemplar = exemplares.numero AND aluguer.d_entrega IS NULL
);

--A cláusula SELECT seleciona os campos "codigo_jogo" e "numero" da tabela "exemplares", que contêm o código e o número do exemplar do jogo, respectivamente.
--A cláusula FROM especifica a tabela "exemplares".
--A cláusula WHERE filtra os resultados para incluir apenas os jogos que são para a consola PS4 (através da condição consola = 'PS4') e que não estão atualmente alugados (ou seja, que não têm registros na tabela "aluguer" com uma data de entrega nula). Essa última condição é implementada com a subconsulta que começa com NOT EXISTS, que verifica se não existe um registro na tabela "aluguer" correspondente ao exemplar em questão e que ainda não foi entregue (ou seja, que tem uma data de entrega nula).

-- 30. Clientes que nunca alugaram jogos para pc
SELECT c.uid, c.nome
FROM clientes c
WHERE NOT EXISTS (
  SELECT *
  FROM aluguer a
  INNER JOIN exemplares e ON a.codigo_jogo = e.codigo_jogo AND a.n_exemplar = e.numero
  WHERE a.id_cliente = c.uid AND e.consola = 'PC'
);

--A cláusula SELECT seleciona os campos "uid" e "nome" da tabela "clientes", que contêm o número e o nome do cliente, respectivamente.
--A cláusula FROM especifica a tabela "clientes".
--A cláusula WHERE filtra os resultados para incluir apenas os clientes que não têm registros na tabela "aluguer" correspondentes a jogos para PC. Essa condição é implementada com a subconsulta que começa com NOT EXISTS, que verifica se não existe um registro na tabela "aluguer" correspondente ao cliente em questão e que envolve um jogo para PC. Para verificar se um jogo é para PC, usamos um INNER JOIN entre as tabelas "