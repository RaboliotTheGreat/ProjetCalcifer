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
	ID INTEGER PRIMARY KEY NOT NULL,
	ISBN varchar(100),
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
	IDLIVRE INTEGER NOT NULL,
	IDUSER INTEGER NOT NULL,
	ETAT varchar(30),
	DATEDEPOT date,
	PRIMARY KEY(IDLIVRE,IDUSER),
	FOREIGN KEY (IDLIVRE) REFERENCES LIVRE(ID),
	FOREIGN KEY (IDUSER) REFERENCES USER(ID)
);

CREATE TABLE LIVRESOUHAITE (
	IDLIVRE INTEGER NOT NULL,
	IDUSER INTEGER NOT NULL,
	PRIMARY KEY(IDLIVRE,IDUSER),
	FOREIGN KEY (IDUSER) REFERENCES USER(ID),
	FOREIGN KEY (IDLIVRE) REFERENCES LIVRE(ID)
);

CREATE TABLE SERIE (
	ID INTEGER PRIMARY KEY NOT NULL,
	NOM varchar(100) NOT NULL
);

CREATE TABLE SERIELIVRE (
	IDSERIE INTEGER NOT NULL,
	IDLIVRE INTEGER NOT NULL,
	PRIMARY KEY(IDSERIE,IDLIVRE),
	FOREIGN KEY (IDSERIE) REFERENCES SERIE(ID),
	FOREIGN KEY (IDLIVRE) REFERENCES LIVRE(ID)
);
