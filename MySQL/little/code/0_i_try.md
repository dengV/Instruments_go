
    Last login: Sat Sep  1 22:26:55 on ttys004
    dengjiangzhou@dengjiangzhou  ~  mysql -u deng -p          ✔  1  23:21:58 
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 2352
    Server version: 5.7.21 MySQL Community Server (GPL)

    Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> USE db;
    Database changed
    mysql> CREATE TABLE shao_nian;
    ERROR 1113 (42000): A table must have at least 1 column
    mysql> CREATE TABLE shao_nian(;
    ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
    mysql> CREATE TABLE shao_nian(
    -> name VARCHAR(30) NOT NULL,
    -> identity INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY );
    Query OK, 0 rows affected (0.03 sec)

    mysql> INSERT INTO shao_nian VALUES
    -> ("DNG", NULL)
    -> ;
    Query OK, 1 row affected (0.01 sec)

    mysql> \q
    Bye
    dengjiangzhou@dengjiangzhou  ~     
