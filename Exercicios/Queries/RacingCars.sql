-- Inserir competições com base nas pistas existentes
INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (1, 'Grande Prêmio de Mônaco', 1, 78);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (2, 'Grande Prêmio da Alemanha', 2, 67);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (3, 'Grande Prêmio da Bélgica', 3, 44);

-- Continue inserindo competições com base nas pistas existentes
INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (4, 'Grande Prêmio dos Estados Unidos', 4, 56);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (5, 'Grande Prêmio do Reino Unido', 5, 52);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (6, 'Grande Prêmio do Japão', 6, 53);

-- Continue inserindo competições com base nas pistas existentes
INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (7, 'Grande Prêmio da Itália', 7, 53);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (8, 'Grande Prêmio do Brasil', 8, 71);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (9, 'Grande Prêmio da Áustria', 9, 71);

-- Continue inserindo competições com base nas pistas existentes
INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (10, 'Grande Prêmio da Espanha', 10, 66);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (11, 'Grande Prêmio da China', 11, 56);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (12, 'Grande Prêmio dos Emirados Árabes Unidos', 12, 55);

-- Continue inserindo competições com base nas pistas existentes
INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (13, 'Grande Prêmio da França', 13, 53);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (14, 'Grande Prêmio do México', 14, 71);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (15, 'Grande Prêmio do Bahrein', 15, 57);

-- Continue inserindo competições com base nas pistas existentes
INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (16, 'Grande Prêmio da Hungria', 16, 70);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (17, 'Grande Prêmio da Austrália', 17, 58);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (18, 'Grande Prêmio da Rússia', 18, 53);

-- Continue inserindo competições com base nas pistas existentes
INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (19, 'Grande Prêmio da Malásia', 19, 56);

INSERT INTO [Competicoes] ([id], [Nome], [Pista], [NumeroVoltas])
VALUES (20, 'Grande Prêmio do Canadá', 20, 70);


INSERT INTO [Competicoes] ([id], [Nome], [Carro], [Pista], [NumeroVoltas])
SELECT 1, 'Grande Prêmio de Mônaco', [id], 1, 78
FROM [Carros]
WHERE [id] IN (1, 2)
UNION ALL
SELECT 2, 'Grande Prêmio da Alemanha', [id], 2, 67
FROM [Carros]
WHERE [id] IN (2, 3)
UNION ALL
SELECT 3, 'Grande Prêmio da Bélgica', [id], 3, 44
FROM [Carros]
WHERE [id] IN (3, 4);
-- Continue adicionando mais competições seguindo o mesmo padrão

INSERT INTO [CarrosCompeticao] ([competicao], [carro])
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  
  (2, 4),
  (2, 5),
  (2, 6),
  
  (3, 7),
  (3, 8),
  (3, 9),
  
  (4, 10),
  (4, 11),
  (4, 12),
  
  (5, 13),
  (5, 14),
  (5, 15),
  
  (6, 16),
  (6, 17),
  (6, 18),
  
  (7, 19),
  (7, 20),
  (7, 21),
  
  (8, 22),
  (8, 23),
  (8, 24),
  
  (9, 25),
  
(11, 1),
  (11, 2),
  (11, 3),
  
  (12, 4),
  (12, 5),
  (12, 6),
  
  (13, 7),
  (13, 8),
  (13, 9),
  
  (14, 10),
  (14, 11),
  (14, 12),
  
  (15, 13),
  (15, 14),
  (15, 15),
  
  (16, 16),
  (16, 17),
  (16, 18),
  
  (17, 19),
  (17, 20),
  (17, 21),
  
  (18, 22),
  (18, 23),
  (18, 24),
  
  (19, 25),
  
  (9, 1),
(9, 2),
(9, 3),

(10, 4),
(10, 5),
(10, 6),

(11, 7),
(11, 8),
(11, 9),

(12, 10),
(12, 11),
(12, 12),

(13, 13),
(13, 14),
(13, 15),

(14, 16),
(14, 17),
(14, 18),

(15, 19),
(15, 20),
(15, 21),

(16, 22),
(16, 23),
(16, 24),

(17, 25),

(18, 1),
(18, 2),
(18, 3),

(19, 4),
(19, 5),
(19, 6),

(20, 7),
(20, 8),
(20, 9);

