USE MASTER
go
DROP DATABASE IF EXISTS edunovawp4;
go
CREATE DATABASE edunovawp4;
go 

USE edunovawp4;

CREATE TABLE smjerovi (
   sifra int not null primary key identity(1,1), 
   naziv varchar(255) not null,
   trajanje int, 
   cijena decimal(18,2), 
   izvodi_se_od datetime,
   verificiran bit
);


CREATE TABLE grupe(
	sifra int not null primary key identity(1,1),  
	naziv varchar(255) not null,
	smijer int not null, 
	predavac varchar(255), 
	maxpolaznika int not null
);

CREATE TABLE clanovi(
	grupa int not null,
	polaznik int not null
);

CREATE TABLE polaznici (
    sifra int not null primary key identity(1,1), 
	ime varchar(225) not null,
	prezime varchar(255) not null,
	oib char(11),
	email varchar(255) not null,
);


alter table grupe add foreign key (smijer) references smjerovi(sifra);
alter table clanovi add foreign key (grupa) references grupe(sifra);
alter table clanovi add foreign key (polaznik) references polaznici(sifra);

