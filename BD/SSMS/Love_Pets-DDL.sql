CREATE DATABASE Love_Pets;
GO

USE Love_Pets;
GO

CREATE TABLE Clinica
(
	idClinica	INT PRIMARY KEY IDENTITY,
	endereco	VARCHAR(200) NOT NULL UNIQUE,
	razaoSocial	VARCHAR(50) NOT NULL UNIQUE,
	cnpj		CHAR(14) NOT NULL UNIQUE
);
GO

CREATE TABLE Dono
(
	idDono		INT PRIMARY KEY IDENTITY,
	nomeDono	VARCHAR(50) NOT NULL
);
GO

CREATE TABLE TipoPet
(
	idTipoPet	INT PRIMARY KEY IDENTITY,
	nomeTipoPet	VARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE Raca
(
	idRaca	INT PRIMARY KEY IDENTITY,
	idTipoPet	INT FOREIGN KEY REFERENCES TipoPet(idTipoPet),
	nomeRaca VARCHAR(200) NOT NULL UNIQUE
);
GO

CREATE TABLE TipoUsuario
(
	idTipoUsuario INT PRIMARY KEY IDENTITY,
	nomeTipoUsuario VARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE Usuario
(
	idUsuario	INT PRIMARY KEY IDENTITY,
	idTipoUsuario	INT FOREIGN KEY REFERENCES TipoUsuario(idTIpoUsuario),
	email	VARCHAR(100) NOT NULL UNIQUE,
	senha	VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Pet
(
	idPet INT PRIMARY KEY IDENTITY,
	nomePet		VARCHAR(50) NOT NULL,
	idRaca	INT FOREIGN KEY REFERENCES Raca(idRaca),
	idDono	INT FOREIGN KEY REFERENCES Dono(idDono),
	dataNascimento	DATE NOT NULL,
	idUsuario	INT FOREIGN KEY REFERENCES Usuario(idUsuario)
);
GO

CREATE TABLE Veterinario
(
	idVeterinario		INT PRIMARY KEY IDENTITY,
	idClinica			INT FOREIGN KEY REFERENCES clinica (idClinica),
	crmv				CHAR(6) NOT NULL UNIQUE,
	nomeVeterinario	VARCHAR(50) NOT NULL,
	idUsuario			INT FOREIGN KEY REFERENCES usuario(idUsuario)
);
GO

CREATE TABLE Situacao
(
	idSituacao	INT PRIMARY KEY IDENTITY,
	nomeSituacao	VARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE Atendimento
(
	idAtendimento		INT PRIMARY KEY IDENTITY,
	idPet				INT FOREIGN KEY REFERENCES pet (idPet),
	idVeterinario		INT FOREIGN KEY REFERENCES veterinario (idVeterinario),
	descricao			TEXT DEFAULT('sem descri��o informada'),
	dataAtendimento	SMALLDATETIME NOT NULL,
	idSituacao			INT FOREIGN KEY REFERENCES situacao(idSituacao) DEFAULT(2)
);