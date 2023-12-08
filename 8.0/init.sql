UPDATE `mysql`.`user` SET `Host` = '%', `password_expired` = 'N', `plugin`='mysql_native_password', `authentication_string` = CONCAT('*', UPPER(SHA1(UNHEX(SHA1('root'))))) WHERE `User` = 'root';
