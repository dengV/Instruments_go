    Last login: Sat Sep  1 21:54:40 on ttys006
    dengjiangzhou@dengjiangzhou  ~  sudo /usr/local/mysql/support-files/mysql.server stop
    Password:
    Sorry, try again.
    Password:
    Shutting down MySQL
    .. SUCCESS! 
    dengjiangzhou@dengjiangzhou  ~  cd /usr/local/mysql/bin   ✔  2  21:58:21 
    dengjiangzhou@dengjiangzhou  /usr/local/mysql/bin  sudo su
    sh-3.2# ./mysqld_safe --skip-grant-tables &
    [1] 10590
    sh-3.2# 2018-09-01T13:58:52.6NZ mysqld_safe Logging to '/usr/local/mysql-5.7.21-macos10.13-x86_64/data/dengjiangzhou.err'.
    2018-09-01T13:58:52.6NZ mysqld_safe Starting mysqld daemon with databases from /usr/local/mysql-5.7.21-macos10.13-x86_64/data

    sh-3.2# exit
    dengjiangzhou@dengjiangzhou  /usr/local/mysql/bin  mysql -u root -p
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 247
    Server version: 5.7.21 MySQL Community Server (GPL)

    Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> \q
    Bye
    dengjiangzhou@dengjiangzhou  /usr/local/mysql/bin   
    
    
    
    
<hr>

上面一个 Tab

<hr>


交叉输入

<hr>


下面一个 Tab

