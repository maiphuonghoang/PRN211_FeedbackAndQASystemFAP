DROP DATABASE PRN211_FeedbackAndQASystem
CREATE DATABASE PRN211_FeedbackAndQASystem
USE PRN211_FeedbackAndQASystem
-- USE AP
CREATE TABLE [Subject]
(
	subjectId varchar(10) NOT NULL,
	subjectName nvarchar(100),
	CONSTRAINT PK_Course PRIMARY KEY (subjectId)
 )

CREATE TABLE Instructor
 (
	instructorId varchar(20) NOT NULL,
	instructorName nvarchar(100),
	CONSTRAINT PK_Instructor PRIMARY KEY (instructorId),
)

CREATE TABLE [Group]
(
	groupId int NOT NULL IDENTITY(1,1),
	groupName varchar(20) NULL,
	subjectId varchar(10) NULL,
	instructorId varchar(20) NULL,
	CONSTRAINT PK_Group PRIMARY KEY (groupId)
)
ALTER TABLE [Group] ADD CONSTRAINT FK_Group_Course FOREIGN KEY(subjectId)
REFERENCES [Subject] (subjectId)
ALTER TABLE [Group] ADD CONSTRAINT FK_Group_Instructor FOREIGN KEY(instructorId)
REFERENCES Instructor (instructorId)


CREATE TABLE Student
(
	studentId varchar(8) NOT NULL,
	studentName nvarchar(100),
	CONSTRAINT PK_Student PRIMARY KEY (studentId),
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
	respondId int NOT NULL IDENTITY(1,1),
	respondTime datetime,
	respondStatus int, 
	feedbackId int,
	studentId varchar(8),
	CONSTRAINT PK_Respond PRIMARY KEY (respondId)
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
	instructorId varchar(20), 
	questionId int, 
)
ALTER TABLE Answer ADD CONSTRAINT FK_Answer_Question FOREIGN KEY(questionId)
REFERENCES Question (questionId)
ALTER TABLE Answer ADD CONSTRAINT FK_Answer_Instructor FOREIGN KEY(instructorId)
REFERENCES Instructor (instructorId)



