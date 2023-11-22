Drop Schema if exists Rede_Social_jogos_37279;
Create Schema Rede_Social_Jogos_37279;
Use Rede_Social_Jogos_37279;

Create Table usuario (
    nm_email VARCHAR(200),
    nm_usuario VARCHAR(200),
    nm_apelido VARCHAR(200),
    ds_usuario VARCHAR(200),
    nm_senha VARCHAR(200),
    constraint pk_usuario primary key (nm_email)
);


Create Table genero
(
	cd_genero int,
	nm_genero varchar(100),
	constraint pk_genero primary key (cd_genero)
);

Create Table rank
(
	cd_rank int,
	nm_rank varchar(100),
	constraint pk_rank primary key (cd_rank)
);

Create Table desenvolvedor
(
	cd_desenvolvedor int,
	nm_desenvolvedor varchar(100),
	constraint pk_desenvolvedor primary key (cd_desenvolvedor)
);

Create Table tipo_avaliacao
(
	cd_tipo_avaliacao int,
	nm_tipo_avaliacao varchar(100),
	constraint pk_tipo_avaliacao primary key (cd_tipo_avaliacao)
);

Create Table plataforma
(
	cd_plataforma int,
	nm_plataforma varchar(100),
	constraint pk_plataforma primary key (cd_plataforma)
);

Create Table tipo_jogo
(
	cd_tipo_jogo int,
	nm_tipo_jogo varchar(100),
	constraint pk_tipo_jogo primary key (cd_tipo_jogo)
);

/* Tabelas com chave estrangeira */


Create Table favorito
(
	nm_email VARCHAR(200),
	nm_email_favoritado VARCHAR(200),

	Constraint pk_favorito primary key (nm_email, nm_email_favoritado),
	Constraint fk_favorito_usuario foreign key (nm_email) references usuario(nm_email),
	Constraint fk_favorito_usuario_favoritado foreign key (nm_email_favoritado) references usuario(nm_email)
);

Create Table comentario
(
	nm_email_destinatario VARCHAR(200),
	nm_email_remetente VARCHAR(200),
	dt_comentario DATE,
	hr_comentario TIME,
	ds_comentario Text,
	Constraint pk_comentario primary key (nm_email_destinatario, nm_email_remetente,dt_comentario,hr_comentario),
	Constraint fk_comentario_usuario foreign key (nm_email_destinatario) references usuario(nm_email),
	Constraint fk_comentario_usuario_favoritado foreign key (nm_email_remetente) references usuario(nm_email)
);


Create Table jogo
(
	cd_jogo int,
	nm_jogo varchar(200),
	ds_sinopse_jogo TEXT,
	dt_lancamento_jogo DATE,
	cd_desenvolvedor int,
	cd_tipo_jogo int,
	constraint pk_jogo primary key (cd_jogo),
	constraint fk_jogo_desenvolvedor foreign key (cd_desenvolvedor) references desenvolvedor(cd_desenvolvedor),
	constraint fk_jogo_tipo_jogo foreign key (cd_tipo_jogo) references tipo_jogo(cd_tipo_jogo)
);

Create Table biblioteca
(
	cd_jogo int,
	cd_plataforma int,
	nm_email VARCHAR(200),
	qt_nivel varchar(200),
	ds_jogabilidade TEXT,
	cd_rank int,
	nm_apelido_jogo VARCHAR(100),
	constraint pk_biblioteca primary key (nm_email,cd_jogo,cd_plataforma),
	constraint fk_biblioteca_usuario foreign key (nm_email) references usuario(nm_email),
	constraint fk_biblioteca_jogo foreign key (cd_jogo) references jogo(cd_jogo),
	constraint fk_biblioteca_plataforma foreign key (cd_plataforma) references plataforma(cd_plataforma),
	constraint fk_biblioteca_rank foreign key (cd_rank) references rank(cd_rank)
);

Create Table jogo_genero
(
	cd_jogo int,
	cd_genero int,
	constraint pk_jogo_genero primary key (cd_jogo,cd_genero),
	constraint fk_jogo_genero_jogo foreign key (cd_jogo) references jogo(cd_jogo),
	constraint fk_jogo_genero_genero foreign key (cd_genero) references genero(cd_genero)
);

