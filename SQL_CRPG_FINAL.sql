
CREATE SCHEMA campanhaRPG;
USE campanhaRPG;

CREATE TABLE sistemaRPG(
UID_SISTEMARPG INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
PRIMARY KEY(UID_SISTEMARPG));

CREATE TABLE livro(
UID_LIVRO INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
tipo VARCHAR(20) NOT NULL,
UID_SISTEMARPG INTEGER NOT NULL,
PRIMARY KEY(UID_LIVRO),
FOREIGN KEY(UID_SISTEMARPG) REFERENCES sistemaRPG(UID_SISTEMARPG));

CREATE TABLE classeCombate(
UID_CLASSECOMBATE INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(25) NOT NULL,
alcanceMedio VARCHAR(15) NOT NULL,
estiloCombate VARCHAR(25) NOT NULL,
armaInicial VARCHAR(40) NOT NULL,
armaduraInicial VARCHAR(40) NOT NULL,
ouroInicial INTEGER NOT NULL,
UID_SISTEMARPG INTEGER NOT NULL,
PRIMARY KEY(UID_CLASSECOMBATE),
FOREIGN KEY(UID_SISTEMARPG) REFERENCES sistemaRPG(UID_SISTEMARPG));

CREATE TABLE raca(
UID_RACA INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(25) NOT NULL,
gostos VARCHAR(20) NOT NULL,
comportamento VARCHAR(15) NOT NULL,
atributoBeneficiado VARCHAR(15) NOT NULL,
atributoDepreciado VARCHAR(15) NOT NULL,
deslocamento real NOT NULL,
UID_SISTEMARPG INTEGER NOT NULL,
PRIMARY KEY(UID_RACA),
FOREIGN KEY(UID_SISTEMARPG) REFERENCES sistemaRPG(UID_SISTEMARPG));

CREATE TABLE inimigo(
UID_INIMIGO INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(25) NOT NULL,
levelInimigo INTEGER NOT NULL,
UID_RACA INTEGER NOT NULL,
UID_CLASSECOMBATE INTEGER NOT NULL,
UID_SISTEMARPG INTEGER NOT NULL,
PRIMARY KEY(UID_INIMIGO),
FOREIGN KEY (UID_RACA) REFERENCES raca(UID_RACA),
FOREIGN KEY (UID_CLASSECOMBATE) REFERENCES classeCombate(UID_CLASSECOMBATE),
FOREIGN KEY(UID_SISTEMARPG) REFERENCES sistemaRPG(UID_SISTEMARPG));

CREATE TABLE campanha (
UID_CAMPANHA INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
mundo VARCHAR(20) NOT NULL, 
eraHistorica VARCHAR(15) NOT NULL,
UID_SISTEMARPG INTEGER NOT NULL,
PRIMARY KEY(UID_CAMPANHA),
FOREIGN KEY(UID_SISTEMARPG) REFERENCES sistemaRPG (UID_SISTEMARPG));

CREATE TABLE jogador(
UID_JOGADOR INTEGER NOT NULL AUTO_INCREMENT,
nome VARCHAR(25) NOT NULL,
idade INTEGER NOT NULL,
PRIMARY KEY (UID_JOGADOR));


CREATE TABLE jogadoresCampanha (
UID_CAMPANHA INTEGER NOT NULL,
UID_JOGADOR INTEGER NOT NULL,
CONSTRAINT PK_JOGADORES_CAMPANHA PRIMARY KEY(UID_CAMPANHA, UID_JOGADOR),
FOREIGN KEY(UID_CAMPANHA) REFERENCES campanha(UID_CAMPANHA),
FOREIGN KEY(UID_JOGADOR) REFERENCES jogador(UID_JOGADOR));

CREATE TABLE jMestre (
UID_JOGADOR INTEGER NOT NULL,
UID_LIVROS INTEGER NOT NULL,
CONSTRAINT PK_JOGADOR_MESTRE PRIMARY KEY(UID_JOGADOR),
FOREIGN KEY (UID_LIVROS) REFERENCES livro(UID_LIVRO),
FOREIGN KEY (UID_JOGADOR) REFERENCES jogador(UID_JOGADOR));

CREATE TABLE cJogador (
UID_JOGADOR INTEGER NOT NULL,
UID_LIVROS INTEGER NOT NULL,
CONSTRAINT PK_JOGADOR_C PRIMARY KEY(UID_JOGADOR),
FOREIGN KEY (UID_LIVROS) REFERENCES livro(UID_LIVRO),
FOREIGN KEY (UID_JOGADOR) REFERENCES jogador(UID_JOGADOR));

