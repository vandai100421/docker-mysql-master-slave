CREATE USER 'repl'@'%' identified  by 'Dai2001vd';

SET GLOBAL server_id=2;
stop replica;
change replication source to
	source_host='172.20.10.5',
    source_port=3307,
    source_user='repl',
    source_password='Dai2001vd',
    source_log_file='binlog.000002',
    source_log_pos=1334;
start replica;

show replica status;

select * from mysql.user;