Create Table preferencia_genero
(
	nm_email varchar(200),
	cd_genero int,
	constraint pk_preferencia_genero primary key (nm_email,cd_genero),
	constraint fk_preferencia_genero_usuario foreign key (nm_email) references usuario(nm_email),
	constraint fk_preferencia_genero_genero foreign key (cd_genero) references genero(cd_genero)
);

Create Table avaliacao
(
	nm_email varchar(200),
	nm_email_avaliador varchar(200),
	cd_tipo_avaliacao int,
	qt_avaliacao int,
	constraint pk_avaliacao primary key (nm_email,nm_email_avaliador,cd_tipo_avaliacao),
	constraint fk_avaliacao_usuario foreign key (nm_email) references usuario(nm_email),
	constraint fk_avaliacao_tipo_avaliacao foreign key (cd_tipo_avaliacao) references tipo_avaliacao(cd_tipo_avaliacao),
	constraint fk_avaliacao_usuario_avaliador foreign key (nm_email_avaliador) references usuario(nm_email)
);

#Massa de testes
Insert into usuario	values('JoaoSilva@gmail.com','João Silva Costa','Vunahai','jhshj asd jfdsakf k  j lsdfkjads','Senha789');
Insert into usuario	values('JoaoBelson@hotmail.com','João Belson Costa','Xiasco','bla lallada lsad','Senha8189');
Insert into usuario	values('MariaSilva@hotmail.com','Maria Silva Costa','Moidu','jkfsdjkds lad','nSenha579');
Insert into usuario values('CarlosMelo@gmail.com', 'Carlos Melo', 'Carlinhos', 'Gamer desde criança', 'Senha123');
Insert into usuario values('AnaSantos@hotmail.com', 'Ana Santos', 'Aninha', 'Amo jogos de estratégia', 'Senha456');
Insert into usuario values('PedroFerreira@gmail.com', 'Pedro Ferreira', 'Pepezinho', 'Explorador de mundos virtuais', 'Senha789');
Insert into usuario values('JuliaCosta@hotmail.com', 'Julia Costa', 'Julinha', 'Viciada em jogos de terror', 'Senha567');

Insert into tipo_avaliacao values(1,'Amigavel');
Insert into tipo_avaliacao values(2,'Habilidade');
Insert into tipo_avaliacao values(3,'Cooperação');

Insert into plataforma values (1,'Computador');
Insert into plataforma values (2,'Xbox One');
Insert into plataforma values (3,'Play Station 5');
Insert into plataforma values (4,'Mobile');

Insert into rank values(0,'Não há rank');
Insert into rank values(1,'Iniciante');
Insert into rank values(2,'Avançado');
Insert into rank values(3,'Expert');
Insert into rank values(4,'Lenda');

Insert into tipo_jogo values(1,'Multiplayer');
Insert into tipo_jogo values(2,'Singleplayer');
Insert into tipo_jogo values(3,'Massivo');

Insert into desenvolvedor values(1,'Valve');
Insert into desenvolvedor values(2,'Activision');
Insert into desenvolvedor values(3,'Nintendo');

Insert into genero values(1,'Ação');
Insert into genero values(2,'Estratégia');
Insert into genero values(3,'Sobrevivência');
Insert into genero values(4,'Terror');
Insert into genero values(5,'Suspense');

Insert into jogo values(1,'Call of Duty Warzone','Mais um jogo da franquia','2014-2-1',2,1);
Insert into jogo values(2,'Call of Duty Mobile','Mais um jogo da franquia,mas pra mobile','2019-3-2',2,1);
Insert into jogo values(3,'Call of Duty Warzone Mobile','Versão do Warzone para dispositivos mobiles','2022-9-8',2,1);
Insert into jogo values(4,'Resident Evil','Sobreviva aos zumbis','2020-7-9',3,2);

Insert into jogo_genero values(1,1);
Insert into jogo_genero values(1,2);
Insert into jogo_genero values(1,3);

Insert into jogo_genero values(2,1);
Insert into jogo_genero values(2,2);
Insert into jogo_genero values(2,3);

Insert into jogo_genero values(3,1);
Insert into jogo_genero values(3,2);
Insert into jogo_genero values(3,3);

Insert into jogo_genero values(4,4);
Insert into jogo_genero values(4,5);

