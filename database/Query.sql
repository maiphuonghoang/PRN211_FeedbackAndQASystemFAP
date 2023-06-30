USE PRN211_FeedbackAndQASystem

SELECT * FROM Student
SELECT * FROM Participate
SELECT * FROM [Group]
SELECT * FROM Instructor
SELECT * FROM Course

SELECT * FROM AccountRole
SELECT * FROM Account
SELECT * FROM [Role]

-- SELECT * FROM 

SELECT * FROM Student s
	JOIN Participate p ON s.studentId = p.studentId
	JOIN [Group] g ON g.groupId = p.groupId
	JOIN Instructor i ON i.instructorId = g.instructorId
	WHERE i.instructorId = 'tientd17'
	AND g.groupId = 15 

-- Lấy các group của instructor dạy 
SELECT * FROM [Group] g JOIN Instructor i ON i.instructorId = g.instructorId
	WHERE i.instructorId = 'sonnt5'


