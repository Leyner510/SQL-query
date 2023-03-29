create table if not exists Genre(
	Genre_id SERIAL primary key,
	Genre_name VARCHAR(60)
);

create table if not exists Executor(
	Executor_id SERIAL primary key,
	Executor_name VARCHAR(80)
);

create table if not exists Genre_executor (
	Genre_id INTEGER references Genre(Genre_id),
	Executor_id INTEGER references Executor(Executor_id),
	constraint pk primary key (Genre_id, Executor_id)	
);

create table if not exists Album (
	Album_id SERIAL primary  key,
	Album_name VARCHAR(60),
	production_year INTEGER
);

create table if not exists Album_executor (
	Album_id INTEGER references Album(Album_id),
	Executor_id INTEGER references Executor(Executor_id),
	constraint pk2 primary key (Album_id, Executor_id)
);

create table if not exists Track (
	Track_id SERIAL primary key,
	Track_name VARCHAR(60),
	duration INTEGER,
	Album_id INTEGER references Album(Album_id)
);

create table if not exists Collection (
	Collection_id SERIAL primary key,
	Collection_name VARCHAR(80),
	Collection_year INTEGER
);

create table if not exists Track_collection (
	Track_id INTEGER references Track(Track_id),
	Collection_id INTEGER references Collection(Collection_id),
	constraint pk3 primary key (Track_id, Collection_id)
);

