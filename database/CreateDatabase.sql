﻿USE AP
DROP DATABASE PRN211_FeedbackAndQASystem
CREATE DATABASE PRN211_FeedbackAndQASystem
USE PRN211_FeedbackAndQASystem 

CREATE TABLE Account (
    username VARCHAR(150) NOT NULL PRIMARY KEY,
    [password] VARCHAR(150) NOT NULL,
);
CREATE TABLE [Role](
	roleId int NOT NULL,
	roleName varchar(150),
	CONSTRAINT PK_Role PRIMARY KEY (roleId)
)
CREATE TABLE AccountRole(
	username varchar(150) NOT NULL,
	roleId int NOT NULL,
	CONSTRAINT PK_AccountRole PRIMARY KEY (username, roleId)
)

ALTER TABLE AccountRole ADD CONSTRAINT FK_AccountRole_Account FOREIGN KEY(username)
REFERENCES Account (username)
ALTER TABLE AccountRole ADD CONSTRAINT FK_AccountRole_Role FOREIGN KEY(roleId)
REFERENCES [Role] (roleId)

CREATE TABLE Course
(
	courseId varchar(10) NOT NULL,
	courseName nvarchar(100),
	CONSTRAINT PK_Course PRIMARY KEY (courseId)
 )

CREATE TABLE Instructor
 (
	instructorId varchar(20) NOT NULL,
	instructorName nvarchar(100),
	gender bit, 
	instructorImage varchar(max),
	CONSTRAINT PK_Instructor PRIMARY KEY (instructorId),

	accountId varchar(150) NOT NULL UNIQUE,
    CONSTRAINT FK_Instructor_Account FOREIGN KEY (accountId) REFERENCES Account(username)
)

CREATE TABLE [Group]
(
	groupId int NOT NULL,
	groupName varchar(20) NULL,
	courseId varchar(10) NULL,
	instructorId varchar(20) NULL,
	CONSTRAINT PK_Group PRIMARY KEY (groupId)
)
ALTER TABLE [Group] ADD CONSTRAINT FK_Group_Course FOREIGN KEY(courseId)
REFERENCES Course (courseId)
ALTER TABLE [Group] ADD CONSTRAINT FK_Group_Instructor FOREIGN KEY(instructorId)
REFERENCES Instructor (instructorId)


CREATE TABLE Student
(
	studentId varchar(8) NOT NULL,
	studentName nvarchar(100),
	gender bit,
	studentImage varchar(max),
	CONSTRAINT PK_Student PRIMARY KEY (studentId),

	accountId varchar(150) NOT NULL UNIQUE,
    CONSTRAINT FK_Student_Account FOREIGN KEY (accountId) REFERENCES Account(username)
 )

CREATE TABLE Participate
(
	groupId int NOT NULL,
	studentId varchar(8) NOT NULL,
	CONSTRAINT PK_Participate PRIMARY KEY (groupId, studentId)
)

ALTER TABLE Participate ADD CONSTRAINT FK_Participate_Group FOREIGN KEY(groupId)
REFERENCES [Group] (groupId)
ALTER TABLE Participate ADD CONSTRAINT FK_Participate_Student FOREIGN KEY(studentId)
REFERENCES Student (studentId)

CREATE TABLE Feedback
(
	feedbackId int NOT NULL IDENTITY(1,1),
	feedbackOpenDay datetime,
	feedbackCloseDay datetime,
	groupId int,
	CONSTRAINT PK_Feedback PRIMARY KEY (feedbackId)
)
ALTER TABLE Feedback ADD CONSTRAINT FK_Feedback_Group FOREIGN KEY(groupId)
REFERENCES [Group] (groupId)


CREATE TABLE FbQuestion
(
	fbQuestionId int NOT NULL IDENTITY(1,1),
	fbQuestionTitle nvarchar(max),
	feedbackId int,
	CONSTRAINT PK_FbQuestion PRIMARY KEY (fbQuestionId)
)
ALTER TABLE FbQuestion ADD CONSTRAINT FK_FbQuestion_Feedback FOREIGN KEY(feedbackId)
REFERENCES Feedback(feedbackId)

