--Tyler Cavera--
--Create Script for Lab 9--

--People--

CREATE TABLE people (
   pid	        integer not null,
   firstname    char(10),
   lastname 	char(10),
   age		integer,
   primary key(pid)
);
 

--Astronauts--

CREATE TABLE astronauts (
   pid		integer not null references people(pid),
   yearsflying  integer not null,
   goldhandicap char(3),
   primary key(pid)
);


--Flight Control Operators--

CREATE TABLE flightcontroloperators (
   pid 		    integer not null references people(pid),
   chairpreference  char(10), 
   drinkpreference  char(15),
   primary key(pid)
);


--Engineers--

CREATE TABLE engineers (
   pid              integer not null references people(pid),
   degree	    char(15),
   favvideogame	    char(30),
   primary key(pid)
);


--Crew--

CREATE TABLE crew (
   pid		integer not null references astronauts(pid),
   scid		char(4) not null references spacecraft(scid),
   primary key(pid, scid)
);


--Spacecraft--

CREATE TABLE spacecraft (
   scid		char(4) not null,
   scname	char(30),
   tailnumber	integer,
   weighttons	integer,
   fueltype	char(15),
   crewcapacity integer,
   primary key(scid)
);


--Systems--

CREATE TABLE systems (
   sysid	integer not null,
   sysname      char(15),
   sysdesc	char(100),
   scid		char(4) not null references spacecraft(scid),
   primary key(sysid)
);


--Parts--

CREATE TABLE parts (
   ptsid     char(4) not null,
   pname     char(15),
   pdesc     char(50),
   sysid     integer not null references systems(sysid),
   primary key(ptsid)
);


--Suppliers--

CREATE TABLE suppliers (
   supname        char(20) not null,
   address        char(30),
   paymentterms   char(20),
   primary key(supname)
);


--Catalog--

CREATE TABLE catalog (
   supname   char(20) not null references suppliers(supname),
   ptsid     char(4) not null references parts(ptsid),
   primary key(supname, ptsid)
);





   
   