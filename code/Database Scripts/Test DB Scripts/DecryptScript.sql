use testdatabase;

select idUser, userName, userType, replace(cast(aes_decrypt(password, 'key1') as char(100)), salt, ''), salt from user; 