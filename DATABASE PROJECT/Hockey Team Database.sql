CREATE TABLE people(
     peopleID    int  NOT NULL,
     firstName   text NOT NULL,
     lastName 	 text NOT NULL,
     dateOfBirth date NOT NULL,
   PRIMARY KEY(peopleID)
);

CREATE TABLE coaches(
     peopleID       int  NOT NULL REFERENCES people(peopleID),
     coachingTitle  text NOT NULL,
     yearsWithTeam  int  NOT NULL, 
   PRIMARY KEY(peopleID)
);

CREATE TABLE players(
     peopleID       int  NOT NULL REFERENCES people(peopleID),
     number         int  NOT NULL UNIQUE CHECK (number != 99),
     position	    text NOT NULL,
     heightInches   int  NOT NULL,
     weightLbs      int  NOT NULL,
   PRIMARY KEY(peopleID, number)
);

CREATE TABLE fdstats(
     peopleID	    	 int  	 NOT NULL REFERENCES people(peopleID),
     gamesPlayed    	 int  	 NOT NULL,
     goals          	 int  	 NOT NULL,
     assists 	    	 int  	 NOT NULL,
     points              int  	 NOT NULL,
     plusMinus		 int     NOT NULL,
     penaltiesInMinutes	 int  	 NOT NULL,
     powerPlayGoals	 int  	 NOT NULL,
     shorthandedGoals	 int  	 NOT NULL,
     gameWinningGoals    int  	 NOT NULL,
     shotsOnGoal         int     NOT NULL,
     shootingPercentage  decimal NOT NULL,
     averageTimeOnIce    text    NOT NULL,
   PRIMARY KEY(peopleID)
);
     
CREATE TABLE goaliestats(
     peopleID	    	 int  	 NOT NULL REFERENCES people(peopleID),
     gamesPlayed    	 int  	 NOT NULL,
     gamesStarted	 int     NOT NULL,
     minutesPlayed	 int     NOT NULL,
     goalsAgainstAverage decimal NOT NULL,
     wins 	    	 int  	 NOT NULL,
     losses              int  	 NOT NULL,
     overtimeLosses      int  	 NOT NULL,
     shutouts		 int  	 NOT NULL,
     shotsAgainst	 int  	 NOT NULL,
     goalsAgainst	 int  	 NOT NULL,
     savePercentage	 decimal NOT NULL,
     goals	         int     NOT NULL,
     assists		 int     NOT NULL,
     penaltiesInMinutes  int     NOT NULL,
   PRIMARY KEY(peopleID)
);

CREATE TABLE contracts(
     contractID        int   NOT NULL,
     peopleID	       int   NOT NULL REFERENCES people(peopleID),
     contractYears     int   NOT NULL,
     contractSalaryUSD text  NOT NULL,
     endYear           int   NOT NULL,
   PRIMARY KEY(contractID, peopleID)
);

CREATE TABLE captaincy(
     peopleID         int  NOT NULL REFERENCES people(peopleID),
     captaincyTitle   text NOT NULL,
   PRIMARY KEY(peopleID, captaincyTitle)
);

CREATE TABLE startingroster(
     lineID        text  NOT NULL,	
     number        int   NOT NULL REFERENCES players(number), 
   PRIMARY KEY(lineID, number)
);


INSERT INTO PEOPLE VALUES(00, 'Peter', 'DeBoer', '1968-06-13');
INSERT INTO PEOPLE VALUES(1, 'Dave', 'Barr', '1960-11-30');
INSERT INTO PEOPLE VALUES(2, 'Scott', 'Stevens', '1964-04-01');

INSERT INTO PEOPLE VALUES(3, 'Jaromir', 'Jagr', '1972-02-15');
INSERT INTO PEOPLE VALUES(4, 'Patrik', 'Elias', '1976-06-12');
INSERT INTO PEOPLE VALUES(5, 'Travis', 'Zajac', '1985-11-03');
INSERT INTO PEOPLE VALUES(6, 'Adam', 'Henrique', '1988-05-12');
INSERT INTO PEOPLE VALUES(7, 'Marek', 'Zidlicky', '1980-01-01');
INSERT INTO PEOPLE VALUES(8, 'Andy', 'Greene', '1982-08-30');
INSERT INTO PEOPLE VALUES(9, 'Eric', 'Gelinas', '1990-12-15');
INSERT INTO PEOPLE VALUES(10, 'Ryane', 'Clowe', '1984-03-24');
INSERT INTO PEOPLE VALUES(11, 'Tuomo', 'Ruutu', '1983-07-14');
INSERT INTO PEOPLE VALUES(12, 'Jon', 'Merrill', '1991-05-30');
INSERT INTO PEOPLE VALUES(13, 'Cory', 'Schnieder', '1987-06-07');
INSERT INTO PEOPLE VALUES(14, 'Martin', 'Brodeur', '1972-04-29');


INSERT INTO COACHES VALUES(0, 'Head Coach', 3);
INSERT INTO COACHES VALUES(1, 'Assistant Coach', 2);
INSERT INTO COACHES VALUES(2, 'Assistant Coach', 3);

