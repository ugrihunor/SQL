1. SELECT Name, Surname, Gr_Id 
	FROM Students, Groups 
	WHERE GR_Id=3

2. SELECT name, surname, date_of_birth FROM Students WHERE name LIKE 'A%'

	--(INNER) JOIN OPERATOR

3. SELECT Students.Name, Students.Surname, Students.Group_Id FROM Students INNER JOIN Marks ON (Students.Stud_Id=Marks.Student_Id)INNER JOIN Teachers ON (Marks.Teacher_Id=Teachers.Teacher_Id) WHERE teachers.Name = 'Adrian'

	--SELECT IN SELECT
	--nem jó
4. SELECT Students.Name, Students.Surname FROM Students, Marks, Disciplines WHERE  Marks.Mark >= (SELECT Marks.Mark FROM Students, Marks, Disciplines WHERE Students.Name = 'Barbara') 

	SELECT S1.Name, S1.Surname,m1.Mark S1.Group_Id
	FROM Students AS S1
	LEFT JOIN Marks AS M1 ON (S1.Stud_Id=M1.Student_Id) 
	JOIN Disciplines AS D1 ON (D1.Discipline_Id= M1.Disc_Id)
	WHERE Name ='Barbara' AND D1.Disc_name= 'History' > (SELECT TOP 1 M2.Mark FROM Marks AS M2 
	JOIN Students as s2 ON (M2.Student_Id=S2.Stud_Id)
	JOIN Disciplines AS D2 ON (D2.Discipline_Id= M2.Disc_Id)
	WHERE Name ='Barbara' AND D2.Disc_name= 'History')


	 

	--ORDER BY, TOP (nem adott ki semmit)

5. SELECT TOP 3 Students.Name, Students.Surname, Students.Group_Id FROM Students JOIN Marks ON (Stud_Id= Student_Id) JOIN Disciplines ON (Discipline_Id=Disc_Id) WHERE Disc_name = 'Computer Programming'
	ORDER BY Marks.Mark 

SELECT TOP 3 Name, Surname, Group_Id
FROM Students JOIN Marks ON Stud_Id=Student_Id JOIN Disciplines ON Disc_Id=Discipline_Id
WHERE Disc_name = 'Computer Programming'
ORDER BY Mark

	

	--GROUP BY, AGGREGATE FUNCTIONS

6.  SELECT Students.Name, Students.Surname, AVG(Marks.Mark) FROM Students JOIN Marks ON (Students.Stud_Id= Marks.Student_Id) JOIN Groups ON (Groups.Gr_Id = Students.Stud_Id) WHERE Groups.Gr_name = 'vestibulum'
	GROUP BY Students.Surname


7.  SELECT Students.Name, Groups.Comments, Students.Surname FROM Students JOIN Groups ON (Students.Group_Id= Groups.Gr_Id) 
	GROUP BY Groups.Gr_name