<hr>


    Last login: Sat Sep  1 21:57:05 on ttys004
    dengjiangzhou@dengjiangzhou  ~  mysql -uroot -p           ✔  1  21:59:12 
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 42
    Server version: 5.7.21 MySQL Community Server (GPL)

    Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> use mysql;
    Reading table information for completion of table and column names
    You can turn off this feature to get a quicker startup with -A

    Database changed
    mysql> describe user;
    +------------------------+-----------------------------------+------+-----+-----------------------+-------+
    | Field                  | Type                              | Null | Key | Default               | Extra |
    +------------------------+-----------------------------------+------+-----+-----------------------+-------+
    | Host                   | char(60)                          | NO   | PRI |                       |       |
    | User                   | char(32)                          | NO   | PRI |                       |       |
    | Select_priv            | enum('N','Y')                     | NO   |     | N                     |       |
    | Insert_priv            | enum('N','Y')                     | NO   |     | N                     |       |
    | Update_priv            | enum('N','Y')                     | NO   |     | N                     |       |
    | Delete_priv            | enum('N','Y')                     | NO   |     | N                     |       |
    | Create_priv            | enum('N','Y')                     | NO   |     | N                     |       |
    | Drop_priv              | enum('N','Y')                     | NO   |     | N                     |       |
    | Reload_priv            | enum('N','Y')                     | NO   |     | N                     |       |
    | Shutdown_priv          | enum('N','Y')                     | NO   |     | N                     |       |
    | Process_priv           | enum('N','Y')                     | NO   |     | N                     |       |
    | File_priv              | enum('N','Y')                     | NO   |     | N                     |       |
    | Grant_priv             | enum('N','Y')                     | NO   |     | N                     |       |
    | References_priv        | enum('N','Y')                     | NO   |     | N                     |       |
    | Index_priv             | enum('N','Y')                     | NO   |     | N                     |       |
    | Alter_priv             | enum('N','Y')                     | NO   |     | N                     |       |
    | Show_db_priv           | enum('N','Y')                     | NO   |     | N                     |       |
    | Super_priv             | enum('N','Y')                     | NO   |     | N                     |       |
    | Create_tmp_table_priv  | enum('N','Y')                     | NO   |     | N                     |       |
    | Lock_tables_priv       | enum('N','Y')                     | NO   |     | N                     |       |
    | Execute_priv           | enum('N','Y')                     | NO   |     | N                     |       |
    | Repl_slave_priv        | enum('N','Y')                     | NO   |     | N                     |       |
    | Repl_client_priv       | enum('N','Y')                     | NO   |     | N                     |       |
    | Create_view_priv       | enum('N','Y')                     | NO   |     | N                     |       |
    | Show_view_priv         | enum('N','Y')                     | NO   |     | N                     |       |
    | Create_routine_priv    | enum('N','Y')                     | NO   |     | N                     |       |
    | Alter_routine_priv     | enum('N','Y')                     | NO   |     | N                     |       |
    | Create_user_priv       | enum('N','Y')                     | NO   |     | N                     |       |
    | Event_priv             | enum('N','Y')                     | NO   |     | N                     |       |
    | Trigger_priv           | enum('N','Y')                     | NO   |     | N                     |       |
    | Create_tablespace_priv | enum('N','Y')                     | NO   |     | N                     |       |
    | ssl_type               | enum('','ANY','X509','SPECIFIED') | NO   |     |                       |       |
    | ssl_cipher             | blob                              | NO   |     | NULL                  |       |
    | x509_issuer            | blob                              | NO   |     | NULL                  |       |
    | x509_subject           | blob                              | NO   |     | NULL                  |       |
    | max_questions          | int(11) unsigned                  | NO   |     | 0                     |       |
    | max_updates            | int(11) unsigned                  | NO   |     | 0                     |       |
    | max_connections        | int(11) unsigned                  | NO   |     | 0                     |       |
    | max_user_connections   | int(11) unsigned                  | NO   |     | 0                     |       |
    | plugin                 | char(64)                          | NO   |     | mysql_native_password |       |
    | authentication_string  | text                              | YES  |     | NULL                  |       |
    | password_expired       | enum('N','Y')                     | NO   |     | N                     |       |
    | password_last_changed  | timestamp                         | YES  |     | NULL                  |       |
    | password_lifetime      | smallint(5) unsigned              | YES  |     | NULL                  |       |
    | account_locked         | enum('N','Y')                     | NO   |     | N                     |       |
    +------------------------+-----------------------------------+------+-----+-----------------------+-------+
    45 rows in set (0.00 sec)

    mysql> UPDATE mysql.user SET authentication_string=PASSWORD(‘123456’) where User=’root’;
    ERROR 1054 (42S22): Unknown column '’root’' in 'where clause'
    mysql> UPDATE mysql.user SET authentication_string=PASSWORD(‘123456’) where User=root;
    ERROR 1054 (42S22): Unknown column 'root' in 'where clause'
    mysql> UPDATE mysql.user SET authentication_string=PASSWORD(‘123456’) where User=’root’;
    ERROR 1054 (42S22): Unknown column '’root’' in 'where clause'
    mysql> UPDATE mysql.user SET authentication_string=PASSWORD(‘123456’) where User=’root‘;
    ERROR 1054 (42S22): Unknown column '’root‘' in 'where clause'
    mysql> set password for 'root'@'localhost'=password(‘123456’);
    ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '‘123456’)' at line 1
    mysql> UPDATE mysql.user SET authentication_string=PASSWORD(‘123456’) where User=”root“;
    ERROR 1054 (42S22): Unknown column '”root“' in 'where clause'
    mysql> UPDATE mysql.user SET authentication_string=PASSWORD(‘123456’) where User="root";
    ERROR 1054 (42S22): Unknown column '‘123456’' in 'field list'
    mysql> UPDATE mysql.user SET authentication_string=PASSWORD("123456") where User="root";
    Query OK, 1 row affected, 1 warning (0.01 sec)
    Rows matched: 1  Changed: 1  Warnings: 1

    mysql> flush privileges;
    Query OK, 0 rows affected (0.00 sec)

    mysql> \q
    Bye
    dengjiangzhou@dengjiangzhou  ~  sudo /usr/local/mysql/support-files/mysql.server start
    Password:
    Sorry, try again.
    Password:
    Starting MySQL
    SUCCESS! 
    dengjiangzhou@dengjiangzhou  ~  2018-09-01T14:06:17.6NZ mysqld_safe A mysqld process already exists

    dengjiangzhou@dengjiangzhou  ~  sudo /usr/local/mysql/support-files/mysql.server start
    Starting MySQL
    SUCCESS! 
    dengjiangzhou@dengjiangzhou  ~  2018-09-01T14:06:36.6NZ mysqld_safe A mysqld process already exists

    dengjiangzhou@dengjiangzhou  ~     


