-- =================== USERS ================ --

create table users (
	id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(80)
);

insert into users (first_name, last_name, email) 
values 	('Camilo', 'Rodríguez', 'camilo@gmail.com'),
		('Juan', 'Romero', 'romero@gmail.com'),
		('Rodrigo', 'Belalcazar', 'rodrigobelalcazar@gmail.com');

select * from users;



-- =================== POSTS ================ -- 

create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(100),
	text text
);

insert into posts (creator_id, title, text) 
values	(2, 'Inspiración de hoy', 'No todo lo que brilla es oro'),
		(2, 'Papas fritas', 'Pelar las papas, lavarlas, hechar en aceite hirviendo'),
		(1, 'Mis mascotas', 'Son 5 hermosos peludos que no hacen sino sacarme sonrisas'),
		(3, 'Acción Rampage', 'Una película que te embolberá en su historia llena de emociones y eventos catastróficos'),
		(3, 'Locos por el anime', 'Anime Center la mejor app de play store para ver anime');

select * from posts;



-- =================== LIKES ================ --

create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);


insert into likes (user_id, post_id)
values 	(1, 2),
		(1, 4),
		(2, 3),
		(3, 3),
		(3, 1);

select * from likes;



-- =================== POSTS - CREATOR_ID ================ --

select * from posts inner join users
on posts.creator_id = users.id;



-- =================== POSTS - LIKES ================ --

select * from posts inner join likes
on posts.id = likes.post_id inner join users
on users.id = likes.user_id;



