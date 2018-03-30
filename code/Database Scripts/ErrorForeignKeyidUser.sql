alter table testdatabase.error
add constraint idUser
 foreign key (idError)
 references testdatabase.user (idUser);