CREATE TABLE personagemMestre (
UID_PERSONAGEM_M INTEGER NOT NULL AUTO_INCREMENT,
nomePersonagem VARCHAR(25) NOT NULL,
levelPersonagem INTEGER NOT NULL, 
xpPersonagem REAL NOT NULL,
ficha VARCHAR(60) NOT NULL,
UID_CLASSECOMBATE INTEGER NOT NULL,
UID_RACA INTEGER NOT NULL,
UID_JOGADOR INTEGER NOT NULL,
PRIMARY KEY (UID_PERSONAGEM_M),
FOREIGN KEY (UID_CLASSECOMBATE) REFERENCES classeCombate(UID_CLASSECOMBATE),
FOREIGN KEY (UID_RACA) REFERENCES raca(UID_RACA),
FOREIGN KEY (UID_JOGADOR) REFERENCES jMestre(UID_JOGADOR));

CREATE TABLE personagemJogador (
UID_PERSONAGEM_C INTEGER NOT NULL AUTO_INCREMENT,
nomePersonagem VARCHAR(25) NOT NULL,
levelPersonagem INTEGER NOT NULL, 
xpPersonagem REAL NOT NULL,
ficha VARCHAR(60) NOT NULL,
UID_CLASSECOMBATE INTEGER NOT NULL,
UID_RACA INTEGER NOT NULL,
UID_JOGADOR INTEGER NOT NULL,
PRIMARY KEY (UID_PERSONAGEM_C),
FOREIGN KEY (UID_CLASSECOMBATE) REFERENCES classeCombate(UID_CLASSECOMBATE),
FOREIGN KEY (UID_RACA) REFERENCES raca(UID_RACA),
FOREIGN KEY (UID_JOGADOR) REFERENCES cJogador(UID_JOGADOR));

INSERT INTO sistemaRPG (nome)
VALUES('Dungeon World'),('Belregard'),('Blades in the Dark'),('Numenera'),('Dungeons & Dragons');

INSERT INTO livro (nome,tipo, UID_SISTEMARPG )
   VALUES('Livro do jogador', 'Regras Jogador',1),
		 ('Livro do mestre', 'Regras Mestre',1),
		 ('Livro de magias', 'Compendium',1),
         ('Livro dos monstros', 'Bestiario',1),
		 ('Livro de receitas', 'Criacao',1),
		 ('Livro basico mestre', 'Regras Mestre',2),
		 ('Livro criando aventuras', 'Regras Mestre',2),
		 ('Livro basico jogador', 'Regras Jogador',2),
         ('Livro das bestas', 'Bestiario',2),
         ('Livro Plantas magicas', 'Enciclopedia',2),
		 ('Regras bascias', 'Regras Jogador',3),
		 ('Regras do mundo', 'Regras Mestre',3),
		 ('Monstros grandes', 'Bestiario',3),
		 ('Monstros Pequenos', 'Bestiario',3),
		 ('Itens Magicos', 'Enciclopedia',3),
		 ('Livro do jogador', 'Regras Jogador', 4),
		 ('Livro do mestre', 'Regras Mestre', 4),
		 ('Livro das bestas', 'Bestiario', 4),
		 ('Itens Magicos', 'Enciclopedia', 4),
		 ('Livro Plantas magicas', 'Enciclopedia', 4),
         ('Livro do jogador','Regras Jogador',5 ),
		 ('Guia do mestre','Regras Mestre',5 ),
		 ('Manual dos monstros','Bestiario',5 ),
		 ('Tashas Cauldron of Everything','Compendium',5 ),
		 ('Guia de monstros do Volos','Bestiairo',5 );

