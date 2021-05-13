create table admins (
    admin_id serial,
    admin_username varchar(255),
    admin_password varchar(255),
    primary key (admin_id)
);

create table movies (
    movie_id serial,
    movie_name varchar(255),
    movie_price float,
    movie_year int,
    primary key (movie_id)
);

create table users (
    user_id serial,
    username varchar(255),
    user_password varchar(255),
    user_email varchar(255),
    primary key (user_id)
);

create table tickets (
    ticket_id serial,
    amount int,
    movie_name varchar(255),
    ticket_cost float,
    total_cost int,
    user_id int,
    primary key (ticket_id)
);
