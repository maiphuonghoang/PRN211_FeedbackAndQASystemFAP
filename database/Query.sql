USE PRN211_FeedbackAndQASystem

SELECT * FROM Student
SELECT * FROM Participate
SELECT * FROM [Group]
SELECT * FROM Instructor
SELECT * FROM Course

SELECT * FROM AccountRole
SELECT * FROM Account
SELECT * FROM [Role]

SELECT * FROM [Status]
SELECT * FROM Question 
SELECT * FROM Answer 

-- Lấy danh sách student của 1 group 
SELECT * FROM Student s
	JOIN Participate p ON s.studentId = p.studentId
	JOIN [Group] g ON g.groupId = p.groupId
	WHERE g.groupId = 6  

-- Lấy các group của instructor dạy 
SELECT * FROM [Group] g 
	JOIN Instructor i ON i.instructorId = g.instructorId
	WHERE i.instructorId = 'tientd17'

-- Lấy các question của student 
SELECT * FROM Question q
	JOIN Student s ON s.studentId = q.studentId
	JOIN Participate p ON s.studentId = p.studentId
	JOIN [Group] g ON g.groupId = p.groupId AND g.groupId = q.groupId
	WHERE -- g.courseId = 'PRN211' AND 
	s.studentId = 'HE171073'

-- Lấy question của giảng viên 
SELECT * FROM Question q
	JOIN Student s ON s.studentId = q.studentId
	JOIN Participate p ON s.studentId = p.studentId
	JOIN [Group] g ON g.groupId = p.groupId AND g.groupId = q.groupId
	WHERE g.courseId = 'PRN211' AND 
	g.instructorId = 'tientd17'

-- Lấy question và answer của 1 student 
SELECT q.*, a.*, g.courseId FROM Question q
	JOIN Student s ON s.studentId = q.studentId
	JOIN Participate p ON s.studentId = p.studentId
	JOIN [Group] g ON g.groupId = p.groupId AND g.groupId = q.groupId
	LEFT JOIN Answer a ON a.questionId = q.questionId
	WHERE -- g.courseId = 'PRN211' AND 
	s.studentId = 'HE171073'

-- Lấy các instructor theo group đang học của 1 student 
SELECT * FROM Student s
	JOIN Participate p ON s.studentId = p.studentId
	JOIN [Group] g ON g.groupId = p.groupId
	JOIN Instructor i ON i.instructorId = g.instructorId
	WHERE s.studentId = 'HE171073'



