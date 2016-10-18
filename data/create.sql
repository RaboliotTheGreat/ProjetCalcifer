CREATE TABLE USER (
	ID INTEGER PRIMARY KEY NOT NULL,
	LOGIN varchar(30) NOT NULL,
	MDP TEXT NOT NULL,
	SOLDE int NOT NULL,
	MAIL varchar(50),
	VILLE varchar(50),
	DATEINS date
);

CREATE TABLE LIVRE (
	ISBN int PRIMARY KEY NOT NULL,
	TITRE varchar(100) NOT NULL,
	AUTEUR varchar(100) NOT NULL,
	EDITION varchar(100),
	COLLECTION varchar(100),
	VALEUR int,	
	RESUME text,
	IMAGE text,
	CONSTRAINT isbn_unique UNIQUE (ISBN)
);

CREATE TABLE LIVREDEPOSE (
	ISBN INTEGER NOT NULL,
	IDUSER INTEGER NOT NULL,
	ETAT varchar(30),
	DATEDEPOT date,
	PRIMARY KEY(IDLIVRE,IDUSER),
	FOREIGN KEY (ISBN) REFERENCES LIVRE(ISBN),
	FOREIGN KEY (IDUSER) REFERENCES USER(ID)
);

CREATE TABLE LIVRESOUHAITE (
	ISBN INTEGER NOT NULL,
	IDUSER INTEGER NOT NULL,
	PRIMARY KEY(IDLIVRE,IDUSER),
	FOREIGN KEY (IDUSER) REFERENCES USER(ID),
	FOREIGN KEY (ISBN) REFERENCES LIVRE(ISBN)
);

CREATE TABLE SERIE (
	ID INTEGER PRIMARY KEY NOT NULL,
	NOM varchar(100) NOT NULL
);

CREATE TABLE SERIELIVRE (
	IDSERIE INTEGER NOT NULL,
	ISBN INTEGER NOT NULL,
	PRIMARY KEY(IDSERIE,IDLIVRE),
	FOREIGN KEY (IDSERIE) REFERENCES SERIE(ID),
	FOREIGN KEY (IDLIVRE) REFERENCES LIVRE(ISBN)
);
