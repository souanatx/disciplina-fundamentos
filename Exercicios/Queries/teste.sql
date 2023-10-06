CREATE VIEW  qlqcoisa as
SELECT c.uid, c.nome, j.codigo
FROM clientes c, jogos j
WHERE j.codigo NOT IN (
    SELECT codigo_jogo FROM aluguer WHERE uid = c.uid
)
ORDER BY c.nome ASC;