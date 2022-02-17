create table if not exists Performers (
performer_id serial primary key,
name text not null
);
create table if not exists Musical_genres (
genre_id serial primary key,
genre varchar(50) unique
);
create table if not exists Albums (
album_id serial primary key,
album_title text not null,
release_date date not null,
number_of_tracks integer not null
);
create table if not exists Tracks (
track_id serial primary key,
songs_name text not null,
track_duration numeric (3,2),
album_id integer references Albums(album_id)
);
create table if not exists Songbooks (
songbook_id serial primary key,
songbook_title text not null,
release_date date not null,
number_of_tracks integer not null
);
alter table Songbooks drop column songbook_title;
alter table Songbooks add column songbook_title text unique;
create table if not exists Songbook_creation (
track_id integer references Tracks(track_id),
songbook_title text primary key references Songbooks(songbook_title)
);
create table if not exists Album_creation (
performer_id integer references Performers(performer_id),
album_id integer references Albums(album_id),
release_date date primary key
); 
alter table Performers drop column name;
alter table Performers add column name text unique;
create table if not exists Performances (
performance_id serial primary key,
name text references Performers(name),
genre text unique references Musical_genres(genre)
);
alter table Albums drop column number_of_tracks;
alter table Songbooks drop column number_of_tracks;
alter table Tracks alter column track_duration set data type numeric (4,2);
alter table Songbook_creation drop column songbook_title;
alter table Songbook_creation add column songbook_id integer references Songbooks(songbook_id);
alter table Songbook_creation add constraint Songbook_creation_PK primary key (track_id, songbook_id); 
alter table Album_creation drop column release_date;
alter table Album_creation add constraint Album_creation_PK primary key (performer_id, album_id);
alter table performances drop column name;
alter table performances drop column genre;
alter table performances add column performer_id integer references Performers(performer_id);
alter table performances add column genre_id integer references Musical_genres(genre_id);
alter table musical_genres drop constraint musical_genres_genre_key;
alter table performers drop constraint performers_name_key;
alter table songbooks drop constraint songbooks_songbook_title_key;

