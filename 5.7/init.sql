DELETE FROM mysql.user WHERE User <> 'root';
UPDATE mysql.user SET Host = '%' WHERE User = 'root';
