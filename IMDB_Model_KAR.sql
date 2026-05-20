/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      IMDB_Model_Grp7.DM1
 *
 * Date Created : Sunday, December 07, 2025 01:44:03
 * Target DBMS : Databricks
 */

/* 
 * TABLE: BRIDGE_Akas 
 */

CREATE TABLE BRIDGE_Akas
(
    TitleAkasKey       decimal(10, 0)      NOT NULL,
    TitleKey           decimal(10, 0)      NOT NULL,
    RegionKey          decimal(10, 0)      NOT NULL,
    LanguageKey        decimal(10, 0)      NOT NULL,
    AkasTitle          string,
    IsOriginalTitle    decimal(10, 0),
    CONSTRAINT PK13 PRIMARY KEY (TitleAkasKey, TitleKey, RegionKey, LanguageKey) 
)
;

/* 
 * TABLE: BRIDGE_PROFESSION 
 */

CREATE TABLE BRIDGE_PROFESSION
(
    titleProfessionKey    decimal(10, 0)      NOT NULL,
    ProfessionKey         decimal(10, 0)      NOT NULL,
    NameKey               decimal(10, 0)      NOT NULL,
    IsPrimary             decimal(10, 0),
    CONSTRAINT PK15 PRIMARY KEY (titleProfessionKey, ProfessionKey, NameKey) 
)
;

/* 
 * TABLE: Bridge_Title_Crew 
 */

CREATE TABLE Bridge_Title_Crew
(
    titleCrewKey    decimal(10, 0)      NOT NULL,
    CrewKey         decimal(10, 0)      NOT NULL,
    TitleKey        decimal(10, 0)      NOT NULL,
    NameKey         decimal(10, 0)      NOT NULL,
    CONSTRAINT PK17 PRIMARY KEY (titleCrewKey, CrewKey, TitleKey, NameKey) 
)
;

/* 
 * TABLE: BRIDGE_TITLE_GENRE 
 */

CREATE TABLE BRIDGE_TITLE_GENRE
(
    TitleGenreKey    decimal(10, 0)      NOT NULL,
    TitleKey         decimal(10, 0)      NOT NULL,
    GenreKey         decimal(10, 0)      NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (TitleGenreKey, TitleKey, GenreKey) 
)
;

/* 
 * TABLE: DIM_Crew 
 */

CREATE TABLE DIM_Crew
(
    CrewKey      decimal(10, 0)      NOT NULL,
    Crew_Role    string,
    CONSTRAINT PK16 PRIMARY KEY (CrewKey) 
)
;

/* 
 * TABLE: DIM_Genre 
 */

CREATE TABLE DIM_Genre
(
    GenreKey     decimal(10, 0)      NOT NULL,
    GenreName    string,
    CONSTRAINT PK10 PRIMARY KEY (GenreKey) 
)
;

/* 
 * TABLE: DIM_Language 
 */

CREATE TABLE DIM_Language
(
    LanguageKey            decimal(10, 0)      NOT NULL,
    LanguageCode           string,
    LanguageDescription    string,
    CONSTRAINT PK8 PRIMARY KEY (LanguageKey) 
)
;

/* 
 * TABLE: DIM_NAME 
 */

CREATE TABLE DIM_NAME
(
    NameKey        decimal(10, 0)      NOT NULL,
    NCONST         string,
    PrimaryName    string,
    BirthYear      string,
    DeathYear      string,
    CONSTRAINT PK1 PRIMARY KEY (NameKey) 
)
;

/* 
 * TABLE: DIM_Principals 
 */

CREATE TABLE DIM_Principals
(
    PrincipalKey    decimal(10, 0)      NOT NULL,
    NameKey         decimal(10, 0)      NOT NULL,
    TitleKey        decimal(10, 0)      NOT NULL,
    Ordering        int,
    Category        string,
    Job             string,
    Characters      string,
    CONSTRAINT PK4 PRIMARY KEY (PrincipalKey, NameKey, TitleKey) 
)
;

/* 
 * TABLE: DIM_Profession 
 */

CREATE TABLE DIM_Profession
(
    ProfessionKey    decimal(10, 0)      NOT NULL,
    Profession       string,
    CONSTRAINT PK2 PRIMARY KEY (ProfessionKey) 
)
;

/* 
 * TABLE: DIM_Region 
 */

CREATE TABLE DIM_Region
(
    RegionKey            decimal(10, 0)      NOT NULL,
    RegionCode           string              NOT NULL,
    RegionDescription    string,
    CONSTRAINT PK11 PRIMARY KEY (RegionKey) 
)
;

