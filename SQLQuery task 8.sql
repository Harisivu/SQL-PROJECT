create table  course_table ( CourseID int Primary key, CourseName nvarchar(100) NOT NULL, Credits int NOT NULL );
insert into course_table values(300,'BCA',100);
insert into course_table values(301,'MCA',99);
insert into course_table values(302,'CA',90);
insert into course_table values(303,'Boi.Tech',95);
insert into course_table values(304,'Cs',95);
insert into course_table values(305,'BCA',95);
insert into course_table values(306,'BCA',99);
insert into course_table values(307,'BCA',99);
select * from course_table;

create table studente(StudentID int primary key,First_Name varchar(30) NOT NULL,LastName nvarchar(30) NOT NULL, DateOfBirth date,  EnrollmentDate date);
insert into studente values(2001,'Hari','Haran','09/07/2005','10/07/2024');
insert into studente values(2002,'Mari','Muthu','03/05/2005','10/07/2024');
insert into studente values(2003,'Guna','Shekar','07/08/2005','10/07/2024');
insert into studente values(2005,'Jahir','Usen','07/02/2004','01/08/2024');
insert into studente values(2004,'Kokila','Rajan','05/01/2005','05/09/2024');
insert into studente values(2006,'K.Mani','Kandan','06/01/2005','08/03/2024');
insert into studente values(2007,'Jegan','S','01/06/2005','05/09/2022');
insert into studente values(2008,'Jegan','S','01/06/2005','05/09/2022');
select * from student;

create table Enrollment(EnrollmentID int primary key,StudentID INT FOREIGN KEY REFERENCES Studente(StudentID),CourseID INT FOREIGN KEY REFERENCES Course_table(CourseID),EnrollmentDate DATE);
insert into Enrollment values(1,2001,300,'10/07/2024');
insert into Enrollment values(2,2002,301,'03/05/2024');
insert into Enrollment values(3,2003,302,'06/08/2024');
insert into Enrollment values(4,2004,303,'05/02/2024');
insert into Enrollment values(5,2005,304,'01/06/2024');
insert into Enrollment values(6,2006,305,'08/09/2024');
insert into Enrollment values(7,2007,306,'06/08/2024');
insert into Enrollment values(8,2008,307,'08/07/2024');

select * from Enrollment;


---step 2---
SELECT * FROM Student;

--step 3---
SELECT s.* FROM Student s JOIN Enrollment e ON s.StudentID = e.StudentID JOIN Course_table c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'BCA';
--step 4---
SELECT c.CourseName, COUNT(e.EnrollmentID) AS EnrollmentCount FROM Course_table c
JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;
--step 5---
SELECT s.StudentID, s.First_Name,s.LastName, COUNT( e.CourseID) as course_count
FROM student s
JOIN Enrollment e ON s.studentID = e.StudentID
GROUP BY s.studentID, s.First_Name, s.LastName
HAVING COUNT( e.CourseID)>1;
--step 6--
SELECT s.First_Name, s.LastName, e.EnrollmentDate FROM Student s JOIN Enrollment e ON s.StudentID = e.StudentID 
JOIN course_table c ON e.CourseID = c.CourseID WHERE c.CourseName = 'IT';
--step 7--
SELECT s.studentID, s.First_Name,LastName
FROM student s
JOIN enrollments e ON s.studentID = e.studentID
JOIN course_table c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('BCA', 'Cs')
GROUP BY s.studentID, s.First_Name,LastName
HAVING COUNT(c.CourseName) = 2;

--step 8--
SELECT COUNT(*) AS TotalEnrollments FROM Enrollment;