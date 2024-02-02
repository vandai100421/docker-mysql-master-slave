
CREATE USER 'repl'@'%' IDENTIFIED WITH mysql_native_password BY  'Dai2001vd';

GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
flush privileges;
-- flush table with read lock;
SHOW MASTER STATUS;

show grants for repl;

select * from mysql.user;

DROP USER 'repl'@'%';

SHOW FULL PROCESSLIST;