/* 
 * TABLE: DIM_Title 
 */

CREATE TABLE DIM_Title
(
    TitleKey          decimal(10, 0)      NOT NULL,
    Tconst            string,
    TitleType         string,
    PrimaryTitle      string,
    OriginalTitle     string,
    IsAdult           decimal(10, 0),
    ReleaseYear       string,
    RuntimeMinutes    string,
    CONSTRAINT PK9 PRIMARY KEY (TitleKey) 
)
;

/* 
 * TABLE: FACT_Episodes 
 */

CREATE TABLE FACT_Episodes
(
    EpisodeKey       decimal(10, 0)      NOT NULL,
    TitleKey         decimal(10, 0)      NOT NULL,
    SeasonNumber     string,
    EpisodeNumber    string,
    CONSTRAINT PK3 PRIMARY KEY (EpisodeKey, TitleKey) 
)
;

/* 
 * TABLE: FACT_Title_Ratings 
 */

CREATE TABLE FACT_Title_Ratings
(
    RatingKey        decimal(10, 0)      NOT NULL,
    TitleKey         decimal(10, 0)      NOT NULL,
    AverageRating    float,
    NumVotes         int,
    CONSTRAINT PK12 PRIMARY KEY (RatingKey, TitleKey) 
)
;

/* 
 * TABLE: BRIDGE_Akas 
 */

ALTER TABLE BRIDGE_Akas ADD CONSTRAINT RefDIM_Title11 
    FOREIGN KEY (TitleKey)
    REFERENCES DIM_Title
;

ALTER TABLE BRIDGE_Akas ADD CONSTRAINT RefDIM_Region12 
    FOREIGN KEY (RegionKey)
    REFERENCES DIM_Region
;

ALTER TABLE BRIDGE_Akas ADD CONSTRAINT RefDIM_Language13 
    FOREIGN KEY (LanguageKey)
    REFERENCES DIM_Language
;


/* 
 * TABLE: BRIDGE_PROFESSION 
 */

ALTER TABLE BRIDGE_PROFESSION ADD CONSTRAINT RefDIM_NAME1 
    FOREIGN KEY (NameKey)
    REFERENCES DIM_NAME
;

ALTER TABLE BRIDGE_PROFESSION ADD CONSTRAINT RefDIM_Profession2 
    FOREIGN KEY (ProfessionKey)
    REFERENCES DIM_Profession
;


/* 
 * TABLE: Bridge_Title_Crew 
 */

ALTER TABLE Bridge_Title_Crew ADD CONSTRAINT RefDIM_Crew14 
    FOREIGN KEY (CrewKey)
    REFERENCES DIM_Crew
;

ALTER TABLE Bridge_Title_Crew ADD CONSTRAINT RefDIM_Title15 
    FOREIGN KEY (TitleKey)
    REFERENCES DIM_Title
;

ALTER TABLE Bridge_Title_Crew ADD CONSTRAINT RefDIM_NAME16 
    FOREIGN KEY (NameKey)
    REFERENCES DIM_NAME
;


/* 
 * TABLE: BRIDGE_TITLE_GENRE 
 */

ALTER TABLE BRIDGE_TITLE_GENRE ADD CONSTRAINT RefDIM_Genre7 
    FOREIGN KEY (GenreKey)
    REFERENCES DIM_Genre
;

ALTER TABLE BRIDGE_TITLE_GENRE ADD CONSTRAINT RefDIM_Title8 
    FOREIGN KEY (TitleKey)
    REFERENCES DIM_Title
;


/* 
 * TABLE: DIM_Principals 
 */

ALTER TABLE DIM_Principals ADD CONSTRAINT RefDIM_NAME5 
    FOREIGN KEY (NameKey)
    REFERENCES DIM_NAME
;

ALTER TABLE DIM_Principals ADD CONSTRAINT RefDIM_Title6 
    FOREIGN KEY (TitleKey)
    REFERENCES DIM_Title
;


/* 
 * TABLE: FACT_Episodes 
 */

ALTER TABLE FACT_Episodes ADD CONSTRAINT RefDIM_Title10 
    FOREIGN KEY (TitleKey)
    REFERENCES DIM_Title
;


/* 
 * TABLE: FACT_Title_Ratings 
 */

ALTER TABLE FACT_Title_Ratings ADD CONSTRAINT RefDIM_Title9 
    FOREIGN KEY (TitleKey)
    REFERENCES DIM_Title
;


