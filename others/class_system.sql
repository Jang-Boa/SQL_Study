-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-05-29 10:09:33.791
DROP DATABASE if EXISTS class_db;

CREATE DATABASE class_db;

USE class_db;

-- tables
-- Table: Course
CREATE TABLE Course (
    id int  NOT NULL,
    name varchar(255)  NOT NULL,
    credits int  NOT NULL,
    prerequisite varchar(255)  NULL,
    Department_id int  NOT NULL,
    CONSTRAINT Course_pk PRIMARY KEY (id)
);

-- Table: Department
CREATE TABLE Department (
    id int  NOT NULL,
    name char(20)  NOT NULL,
    location char(20)  NOT NULL,
    CONSTRAINT Department_pk PRIMARY KEY (id)
);

-- Table: Instructor
CREATE TABLE Instructor (
    id int  NOT NULL,
    name char(20)  NOT NULL,
    birth int  NOT NULL,
    gender int  NOT NULL,
    phone_num int  NULL,
    address int  NULL,
    Department_id int  NOT NULL,
    CONSTRAINT Instructor_pk PRIMARY KEY (id)
);

-- Table: Section
CREATE TABLE Section (
    id int  NOT NULL,
    sectionNumber int  NOT NULL,
    roomNumber int  NOT NULL,
    time date  NOT NULL,
    semester char(2)  NOT NULL,
    year int  NOT NULL,
    credits int  NOT NULL,
    Course_id int  NOT NULL,
    Instructor_id int  NOT NULL,
    CONSTRAINT Section_pk PRIMARY KEY (id)
);

-- Table: Student
CREATE TABLE Student (
    id int  NOT NULL,
    name char(20)  NOT NULL,
    birth int  NOT NULL,
    gender int  NOT NULL,
    grade int  NOT NULL,
    phone_number int  NULL,
    address int  NULL,
    status char(20)  NULL,
    CONSTRAINT Student_pk PRIMARY KEY (id)
);

-- Table: Student_Section
CREATE TABLE Student_Section (
    ID int  NOT NULL,
    Student_id int  NOT NULL,
    Section_id int  NOT NULL,
    score int  NOT NULL,
    CONSTRAINT Student_Section_pk PRIMARY KEY (ID)
);

-- foreign keys
-- Reference: Course_Department (table: Course)
ALTER TABLE Course ADD CONSTRAINT Course_Department FOREIGN KEY Course_Department (Department_id)
    REFERENCES Department (id);

-- Reference: Instructor_Department (table: Instructor)
ALTER TABLE Instructor ADD CONSTRAINT Instructor_Department FOREIGN KEY Instructor_Department (Department_id)
    REFERENCES Department (id);

-- Reference: Section_Course (table: Section)
ALTER TABLE Section ADD CONSTRAINT Section_Course FOREIGN KEY Section_Course (Course_id)
    REFERENCES Course (id);

-- Reference: Section_Instructor (table: Section)
ALTER TABLE Section ADD CONSTRAINT Section_Instructor FOREIGN KEY Section_Instructor (Instructor_id)
    REFERENCES Instructor (id);

-- Reference: Section_association_1 (table: Student_Section)
ALTER TABLE Student_Section ADD CONSTRAINT Section_association_1 FOREIGN KEY Section_association_1 (Section_id)
    REFERENCES Section (id);

-- Reference: Student_association_1 (table: Student_Section)
ALTER TABLE Student_Section ADD CONSTRAINT Student_association_1 FOREIGN KEY Student_association_1 (Student_id)
    REFERENCES Student (id);

-- End of file.

