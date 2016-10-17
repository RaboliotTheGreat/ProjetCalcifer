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
	NOM varchar(100) NOT NULL,
	AUTEUR varchar(100) NOT NULL,
	VALEUR int,
	DATEPUB date,
	ETAT varchar(30),
	RESUME TEXT
);

CREATE TABLE LIVREDEP (
	IDLIVRE INTEGER NOT NULL,
	IDUSER INTEGER NOT NULL,
	PRIMARY KEY(IDLIVRE,IDUSER),
	FOREIGN KEY (IDLIVRE) REFERENCES LIVRE(ID),
	FOREIGN KEY (IDUSER) REFERENCES USER(ID)
);

CREATE TABLE LIVRESOU (
	NOMLIVRE varchar(100) NOT NULL,
	IDUSER INTEGER NOT NULL,
	PRIMARY KEY(NOMLIVRE,IDUSER),
	FOREIGN KEY (IDUSER) REFERENCES USER(ID)
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


