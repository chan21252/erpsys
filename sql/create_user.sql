create user 'erpsys'@'localhost' IDENTIFIED by '123456';
grant privileges on erpsys.* to 'erpsys'@'localhost' IDENTIFIED BY '123456';
flush privileges;