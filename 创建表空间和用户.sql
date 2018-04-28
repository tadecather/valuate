Create tablespace ValuateSystem
Datafile 'D:\app\TAD\userdata\valuate.dbf'
size 50m 
autoextend on 
next 50m maxsize 10240m 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO;

Create user bysj Identified by bysj 
Default tablespace ValuateSystem
Temporary tablespace temp;
Grant connect,resource  to bysj;
Grant create table,create view to bysj;
Grant debug connect session to bysj;
revoke unlimited tablespace from bysj;
alter user bysj quota 0 on system;
alter user bysj quota 0 on users;
alter user bysj quota unlimited on ValuateSystem;
grant dba to bysj;
