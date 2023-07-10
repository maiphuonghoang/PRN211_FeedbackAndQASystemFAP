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

SELECT * FROM Feedback 
SELECT * FROM Contain
SELECT * FROM FbQuestion
SELECT * FROM FbOption
SELECT * FROM Do
SELECT * FROM Response

-- Lấy danh sách student của 1 group 
SELECT * FROM Student s
	JOIN Participate p ON s.studentId = p.studentId
	JOIN [Group] g ON g.groupId = p.groupId
	-- ORDER BY g.groupId
	WHERE g.groupId = 4  

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

-- Danh sách feedbacks của 1 student 
SELECT g.groupName, f.feedbackOpenDay, i.instructorName, g.courseId, f.feedbackCloseDay, d.doStatus
	FROM Feedback f 
	JOIN [Group] g ON f.groupId = g.groupId
	JOIN Instructor i ON i.instructorId = g.instructorId
	JOIN Participate p ON g.groupId = p.groupId
	JOIN Student s ON s.studentId = p.studentId
	JOIN Do d ON d.studentId = s.studentId AND d.feedbackId = f.feedbackId
	WHERE s.studentId = 'HE171073'
	AND d.doStatus = 0

-- List feedbacks của 1 giảng viên  
SELECT DISTINCT g.courseId, c.courseName, g.groupName, g.instructorId, f.feedbackOpenDay, f.feedbackCloseDay
	FROM Feedback f 
	JOIN [Group] g ON f.groupId = g.groupId
	JOIN Course c ON c.courseId = g.courseId
	JOIN Participate p ON g.groupId = p.groupId
	WHERE g.instructorId = 'tientd17'

-- GPA, comment của feedback của giảng viên theo group 
SELECT r.*, q.*, o.*,d.doId, d.doComment, s.studentId, f.*
	FROM Feedback f 
	JOIN [Group] g ON f.groupId = g.groupId
	JOIN Participate p ON g.groupId = p.groupId
	JOIN Student s ON s.studentId = p.studentId
	LEFT JOIN Do d ON d.studentId = s.studentId AND d.feedbackId = f.feedbackId
	LEFT JOIN Response r ON r.doId = d.doId
	LEFT JOIN FbQuestion q ON q.fbQuestionId = r.fbQuestionId
	LEFT JOIN FbOption o ON o.fbOptionId = r.selectedOptionId
	WHERE g.groupId = 15 

-- GPA, comment của feedback của giảng viên theo feedback 
SELECT *
	FROM Feedback f 
	LEFT JOIN Do d ON d.feedbackId = f.feedbackId
	LEFT JOIN Response r ON r.doId = d.doId
	LEFT JOIN FbQuestion q ON q.fbQuestionId = r.fbQuestionId
	LEFT JOIN FbOption o ON o.fbOptionId = r.selectedOptionId
	WHERE f.feedbackId = 10
	



