use testdatabase;

create table if not exists user
	(idUser int unsigned not null auto_increment,
    userName varchar(20) default null,
    userType varchar(15) default null,
    password char(150) default null,
    salt varchar(20) default null,
    primary key (idUser)
    ) engine = Innodb default charset = latin1;

insert into user (userName, userType, password, salt)
	values ('Oliver', 'User', aes_encrypt(concat('password12', 'salt1'), 'key1'), 'salt1');
insert into user (userName, userType, password, salt)
	values ('Charlotte', 'User', aes_encrypt(concat('password12', 'salt2'), 'key1'), 'salt2');
insert into user (userName, userType, password, salt)
	values ('Jackson', 'Supervisor', aes_encrypt(concat('password12', 'salt3'), 'key1'), 'salt3');
insert into user (userName, userType, password, salt)
	values ('Chloe', 'Administrator', aes_encrypt(concat('password12', 'salt4'), 'key1'), 'salt4');