#jogo 1
Insert into biblioteca values(1,1,'JoaoSilva@gmail.com',15,'Gosto de jogar de sniper',3,'Joao_silva');
Insert into biblioteca values(1,2,'JoaoSilva@gmail.com',35,'Gosto de jogar de sniper',3,'Joao_silva2');
Insert into biblioteca values(1,1,'JoaoBelson@hotmail.com',0,'fdsdf sdd dsdsf',0,'Joao_Belson');
Insert into biblioteca values(1,1,'CarlosMelo@gmail.com',0,'fdsdfsddsdsf',0,'Carlao2');
Insert into biblioteca values(1,1,'MariaSilva@hotmail.com',15,'Gosto de jogar de sniper',3,'Mariah');

#jogo 2
Insert into biblioteca values(2,4,'JoaoSilva@gmail.com',23,'Prefiro jogar agressivo pelo mobile',4,'Joao-Silva');
Insert into biblioteca values(2,2,'MariaSilva@hotmail.com',19,'Gosto de jogar de sniper',3,'Mariah');

#jogo 3 
Insert into biblioteca values(3,4,'JoaoSilva@gmail.com',13,'Prefiro jogar agressivo pelo mobile',4,'Joao_silva_20');

#jogo 4
Insert into biblioteca values(4,3,'MariaSilva@hotmail.com',0,'fdsdfsddsdsf',0,'Mariah_novo');
Insert into biblioteca values(4,1,'JoaoBelson@hotmail.com',0,'fdsdfsddsdsf',0,'Joao_silva');


Insert into preferencia_genero values('JoaoSilva@gmail.com',1);
Insert into preferencia_genero values('JoaoSilva@gmail.com',2);
Insert into preferencia_genero values('JoaoSilva@gmail.com',3);
Insert into preferencia_genero values('MariaSilva@hotmail.com',1);
Insert into preferencia_genero values('MariaSilva@hotmail.com',5);

Insert into avaliacao values('MariaSilva@hotmail.com','JoaoSilva@gmail.com',1,3);
Insert into avaliacao values('MariaSilva@hotmail.com','JoaoSilva@gmail.com',2,2);
Insert into avaliacao values('MariaSilva@hotmail.com','JoaoSilva@gmail.com',3,5);

Insert into avaliacao values('JoaoSilva@gmail.com','MariaSilva@hotmail.com',1,2);
Insert into avaliacao values('JoaoSilva@gmail.com','MariaSilva@hotmail.com',2,5);
Insert into avaliacao values('JoaoSilva@gmail.com','MariaSilva@hotmail.com',3,4);

Insert into avaliacao values('MariaSilva@hotmail.com','JoaoBelson@hotmail.com',1,2);
Insert into avaliacao values('MariaSilva@hotmail.com','JoaoBelson@hotmail.com',2,5);
Insert into avaliacao values('MariaSilva@hotmail.com','JoaoBelson@hotmail.com',3,5);

Insert into avaliacao values('JoaoBelson@hotmail.com','MariaSilva@hotmail.com',1,5);
Insert into avaliacao values('JoaoBelson@hotmail.com','MariaSilva@hotmail.com',2,4);
Insert into avaliacao values('JoaoBelson@hotmail.com','MariaSilva@hotmail.com',3,4);

insert into comentario values('MariaSilva@hotmail.com','JoaoSilva@gmail.com','2023-12-5','15:10:15','Valeu por jogar,foi daora');
insert into comentario values('JoaoSilva@gmail.com','MariaSilva@hotmail.com','2023-12-5','15:20:55','Jogou bem,parabéns');

insert into comentario values('MariaSilva@hotmail.com','JoaoBelson@hotmail.com','2023-11-5','23:20:52','Jogou bem mano,vou te favoritar!!!');
insert into comentario values('JoaoBelson@hotmail.com','MariaSilva@hotmail.com','2023-11-5','23:22:22','Jogou muito bem,bora jogar denovo!!!');

insert into favorito values('MariaSilva@hotmail.com','JoaoBelson@hotmail.com'); 
insert into favorito values('JoaoBelson@hotmail.com','MariaSilva@hotmail.com');
insert into favorito values('JoaoSilva@gmail.com','MariaSilva@hotmail.com');
insert into favorito values('JoaoSilva@gmail.com','JoaoBelson@hotmail.com');