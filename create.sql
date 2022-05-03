drop schema if exists vcpl cascade;
create schema vcpl;
set schema 'vcpl';


CREATE TABLE _membres(
    membreID        int,
    nomMembre       varchar(50) NOT NULL,
    prenomMembre    varchar(50) NOT NULL,
    age             int NOT NULL,
    email           varchar(100),
    tel             varchar(20),
    dateArrive      date NOT NULL,
    anniversaire    date NOT NULL,
    PRIMARY KEY (membreID)
);




CREATE TABLE _categories(
    libelleCat      varchar(20),
    PRIMARY KEY (libelleCat)
);





CREATE TABLE _salaries(
    salarieID       int,
    nomPoste        varchar(50) NOT NULL,
    membreID        int,
    salaire         numeric(10,2) NOT NULL,
    PRIMARY KEY (salarieID)
);
ALTER TABLE _salaries
    ADD CONSTRAINT fk_salaries_membres FOREIGN KEY (membreID)
        REFERENCES _membres(membreID);




CREATE TABLE _postes(
    nomPoste        varchar(50),
    PRIMARY KEY (nomPoste)
);
ALTER TABLE _salaries
    ADD CONSTRAINT fk_salaries_postes FOREIGN KEY (nomPoste)
        REFERENCES _postes(nomPoste);


CREATE TABLE _coureurs(
    coureurID       int,
    libelleCat      varchar(50) NOT NULL,
    membreID        int NOT NULL,
    palier          int,
    PRIMARY KEY (coureurID)
);
ALTER TABLE _coureurs
    ADD CONSTRAINT fk1_coureurs_categories FOREIGN KEY (libelleCat)
        REFERENCES _categories(libelleCat);
ALTER TABLE _coureurs
    ADD CONSTRAINT fk_coureurs_membres FOREIGN KEY (membreID)
        REFERENCES _membres(membreID);



CREATE TABLE _palmares(
    datePodium      date,
    coureurID       int NOT NULL,
    courseID        int NOT NULL,
    victoire        boolean NOT NULL,
    deuxieme        boolean NOT NULL,
    troisieme       boolean NOT NULL,
    PRIMARY KEY (datePodium)
);
ALTER TABLE _palmares
    ADD CONSTRAINT fk_palmares_coureurs FOREIGN KEY (coureurID)
        REFERENCES _coureurs(coureurID);


CREATE TABLE _courses(
    courseID        int,
    lieu            varchar(50) NOT NULL,
    trophee         boolean NOT NULL,
    date            date NOT NULL,
    PRIMARY KEY (courseID)
);
ALTER TABLE _palmares
    ADD CONSTRAINT fk_palmares_courses FOREIGN KEY (courseID)
        REFERENCES _courses(courseID);


INSERT INTO _categories(libelleCat) VALUES ('Prélicenciés');
INSERT INTO _categories(libelleCat) VALUES ('Poussins');
INSERT INTO _categories(libelleCat) VALUES ('Pupilles');
INSERT INTO _categories(libelleCat) VALUES ('Benjamins');
INSERT INTO _categories(libelleCat) VALUES ('Cadets');
INSERT INTO _categories(libelleCat) VALUES ('Junior');
INSERT INTO _categories(libelleCat) VALUES ('Pass Open');
INSERT INTO _categories(libelleCat) VALUES ('3ème Catégorie');
INSERT INTO _categories(libelleCat) VALUES ('2ème Catégorie');
INSERT INTO _categories(libelleCat) VALUES ('1re Catégorie');
INSERT INTO _categories(libelleCat) VALUES ('DN1');

INSERT INTO _membres(membreID, nomMembre, prenomMembre, age, email, tel, dateArrive, anniversaire, libelleCat)  VALUES(1, 'ALLENO', 'Thomas', 28, 'thomas.alleno@gmail.com', '+33 6 30 14 31 70', '10-03-2019', null, '3ème catégorie' );







