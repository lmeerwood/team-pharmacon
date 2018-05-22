use testdatabase;

create table errorEntries
	(idErrorEntries int unsigned not null auto_increment,
    userName varchar(20) default null,
    errorType varchar(45) default null,
    medicineType varchar(45) default null,
    entryDate timestamp(6), 
    primary key (idErrorEntries)
    ) engine = Innodb default charset = utf8;