CREATE TABLE FbQuestionCheck  
(
	fbQuestionCheckId int NOT NULL IDENTITY(1,1),
	fbQuestionCheckContent nvarchar(max),
	fbQuestionId int,
	CONSTRAINT PK_FbQuestionCheck PRIMARY KEY (fbQuestionCheckId)
)
ALTER TABLE FbQuestionCheck ADD CONSTRAINT FK_FbQuestionCheck_FbQuestion FOREIGN KEY(fbQuestionId)
REFERENCES FbQuestion(fbQuestionId)

CREATE TABLE [Status]
(
	statusId int NOT NULL, 
	statusName varchar(50), 
	CONSTRAINT PK_Status PRIMARY KEY (statusId)
)

CREATE TABLE Respond 
(
	respondTime datetime,
	respondStatus int, 
	feedbackId int,
	studentId varchar(8),
	CONSTRAINT PK_Respond PRIMARY KEY (studentId, feedbackId)
)
ALTER TABLE Respond ADD CONSTRAINT FK_Respond_Feedback FOREIGN KEY(feedbackId)
REFERENCES Feedback(feedbackId)
ALTER TABLE Respond ADD CONSTRAINT FK_Respond_Student FOREIGN KEY(studentId)
REFERENCES Student (studentId)
ALTER TABLE Respond ADD CONSTRAINT FK_Respond_Status FOREIGN KEY(respondStatus)
REFERENCES [Status] (statusId)


CREATE TABLE Question
(
	questionId int NOT NULL IDENTITY(1,1), 
	questionTitle nvarchar(50), 
	questionDescription nvarchar(max),
	fileURL varchar(max),
	studentId varchar(8),
	groupId int, 
	questionStatus int,
	CONSTRAINT PK_Question PRIMARY KEY (questionId)
)
ALTER TABLE Question ADD CONSTRAINT FK_Question_Student FOREIGN KEY(studentId)
REFERENCES Student (studentId)
ALTER TABLE Question ADD CONSTRAINT FK_Question_Status FOREIGN KEY(questionStatus)
REFERENCES [Status] (statusId)
ALTER TABLE Question ADD CONSTRAINT FK_Question_Group FOREIGN KEY(groupId)
REFERENCES [Group] (groupId)

CREATE TABLE Answer
(
	answerId int NOT NULL IDENTITY(1,1), 
	answerContent nvarchar(max),
	answerTime datetime,
	questionId int, 
	CONSTRAINT PK_Answer PRIMARY KEY (answerId)
)
ALTER TABLE Answer ADD CONSTRAINT FK_Answer_Question FOREIGN KEY(questionId)
REFERENCES Question (questionId)

-- ALTER TABLE Answer ADD CONSTRAINT PK_Answer PRIMARY KEY (answerId)
-- ALTER TABLE Answer DROP CONSTRAINT FK_Answer_Instructor 
-- ALTER TABLE Answer DROP COLUMN instructorId
-- ALTER TABLE Student ADD gender bit
-- ALTER TABLE Instructor ADD gender bit

/*
SELECT * FROM Student
SELECT * FROM Participate
SELECT * FROM []
SELECT * FROM [Group]
SELECT * FROM 
SELECT * FROM Instructor
SELECT * FROM 
SELECT * FROM 
SELECT * FROM Course

SELECT * FROM AccountRole
SELECT * FROM Account
SELECT * FROM RoleFeature 
SELECT * FROM [Role]
SELECT * FROM Feature

--	Thứ tự xóa bảng 
DELETE FROM Participate
DELETE FROM [Group]
DELETE FROM Student
DELETE FROM Instructor
DELETE FROM Course

DELETE FROM AccountRole
DELETE FROM Account
-- DELETE FROM RoleFeature 
DELETE FROM [Role]
DELETE FROM Feature
*/