INSERT INTO PLAYERS VALUES(3, 68, 'Left Wing', 74, 240);
INSERT INTO PLAYERS VALUES(4, 26, 'Left Wing', 72, 220);
INSERT INTO PLAYERS VALUES(5, 19, 'Center', 73, 190);
INSERT INTO PLAYERS VALUES(6, 14, 'Center', 72, 195);
INSERT INTO PLAYERS VALUES(7, 2, 'Defence', 73, 200);
INSERT INTO PLAYERS VALUES(8, 6, 'Defence', 74, 210);
INSERT INTO PLAYERS VALUES(9, 22, 'Defence', 72, 230);
INSERT INTO PLAYERS VALUES(10, 29, 'Right Wing', 72, 190);
INSERT INTO PLAYERS VALUES(11, 15, 'Right Wing', 73, 195);
INSERT INTO PLAYERS VALUES(12, 34, 'Defence', 74, 210);
INSERT INTO PLAYERS VALUES(13, 35, 'Goalie', 73, 190);
INSERT INTO PLAYERS VALUES(14, 30, 'Goalie', 73, 220);


INSERT INTO FDSTATS VALUES(3, 20, 15, 12, 27, 5, 4, 2, 0, 1, 43, 34.9, '19:30');
INSERT INTO FDSTATS VALUES(4, 20, 11, 10, 21, 4, 4, 2, 0, 2, 35, 36.9, '19:21');
INSERT INTO FDSTATS VALUES(5, 19, 6, 13, 19, 3, 4, 2, 0, 0, 55, 32.9, '15:24');
INSERT INTO FDSTATS VALUES(6, 18, 1, 7, 8, 5, 1, 2, 0, 0, 17, 24.9, '16:45');
INSERT INTO FDSTATS VALUES(7, 20, 8, 1, 9, 5, 2, 2, 0, 0, 12, 55.9, '19:11');
INSERT INTO FDSTATS VALUES(8, 17, 11, 1, 12, 5, 2, 2, 0, 2, 11, 66.6, '18:40');
INSERT INTO FDSTATS VALUES(9, 20, 2, 5, 7, 1, 4, 1, 0, 1, 4, 37.5, '12:43');
INSERT INTO FDSTATS VALUES(10, 20, 0, 7, 7, 0, 4, 1, 0, 1, 23, 33.5, '17:22');
INSERT INTO FDSTATS VALUES(11, 19, 2, 2, 4, 4, 4, 2, 0, 0, 41, 17.5, '19:23');
INSERT INTO FDSTATS VALUES(12, 18, 1, 4, 5, 3, 4, 2, 0, 1, 5, 12.1, '19:44');


INSERT INTO GOALIESTATS VALUES(13, 15, 15, 1100, 1.50, 12, 3, 0, 4, 400, 16, .960, 0, 1, 0);  
INSERT INTO GOALIESTATS VALUES(14, 5, 5, 900, 1.90, 5, 0, 0, 1, 250, 22, .912, 1, 2, 0);


INSERT INTO CONTRACTS VALUES(0, 3, 3, 1000000, 2015);
INSERT INTO CONTRACTS VALUES(1, 4, 4, 1800000, 2015);
INSERT INTO CONTRACTS VALUES(2, 5, 3, 2000000, 2016);
INSERT INTO CONTRACTS VALUES(3, 6, 2, 4000000, 2017);
INSERT INTO CONTRACTS VALUES(4, 7, 6, 300000, 2018);
INSERT INTO CONTRACTS VALUES(5, 8, 5, 2500000, 2014);
INSERT INTO CONTRACTS VALUES(6, 9, 6, 1000000, 2015);
INSERT INTO CONTRACTS VALUES(7, 10, 2, 975000, 2014);
INSERT INTO CONTRACTS VALUES(8, 11, 1, 1300000, 2016);
INSERT INTO CONTRACTS VALUES(9, 12, 1, 1000000, 2020);

INSERT INTO CAPTAINCY VALUES(03, 'Captain');
INSERT INTO CAPTAINCY VALUES(05, 'Alternate');
INSERT INTO CAPTAINCY VALUES(11, 'Alternate');

INSERT INTO STARTINGROSTER VALUES(1, 68);
INSERT INTO STARTINGROSTER VALUES(1, 19);
INSERT INTO STARTINGROSTER VALUES(1, 26);
INSERT INTO STARTINGROSTER VALUES(2, 14);
INSERT INTO STARTINGROSTER VALUES(2, 15);
INSERT INTO STARTINGROSTER VALUES(2, 29);
INSERT INTO STARTINGROSTER VALUES(3, 22);
INSERT INTO STARTINGROSTER VALUES(3, 2);
INSERT INTO STARTINGROSTER VALUES(4, 6);
INSERT INTO STARTINGROSTER VALUES(4, 34);
INSERT INTO STARTINGROSTER VALUES(5, 35);


select * from people
select * from coaches
select * from players
select * from fdstats
select * from goaliestats
select * from contracts
select * from captaincy
select * from startingroster

CREATE VIEW topScorers AS
	SELECT fdstats.peopleID,
	       fdstats.goals
	FROM fdstats
      	WHERE fdstats.goals > (SELECT AVG(goals) FROM fdstats) 
	ORDER BY goals desc;

select * from topScorers
