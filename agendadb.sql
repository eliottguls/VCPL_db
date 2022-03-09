drop schema if exists agenda cascade;
create schema agenda;
set schema 'agenda';


CREATE TABLE PROCESVERBAL(
    NumProcesV    SERIAL, 
    resum         VARCHAR(1024) NOT NULL,
    PRIMARY KEY(NumProcesV));

CREATE TABLE AGENDADEPT(
    numAgenda     SERIAL,
    dateMAJ       DATE NOT NULL,
    PRIMARY KEY(numAgenda));

CREATE TABLE DEPARTEMENT(
    num_dept      SERIAL,
    nom           VARCHAR(40) NOT NULL,
    numChef       INTEGER,
    numAgendaDept INTEGER NOT NULL,
    PRIMARY KEY   (num_dept), 
    FOREIGN KEY   (numAgendaDept) References AGENDADEPT);
    


CREATE TABLE EMPLOYE(
    numEmploye    SERIAL,
    nom           VARCHAR(30) NOT NULL,
    prenom        VARCHAR(20), 
    telIntern     VARCHAR(14), 
    email         VARCHAR(40),
    niveau        INTEGER, 
    numDept       INTEGER NOT NULL, 
    PRIMARY KEY   (numEmploye),
    FOREIGN KEY   (numDept) References DEPARTEMENT );
    
ALTER TABLE DEPARTEMENT 
  ADD CONSTRAINT dept_foreign FOREIGN KEY(numChef) 
  References EMPLOYE;

CREATE TABLE ACTIVITESDEPT(
    numAct        SERIAL,
    typeD         VARCHAR(20) NOT NULL,
    descript      VARCHAR(1024),
    dateAct       DATE NOT NULL,
    hDebut        DATE,
    hFin          DATE,
    dateCreation  DATE,
    createur      VARCHAR(20) NOT NULL, 
    numAgenda     INTEGER NOT NULL,
    PRIMARY KEY   (numAct),
    FOREIGN KEY   (numAgenda) References AGENDADEPT );

CREATE TABLE ACTDEPTVERBAL(
    numAct        SERIAL,
    numProcesV    SERIAL,
    PRIMARY KEY   (numAct,numProcesV),
    FOREIGN KEY   (numAct) References ACTIVITESDEPT, 
    FOREIGN KEY   (numProcesV) References PROCESVERBAL);

CREATE TABLE AGENDA(
    numAgenda     SERIAL,
    dateCreation  DATE,
    numEmploye    INTEGER NOT NULL,
    PRIMARY KEY   (numAgenda),
    FOREIGN KEY   (numEmploye) References EMPLOYE );

CREATE TABLE ABSENT(
    numEmploye    SERIAL,
    numActDept    SERIAL,
    motif         VARCHAR(1024),
    PRIMARY KEY   (numEmploye, numActDept),
    FOREIGN KEY   (numEmploye) References EMPLOYE,
    FOREIGN KEY   (numActDept) References ACTIVITESDEPT);

CREATE TABLE ACTIVITES(
    numActivite   SERIAL,
    typeA         VARCHAR(30) NOT NULL,
    description   VARCHAR(1024),
    dateAct       DATE NOT NULL,
    hDebut        DATE,
    hFin          DATE,
    dateCreation  DATE,
    createur      VARCHAR(20) NOT NULL,
    visible       INTEGER,
    numAgenda     INTEGER NOT NULL, 
    PRIMARY KEY   (numActivite), 
    FOREIGN KEY   (numAgenda) References AGENDA);

CREATE TABLE ALERTES(
    type          CHAR(8), 
    delais        DATE, 
    numActivite   INTEGER, 
    PRIMARY KEY   (type,delais,numActivite), 
    FOREIGN KEY   (numActivite) References ACTIVITES);
    

INSERT INTO AGENDADEPT VALUES (1, '05-03-2022');
INSERT INTO AGENDADEPT VALUES (agendadept_numagenda_seq.nextVal, to_date(sysdate,'dd-mm-yy'));
INSERT INTO DEPARTEMENT VALUES(seqDepartement.nextVal, 'Informatique', NULL,agendadept_numagenda_seq.currval);
