DELETE FROM `mysql`.`user` WHERE `User` <> 'root';
UPDATE `mysql`.`user` SET `Host` = '%', `password_expired` = 'N', `authentication_string` = PASSWORD('root') WHERE `User` = 'root';
FLUSH PRIVILEGES;
