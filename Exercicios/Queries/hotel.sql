-- 4. Pesquise na base de dados:
-- 4.1. Todos os quartos.
SELECT *
FROM quartos;

--4.2.Todas os hC3spedes.
SELECT *
FROM clientes;

--4.3.Todos as reservas.
SELECT *
FROM reservas;

--4.4. Todos os quartos disponC-veis, mostrando numero, lotaC'C#o e tema.
SELECT numero, lotacao, tipo
FROM quartos
WHERE estado = 'disponivel';

--4.5.Todos os quartos disponC-veis para mais de 3 pessoas (numero, lotaC'C#o e tema).
SELECT numero, lotacao, tipo
FROM quartos
WHERE lotacao > 3;

--4.6.Todos os quarto disponiveis dado um tema.
SELECT *
FROM quartos
WHERE tipo = 'suite';

--4.7.Todas as reservas de um determinado cliente
SELECT *
FROM reservas
WHERE id_cliente = 1;

--4.8. Lista de todas as reservas e os nomes dos hC3spedes que as fizeram.
SELECT reservas.id, clientes.primeiro_nome, clientes.ultimo_nome
FROM reservas
JOIN clientes ON reservas.id_cliente = clientes.id;

--4.9.Lista de todos os quartos com o nC:mero de camas, o tipo de cama e o preC'o.
SELECT numero, tipo, preco_noite
FROM quartos;

--4.10.Lista de todas as reservas e as informaC'C5es sobre os quartos que foram reservados.
SELECT *
FROM reservas
JOIN quartos ON reservas.id_quarto = quartos.id;

--4.11.Lista de todas as reservas confirmadas e os nomes dos hC3spedes que as fizeram.
SELECT reservas.id, reservas.estado, clientes.primeiro_nome, clientes.ultimo_nome
FROM reservas
JOIN clientes ON reservas.id_cliente = clientes.id
WHERE estado = 'confirmada';

--4.12.Lista de todos os quartos disponC-veis com o nC:mero de camas, tipo de cama e preC'o.
SELECT numero, tipo_cama, preco_noite
FROM quartos
WHERE estado = 'disponivel';

--4.13.Lista de todas as reservas com o nome do hC3spede, nC:mero do quarto, tipo de cama e preC'o.
SELECT reservas.id, clientes.primeiro_nome, clientes.ultimo_nome, quartos.numero, quartos.tipo_cama, quartos.preco_noite
FROM reservas
JOIN clientes ON reservas.id_cliente = clientes.id
JOIN quartos ON reservas.id_quarto = quartos.id;



--Outros exemplos:
SELECT pais, COUNT(clientes.pais) AS contagem
FROM clientes
GROUP BY pais
ORDER BY COUNT(clientes.pais) DESC;

SELECT tipo, COUNT(id) AS contagem
FROM quartos
GROUP BY tipo
ORDER BY COUNT(id) DESC;

SELECT estado, COUNT(id) AS contagem
FROM reservas
GROUP BY estado
ORDER BY COUNT(id);