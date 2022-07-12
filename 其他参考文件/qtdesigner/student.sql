show databases;
create database test;
use test;
drop table student;
CREATE TABLE `student` (
  `SNo` char(10) NOT NULL,
  `SName` char(20) NOT NULL,
  `Sage` int(11) ,
  `SGender` char(2) ,
  `depart` char(20) ,
  PRIMARY KEY (`SNo`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into student values('001','张三',19,'M','计算机');
insert into student values('002','李四',19,'M','计算机');
insert into student values('003','王二',20,'M','信息管理');
insert into student values('004','Jason',19,'M','物流工程');

select * from student;