CREATE DATABASE class_db;
USE class_db;

create table department
(dept_name varchar(20),
building varchar(15),
budget numeric(12,2) check (budget>0),
primary key (dept_name));

create table student
(student_ID varchar(5),
name varchar(20) not null,
dept_name varchar(20),
tot_cred numeric(3,0) check (tot_cred>=0),
primary key (student_ID),
foreign key (dept_name) references department(dept_name) on delete set null);

create table course
(course_id varchar(7),
title varchar(50),
dept_name varchar(20),
credits numeric(2,0) check (credits>0),
primary key (course_id),
foreign key (dept_name) references department(dept_name) on delete set null);

create table instructor
(instructor_ID varchar(5),
name varchar(20) not null,
dept_name varchar(20),
salary numeric(8,2) check (salary>29000),
primary key (instructor_ID),
foreign key (dept_name) references department (dept_name) on delete set null);


create table all_list
(course_id varchar(8),
seq_id varchar(8),
semester varchar(6) check (semester in ('Fall','Winter','Spring','Summer')), 
year numeric(4,0) check (year>1701 and year<2100),
building varchar(15),
room_number varchar(7),
class_time varchar(1),
primary key (course_id, seq_id, semester, year),
foreign key (course_id) references course (course_id) on delete cascade);


create table take_course
(student_ID varchar(5),
course_id varchar(8),
seq_id varchar(8),
semester varchar(6),
year numeric(4,0),
grade varchar(2),
primary key (student_ID, course_id, seq_id, semester, year),
foreign key (course_id, seq_id, semester, year) references all_list (course_id, seq_id, semester, year) on delete cascade,
foreign key (student_ID) references student (student_ID) on delete cascade);



