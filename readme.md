# Master - Slave with MySql in Docker.
## Install and setup docker on your laptop

https://docs.docker.com/engine/install/ubuntu/

## Create network and 2 container for Master and Slave -> run it
```sh
docker-compose up -d
```

## Open Mysql Workbrench and Create 2 Connection

### Master

| hostname | port | connection name |
| ------ | ------ | ------ |
| 172.20.10.5 | 3307 | master |


### Slave

| hostname | port | connection name |
| ------ | ------ | ------ |
| 172.20.10.5 | 3308 | slave |


## On each connection run below queries

### Master connection
```sh
CREATE USER 'repl'@'%' IDENTIFIED WITH mysql_native_password BY  'Dai2001vd';

GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
flush privileges;
-- flush table with read lock;
SHOW MASTER STATUS;
```
remember binlog file and position in the result, use them in Slave connection



### Slave connection
```sh
CREATE USER 'repl'@'%' identified  by 'Dai2001vd';

SET GLOBAL server_id=2;
stop replica;
change replication source to
	source_host='172.20.10.5',
    source_port=3307,
    source_user='repl',
    source_password='Dai2001vd',
    source_log_file='binlog.000002',
    source_log_pos=820;
start replica;

show replica status;
```
If replica_status : Yes    and replica_IO: Yes. You're successfully.
Else check again (note in username password create in slave and master is the same)

## Stop and remove network and container
```sh
docker-compose down
```