INSERT INTO raca (nome,gostos,comportamento,atributoBeneficiado,atributoDepreciado,deslocamento,UID_SISTEMARPG)
   VALUES('Orc','Guerrear','Agressivo','Força','Inteligência',9.5,1),
		 ('Anão','Hidromel','Pavio Curto','Constituição','Destreza',7.5,1),
         ('Humano','Festejar','Neutro','Todos','Nenhum',8.5,1),
         ('Halfling','Guloso','Bondoso','Destreza','Força',7.5,1),
         ('Elfo','Literatura','Neutro/Caótico','Destreza','Força',8.5,1),
         ('Tritão','Mar','Neutro/Caótico','Destreza','Constituição',9.5,2),
		 ('Anão da Montanha','Hidromel da Montanha','Calmo','Constituição','Destreza',7.5,2),
         ('Golias','Destruição','Agressivo','Força','Destreza',9.5,2),
         ('Tabaxi','Leite','Caótico','Destreza','Força',7.5,2),
         ('Dragonborn','Armaduras','Caótico','Constituição','Destreza',9.5,2),
         ('Meio Elfo','Poesia','Neutro/Caótico','Destreza','Constituição',9.5,3),
		 ('Anão da Floresta','Machados','Neutro','Forca','Destreza',7.5,3),
         ('Gnomio','Ouro','Passivo','Sabedoria','Força',7.5,3),
         ('Genasi','Lutas','Neutro','Destreza','Força',8.5,3),
         ('Aarakocra','Voar','Passivo','Destreza','Força',7.5,3),
		 ('Duende','Pregar Peças','Caótico','Destreza','Constituição',7.5,4),
		 ('Anão do Milharal','Colheitas','Passivo','Sabedoria','Destreza',7.5,4),
         ('Tiefling','Nada','Agressivo','Destreza','Força',7.5,4),
         ('Pesadelo','Nada','Agressivo','Constituição','Sabedoria',9.5,4),
         ('Kenku','Roubar','Caótico','Destreza','Força',7.5,4),
         ('Githyanki','Ler','Passivo','Inteligência','Constituição',7.5,5),
		 ('Anão do Pântano','Caça','Neutro/Caótico','Constituição','Destreza',7.5,5),
         ('Tortle','Plantar','Bondoso','Constituição','Inteligência',7.5,5),
         ('Aasimar','Caridade','Bondoso','Força','Constituição',8.5,5),
         ('Warforger','Guerrear','Neutro','Constituição','Sabedoria',9.5,5),
		 ('Humano','Guerrear','Neutro','Todos','Nenhum',7.5,5);

INSERT INTO classecombate (nome, alcanceMedio, estiloCombate, armaInicial, armaduraInicial, ouroInicial, UID_SISTEMARPG)
   VALUES('Bardo', 'Medio/Longo', 'Variado', 'Rapieira', 'Armadura de couro simples', 5, 1),
		 ('Lamina da noite', 'Curto/Medio', 'Assassinato', 'Adagas', 'Armadura de couro simples', 5, 1),
		 ('Espadachim', 'Curto', 'Duelo', 'Espada Longa', 'Cota de malha ', 5, 1),
		 ('Mago', 'Longo', 'Variado', 'Cajado', 'Manto', 5, 1),
		 ('Bárbaro', 'Medio/Longo', 'Variado', 'Rapieira', 'Armadura de couro simples', 5, 1),
         ('Animago', 'Medio/Longo', 'Variado', 'Adaga', 'Armadura de couro simples', 5, 2),
		 ('Engenhoqueiro', 'Medio', 'Improviso', 'Construto simples', 'Armadura de couro simples', 5, 2),
		 ('Samurai', 'Curto', 'Duelo', 'Katana', 'Manto samurai', 5, 2),
		 ('Mago de gelo', 'Longo', 'Variado', 'Cajado', 'Manto da neve', 5, 2),
		 ('Berseker', 'Medio/Longo', 'Variado', 'Rapieira', 'Armadura de couro simples', 5, 2),
		 ('Patrulheiro', 'Medio/Longo', 'Variado', 'Arco', 'Armadura de couro simples', 5, 3),
		 ('Assassino', 'Medio', 'Combate Cego', 'Adagas', 'Armadura de couro simples', 5, 3),
		 ('Ronin', 'Curto', 'Duelo Mortal', 'Katana', 'Manto Ronin', 5, 3),
		 ('Mago de fogo', 'Longo', 'Variado', 'Cajado', 'Manto do vulcão', 5, 3),
		 ('Monge', 'Curto', 'Corpo-a-corpo', 'Nenhum', 'Rakusu ', 5, 3),
		 ('Bárbaro', 'Medio/Longo', 'Variado', 'Rapieira', 'Armadura de couro simples', 5, 4),
		 ('Samurai', 'Curto', 'Duelo', 'Katana', 'Manto samurai', 5, 4),
		 ('Engenhoqueiro', 'Medio', 'Improviso', 'Construto simples', 'Armadura de couro simples', 5, 4),
         ('Animago', 'Medio/Longo', 'Variado', 'Adaga', 'Armadura de couro simples', 5, 4),
		 ('Patrulheiro', 'Medio/Longo', 'Variado', 'Arco', 'Armadura de couro simples', 5, 4),
         ('Bardo', 'Medio/Longo', 'Variado', 'Rapieira', 'Armadura de couro simples', 5, 5),
		 ('Clérigo', 'Medio', 'Proteção', 'Martelo', 'Cota de malha', 5, 5),
         ('Feiticeiro', 'Longo','Destruidor', 'Cajado retorcido', 'Manto negro', 5, 5 ),
		 ('Arcanista', 'Longo', 'Acadêmico', 'Grmiório', 'Manto', 5, 5 ),
         ('Cavaleiro', 'Curto', 'Duelo', 'Espada e escudo', 'Cota de malha', 5, 5 );
         
