-- 2. Pesquise na base de dados:
-- 2.1. Todos os cães.
SELECT *
FROM RaC'as;

-- 2.2. Todas as raças.
SELECT *
FROM CC#es;

-- 2.3. Todos os donos.
SELECT *
FROM Donos;

-- 2.4.Dado um id do dono, listar todas as informações dessa pessoa.
SELECT * 
FROM Donos
WHERE Id = 1;

SELECT *
FROM Donos
WHERE Nome = 'JoC#o Silva';

-- 2.5. Listar todos os cães com uma determinada idade, por exemplo, 5 anos.
SELECT *
FROM CC#es
WHERE Idade = 5;

-- 2.6. Listar todos os cães de um determinado dono (dado o seu id), mostrando nome, idade e raça.
SELECT Nome, Idade, RaC'a
FROM CC#es
WHERE Dono = 1;

-- 2.7. Listar todos os cães com menos de 3 anos, deve apresentar nome, idadee raça.
SELECT Nome, Idade, RaC'a
FROM CC#es
WHERE Idade < 3;

-- 2.8. Dado o Id da raça, listar o nome e idade de todos os cães dessa raça, ordenados pelo nome.
SELECT Nome, Idade
FROM CC#es
WHERE RaC'a = 1
ORDER BY Nome;

-- 2.9. Dado o Id da raça e a idade, listar todos os cães (nome e idade) que sejam dessa raça e tenham menos que a idade fornecida, ordenados pela idade.
SELECT Nome, Idade
FROM CC#es
WHERE RaC'a = 1 AND Idade < 4
ORDER BY Idade; 