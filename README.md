# ` 1) Introduction :`
With the advent of computers, the implementation of a data storage strategy quickly became essential. The first computer programs stored information in a linear fashion, which later posed problems for searching and calculating the recorded information. Researchers then developed models allowing to represent on computer real elements and to add attributes to them, to be able to arrange them, to sort them.

It is Edgar F. Codd who in June 1970 wrote an article describing a relational data model.
relational data model. This model was then used as a reference and IBM developed a language, the Structured English Query Language ("SEQUEL") to implement the
Codd model.

In 1979, Relational Software, Inc. (now Oracle Corporation) introduced the first commercially available version of SQL. Subsequently, SQL was standardized by ANSI and ISO in 1986 and 1987. The objective of the mini-project is to become familiar with the modeling of a Database Management System based on a Database Management System from a specification. This one describes the needs for the creation of a company's time management system. The model will then be concretized by its implementation in a PostGreSQL database, so that we can become familiar with SQL queries.


# ` 1) Construction of the conceptual entity-association diagram :`

## Entity listing :

- Department
- Department agenda
- Department activity
- Minutes
- Absence
- Employeers
- Agenda
- Activities
- Warnings
- Department and verbal activities

## Attributes listing
 - Department :
    
        num           --> department identifier
        name          --> name of the department
        numChief      --> points to the head of the department
        numAgendaDept --> points to the department agenda

 - Agendadept :

        numAgenda     --> department agenda identifier
        dateMAJ       --> date of last modification of the agenda

 - Activitydept :
 
        numAct          --> identifier of the departmental activity
        typeD           --> meeting / seminar / course / mini project
        descript        --> precise description
        dateAct         --> date of the activity
        hStart          --> time of the activity
        hEnd            --> time of the activity
        dateCreation    --> date of creation of the activity
        creator         --> creator of the activity
        numAgenda       --> points to the agenda to which the activity belongs