INSERT INTO inimigo (nome, levelInimigo, UID_RACA, UID_CLASSECOMBATE,UID_SISTEMARPG)
	VALUES('Mankoor', 2,3,3,1),
		  ('Alvaror',3,4,2,1),
          ('Squis ds',4,2,1,1),
		  ('Savaror',1,5,2,1),
          ('Savaror',3,5,2,1),
          ('Savaror',5,5,2,1),
          ('Kas, o traidor',4,6,5,5),
          ('Levianar',1,2,3,5),
          ('Scarnae',12,4,2,5),
          ('Arasoka',1,3,4,5),
		  ('Filho Segundo',1,1,1,5);
          
INSERT INTO campanha(nome, mundo,eraHistorica, UID_SISTEMARPG)
	VALUES('FILHOS DE AZEROTH', 'AZEROTH', 'MEDIEVAL',1),
		  ('SOMBRAS DA NOITE', 'MIDGARD', 'DESCOBRIMENTO',2),
          ('HERÓIS SEM NOME', 'TERRA', 'CLÁSSICA',3),
		  ('LADRÕES DA MAGIA', 'TERRA', 'MODERNA',4),
		  ('FORA DO ABISMO', 'RAVENLOFT', 'MEDIEVAL',5);
          
INSERT INTO jogador(nome,idade)
	VALUES('Kalielson Matheus',21),
		  ('João Pedro',21),
          ('Joab Anderson',22),
		  ('Daniel Kleiton',24),
          ('Vin Diesel',53),
          ('Matheus Souza',44),
		  ('Pedro Nunes',32),
          ('Anderson Makieval',21),
		  ('Magnus Opus',18),
          ('Jonas TREIS',32),
          ('Augusto WGO', 34),
          ('Halone Sluve', 21),
		  ('Jonatas Diogo', 19);
		
INSERT INTO jogadorescampanha (UID_CAMPANHA, UID_JOGADOR)
	VALUES(5,1),
		  (5,2),
          (5,3),
          (5,4),
          (5,5),
		  (5,6),
          (4,7),
		  (4,4),
          (4,13),
          (4,9),
          (4,12),
          (3,6),
          (3,8),
          (3,7),
		  (3,5),
          (3,4),
          (2,1),
          (2,3),
		  (2,4),
		  (2,8),
		  (2,11),
          (1,12),
          (1,10),
          (1,5),
		  (1,4),
          (1,6);
          
INSERT INTO jmestre(UID_JOGADOR,UID_LIVROS)
	VALUES(1,22),
		  (7,2),
          (13,6),
		  (6,17),
		  (8,12);
          
INSERT INTO cjogador (UID_JOGADOR,UID_LIVROS)
	VALUES(2,21),
		  (3,21),
		  (4,21),
          (5,21),
          (6,21);
INSERT INTO personagemmestre(nomePersonagem, levelPersonagem, xpPersonagem, ficha, UID_CLASSECOMBATE, UID_RACA, UID_JOGADOR)
	VALUES('Agugutus lws', 2, 23.2, '<<link>>', 20,23,1),
		  ('Lalilus sars', 4, 12.2, '<<link>>', 24,26,1),
          ('Sr Luis', 2, 17.4, '<<link>>', 21,24,1),
          ('Sr Tiago', 3, 20, '<<link>>', 21,24,1),
		  ('Vans destruidor', 5, 35.5, '<<link>>', 24,25,1);
          
INSERT INTO personagemjogador(nomePersonagem, levelPersonagem, xpPersonagem, ficha, UID_CLASSECOMBATE, UID_RACA, UID_JOGADOR )
	VALUES('Dioginho', 2, 250,'<<link>>', 22, 23, 2),
		  ('Tsumiki', 2, 250,'<<link>>', 20, 26, 3),
		  ('Arono', 1, 175, '<<link>>', 24, 26, 4),
		  ('Calisto', 2, 250,'<<link>>', 25, 21, 5),
          ('Trigrona', 2, 250,'<<link>>', 23, 24, 6),
          ('zzzzz', 2, 250,'<<link>>', 25, 21, 5);


