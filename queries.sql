#CONSULTA 1: Quantos jogadores cada campanha atualmente em cada campanha?

SELECT CPM.nome AS CAMPANHA, COUNT(UID_JOGADOR) AS
QUANTIDADE_DE_JOGADORES FROM jogadorescampanha AS JC
INNER JOIN campanha AS CPM
ON JC.UID_CAMPANHA = CPM.UID_CAMPANHA GROUP BY
CPM.UID_CAMPANHA;


#CONSULTA 2: Mostrar todas as classes dos jogadores, e quantos personagem tem
jogando com elas.
SELECT CRPG.nome,COUNT(PJG.UID_CLASSECOMBATE =
CRPG.UID_CLASSECOMBATE) AS QUANTIDADE FROM classecombate AS CRPG
INNER JOIN personagemjogador AS PJG
ON PJG.UID_CLASSECOMBATE = CRPG.UID_CLASSECOMBATE GROUP BY
CRPG.nome;


#CONSULTA 3: Mostre nome, classe e level de todos os personagem do mestre
SELECT nomePersonagem, levelPersonagem FROM personagemmestre AS M
INNER JOIN JOGADOR AS J
ON M.UID_JOGADOR = J.UID_JOGADOR;


#CONSULTA 4: Obtenha nome, e idade de todos os jogadores
SELECT nome, idade FROM jogador;


#CONSULTA 5: Mostre nome, raça e classe de todos os inimigos
SELECT INI.nome, CB.nome, RC.nome FROM inimigo AS INI
LEFT JOIN classecombate AS CB ON INI.UID_CLASSECOMBATE =
CB.UID_CLASSECOMBATE
LEFT JOIN raca AS RC ON INI.UID_RACA = RC.UID_RACA;


#CONSULTA 6: Busque os livros de cada sistema, e mostre seu nome, tipo, e de qual
sistema ele pertence
SELECT SRPG.nome AS sistema, LVR.nome, LVR.tipo FROM sistemarpg AS SRPG
INNER JOIN livro as LVR
ON SRPG.UID_SISTEMARPG = LVR.UID_SISTEMARPG;


#CONSULTA 7: Quais livros os jogadores, em campanha tem acesso?
SELECT LVR.nome AS LIVROS FROM cjogador AS PJC
INNER JOIN jmestre AS PJ
INNER JOIN livro AS LVR ON LVR.UID_LIVRO = PJC.UID_LIVROS OR
LVR.UID_LIVRO = PJ.UID_LIVROS
GROUP BY LVR.nome;
