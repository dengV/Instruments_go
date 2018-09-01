
    Last login: Sat Sep  1 21:27:01 on ttys002
    dengjiangzhou@dengjiangzhou  ~  mysql                     ✔  1  21:29:01 
    ERROR 1045 (28000): Access denied for user 'dengjiangzhou'@'localhost' (using password: NO)
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p        1 ↵  2  21:29:04 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p        1 ↵  3  21:40:49 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p        1 ↵  4  21:41:42 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p        1 ↵  5  21:41:50 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~  mysql -u                1 ↵  6  21:44:27 
    mysql: [ERROR] mysql: option '-u' requires an argument
    dengjiangzhou@dengjiangzhou  ~  mysql -u                5 ↵  7  21:44:56 
    mysql: [ERROR] mysql: option '-u' requires an argument
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p        5 ↵  8  21:45:01 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p        1 ↵  9  21:47:41 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p       1 ↵  10  21:47:48 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p       1 ↵  11  21:47:55 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~  mysql -u root -p       1 ↵  12  21:47:57 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~  sudo mysqld_safe --skip-grant-tables
    Password:
    Sorry, try again.
    Password:
    Logging to '/usr/local/mysql/data/dengjiangzhou.err'.
    2018-09-01T13:48:42.6NZ mysqld_safe Starting mysqld daemon with databases from /usr/local/mysql/data
    2018-09-01T13:50:23.6NZ mysqld_safe mysqld from pid file /usr/local/mysql/data/dengjiangzhou.pid ended
    dengjiangzhou@dengjiangzhou  ~                           ✔  14  21:50:23 
    dengjiangzhou@dengjiangzhou  ~  sudo /usr/local/mysql/support-files/mysql.server stop
    ERROR! MySQL server PID file could not be found!
    dengjiangzhou@dengjiangzhou  ~  cd /usr/local/mysql/bin  ✔  15  21:51:41 
    dengjiangzhou@dengjiangzhou  /usr/local/mysql/bin  sudo su
    sh-3.2# ./mysqld_safe --skip-grant-tables &
    [1] 9613
    sh-3.2# 2018-09-01T13:53:07.6NZ mysqld_safe Logging to '/usr/local/mysql-5.7.21-macos10.13-x86_64/data/dengjiangzhou.err'.
    2018-09-01T13:53:07.6NZ mysqld_safe Starting mysqld daemon with databases from /usr/local/mysql-5.7.21-macos10.13-x86_64/data

    sh-3.2# exit
    dengjiangzhou@dengjiangzhou  /usr/local/mysql/bin      
    
    
    
<hr>


上面是第一个终端




<hr>


下面是第二个终端




<hr>



    Last login: Sat Sep  1 21:50:10 on ttys006
    dengjiangzhou@dengjiangzhou  ~  mysql -uroot -p           ✔  1  21:53:13 
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 10
    Server version: 5.7.21 MySQL Community Server (GPL)

    Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> flush privileges;
    Query OK, 0 rows affected (0.07 sec)

    mysql> set password for 'root'@'localhost'=password(‘123456');
    '> exit()
    '> ^C
    mysql> ^DBye
    dengjiangzhou@dengjiangzhou  ~  mysql -uroot -p           ✔  2  21:54:28 
    Enter password: 
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
    dengjiangzhou@dengjiangzhou  ~           

