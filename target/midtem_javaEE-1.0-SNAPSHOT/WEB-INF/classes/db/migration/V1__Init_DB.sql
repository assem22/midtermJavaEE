create table test (
    isbn serial,
    author varchar(256) not null,
    title varchar(256) not null,
    primary key (isbn)
);
