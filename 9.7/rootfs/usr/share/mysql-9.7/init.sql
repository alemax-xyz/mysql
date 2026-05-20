RENAME USER 'root'@'localhost' TO 'root'@'%';
ALTER USER 'root'@'%' IDENTIFIED WITH caching_sha2_password BY 'root';
