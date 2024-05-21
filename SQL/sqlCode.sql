use master;
go
drop database if exists timetracking;
go
create database timetracking;
go

use timetracking;

create table person(
	id int not null primary key identity(1,1),
	firstname varchar(255) not null,
	lastname varchar(255) not null, 
	email varchar(255) not null,
	password varchar(18) not null,
	language varchar(20)
);

create table project(
	id int not null primary key identity(1,1),
	user_created int not null,
	date_created datetime,
	name varchar(255) not null,
	description text
);

create table phase(
	id int not null primary key identity(1,1),
	project int not null, 
	date_created datetime not null,
	description text,
	phase_number int not null, 
	amount_paid decimal(18,2)
);

create table category(
	id int not null primary key identity(1,1),
	name varchar(255) not null,
	phase int not null, 
	price_per_hour decimal(18,2)
);

create table time(
	id int not null primary key identity(1,1),
	category int not null,
	time_in_minutes int not null, 
	title varchar(255) not null,
	description text
);

alter table time add foreign key (category) references category(id);
alter table category add foreign key (phase) references phase(id);
alter table phase add foreign key (project) references project(id);
alter table project add foreign key (user_created) references person(id);