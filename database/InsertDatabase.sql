USE PRN211_FeedbackAndQASystem

--	COURSE TABLE 
INSERT INTO Course (courseId, courseName) VALUES ('VOV124', N'Vovinam 2');
INSERT INTO Course (courseId, courseName) VALUES ('VOV134', N'Vovinam 3');
INSERT INTO Course (courseId, courseName) VALUES ('VOV114', N'Vovinam 1');
INSERT INTO Course (courseId, courseName) VALUES ('TRS601', N'Transition');
INSERT INTO Course (courseId, courseName) VALUES ('TMI101', N'Traditional musical instrument');
INSERT INTO Course (courseId, courseName) VALUES ('SSL101c',N'Academic Skills for University Success');
INSERT INTO Course (courseId, courseName) VALUES ('PRF192', N'Programming Fundamentals');
INSERT INTO Course (courseId, courseName) VALUES ('MAE101', N'Mathematics for Engineering');
INSERT INTO Course (courseId, courseName) VALUES ('CEA201', N'Computer Organization and Architecture');
INSERT INTO Course (courseId, courseName) VALUES ('CSI104', N'Introduction to Computer Science');
INSERT INTO Course (courseId, courseName) VALUES ('PRO192', N'Object-Oriented Programming');
INSERT INTO Course (courseId, courseName) VALUES ('MAD101', N'Discrete mathematics');
INSERT INTO Course (courseId, courseName) VALUES ('OSG202', N'Operating Systems');
INSERT INTO Course (courseId, courseName) VALUES ('NWC203c',N'Computer Networking');
INSERT INTO Course (courseId, courseName) VALUES ('SSG104', N'Communication and In-Group Working Skills');
INSERT INTO Course (courseId, courseName) VALUES ('JPD113', N'Elementary Japanese 1-A1.1');
INSERT INTO Course (courseId, courseName) VALUES ('CSD201', N'Data Structures and Algorithms');
INSERT INTO Course (courseId, courseName) VALUES ('DBI202', N'Introduction to Databases');
INSERT INTO Course (courseId, courseName) VALUES ('LAB211', N'OOP with Java Lab');
INSERT INTO Course (courseId, courseName) VALUES ('WED201c',N'Web Design');
INSERT INTO Course (courseId, courseName) VALUES ('MAS291', N'Statistics and Probability');
INSERT INTO Course (courseId, courseName) VALUES ('JPD123', N'Elementary Japanese 1-A1.2');
INSERT INTO Course (courseId, courseName) VALUES ('IOT102', N'Internet of Things');
INSERT INTO Course (courseId, courseName) VALUES ('PRJ301', N'Java Web Application Development');
INSERT INTO Course (courseId, courseName) VALUES ('SWE201c',N'Introduction to Software Engineering');
INSERT INTO Course (courseId, courseName) VALUES ('SWP391', N'Application development project');
INSERT INTO Course (courseId, courseName) VALUES ('ITE302c',N'Ethics in IT');
INSERT INTO Course (courseId, courseName) VALUES ('SWR302', N'Software Requirement');
INSERT INTO Course (courseId, courseName) VALUES ('SWT301', N'Software Testing');
INSERT INTO Course (courseId, courseName) VALUES ('PRN211', N'Basic Cross-Platform Application Programming With .NET');
INSERT INTO Course (courseId, courseName) VALUES ('OJT202', N'On the job training');
INSERT INTO Course (courseId, courseName) VALUES ('ENW492c',N'Writing Research Papers');
INSERT INTO Course (courseId, courseName) VALUES ('PRN221', N'Advanced Cross-Platform Application Programming With .NET');
INSERT INTO Course (courseId, courseName) VALUES ('PRM392', N'Mobile Programming');
INSERT INTO Course (courseId, courseName) VALUES ('PRU211m',N'C# Programming and Unity');
INSERT INTO Course (courseId, courseName) VALUES ('SWD392', N'SW Architecture and Design');
INSERT INTO Course (courseId, courseName) VALUES ('EXE_ELE',N'Entrepreneurship Group 1');
INSERT INTO Course (courseId, courseName) VALUES ('MLN122', N'Political economics of Marxism – Leninism');
INSERT INTO Course (courseId, courseName) VALUES ('PMG202c',N'Project management');
INSERT INTO Course (courseId, courseName) VALUES ('WDU203c',N'UI/UX Design');
INSERT INTO Course (courseId, courseName) VALUES ('PRU221m',N'Object-Oriented Programming for Unity Games');
INSERT INTO Course (courseId, courseName) VALUES ('PRN231', N'Building Cross-Platform Back-End Application With .NET');
INSERT INTO Course (courseId, courseName) VALUES ('MLN111', N'Philosophy of Marxism – Leninism');
INSERT INTO Course (courseId, courseName) VALUES ('MLN131', N'Scientific socialism');
INSERT INTO Course (courseId, courseName) VALUES ('VNR202', N'History of Việt Nam Communist Party');
INSERT INTO Course (courseId, courseName) VALUES ('SEP490', N'SE Capstone Project');
INSERT INTO Course (courseId, courseName) VALUES ('HCM202', N'Hồ Chí Minh Ideology');


--	GROUP TABLE 
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (1,'AI1708', 'CEA201', 'thangnv75');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (2,'SE1744', 'CSD201', 'thangnv75');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (9,'SE1630-JS', 'SWP391', 'sonnt5');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (4,'SE1735', 'SWE201c', 'tientd17');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (5,'SE1758', 'OSG202', 'thangnv75');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (6,'SE1805', 'PRF192', 'sonnt5');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (7,'SE1729', 'PRJ301', 'sonnt5');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (8,'SE1638-NET', 'PRN221', 'tientd17');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (3,'SE1826', 'SSG104', 'tientd17');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (10,'SE1722', 'IOT102', 'tientd17');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (11,'IS1702', 'SWE201c', 'trungnt');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (12,'SE1723', 'IOT102', 'yennth126');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (13,'SE1723', 'MAS291', 'khaidq6');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (14,'SE1723', 'JPD123', 'anhnh88');
INSERT INTO [Group] (groupId, groupName, courseId, instructorId) VALUES (15,'SE1713-NET', 'PRN211', 'tientd17');

--	PARTICIPATE TABLE 
--	Insert into Participate Các thầy cô còn lại 

INSERT INTO Participate (groupId, studentId) VALUES (1, 'DE170703')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE153678')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE161700')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE161706')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE161755')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE163415')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE163635')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE164044')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE170072')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE170180')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE170201')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE170203')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE170420')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE170595')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE171098')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE171319')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE171320')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE171416')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE171702')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE171937')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE172032')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE173037')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE173046')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE176640')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE181829')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HE181879')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HS170024')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HS170726')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HS173175')
INSERT INTO Participate (groupId, studentId) VALUES (1, 'HS176033')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE161232')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE161643')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE163665')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE170123')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE170268')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE170302')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE170314')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE170317')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE170617')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE171209')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE171310')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE171883')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE172207')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE172366')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE172533')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE172693')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE172802')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE173328')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE173373')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE173476')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE173489')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE176275')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE176282')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE176285')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE176346')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE176360')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE176603')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE176686')
INSERT INTO Participate (groupId, studentId) VALUES (2, 'HE176834')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE161285')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE161816')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE163067')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170011')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170167')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170273')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170301')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170415')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170607')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170622')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170631')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170724')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170960')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE170999')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE171312')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE171411')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE171540')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE171628')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE171865')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE172037')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE172748')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE172838')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE172848')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE173248')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE173588')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE176077')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE176087')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE176169')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE176420')
INSERT INTO Participate (groupId, studentId) VALUES (5, 'HE176882')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE150732')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE150998')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE161224')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE161597')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE163629')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE170089')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE170685')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE170793')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE171358')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE171394')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE171421')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE171552')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE171908')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE171915')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE171916')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE171990')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE172180')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE172280')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE172313')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE172435')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE172527')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE172538')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE172702')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE172737')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE173401')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE173457')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE176211')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE176279')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE176633')
INSERT INTO Participate (groupId, studentId) VALUES (6, 'HE176747')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE161302')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE163675')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE170059')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE170141')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE170176')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE170262')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE170318')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE170416')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE170481')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE171285')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE171377')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE171511')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE171558')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE171827')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172058')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172063')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172083')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172084')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172163')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172262')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172386')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172398')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172460')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172467')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172568')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172610')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172717')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172787')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HE172851')
INSERT INTO Participate (groupId, studentId) VALUES (7, 'HS171380')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE161469')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE163233')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE171163')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE171403')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE171408')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE171590')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE171985')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE172734')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE172742')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE173033')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE176187')
INSERT INTO Participate (groupId, studentId) VALUES (9, 'HE176230')

--	PARTICIPATE SE1723
--	Insert into Participate PRN211 - SE1713-NET
INSERT INTO Participate (studentId, groupId) VALUES ('HE150057', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE151095', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE153206', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE160694', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161357', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161795', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE163146', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE164035', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170051', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170245', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170422', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170428', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170444', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170533', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170842', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170863', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170907', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170996', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171071', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171073', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171162', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171442', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171482', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171578', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171687', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171851', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171865', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176182', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176697', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176751', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('SE03520', 15);
INSERT INTO Participate (studentId, groupId) VALUES ('SE04495', 15);
--	Insert into Participate JPD123 - SE1723
INSERT INTO Participate (studentId, groupId) VALUES ('HE153263', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE153535', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE160914', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161145', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161357', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161544', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161706', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161800', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161832', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE163146', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170051', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170245', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170422', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170428', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170444', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170842', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170863', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170907', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170996', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171071', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171073', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171162', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171442', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171482', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171687', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171851', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171865', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176182', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176697', 14);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176751', 14);
--	Insert into Participate IOT102 - SE1723
INSERT INTO Participate (studentId, groupId) VALUES ('HE160071', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161357', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE163146', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170051', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170245', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170422', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170428', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170444', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170533', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170842', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170863', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170907', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170996', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171071', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171073', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171162', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171442', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171482', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171578', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171687', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171851', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176182', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176697', 12);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176751', 12);
--	Insert into Participate MAS291 - SE1723
INSERT INTO Participate (studentId, groupId) VALUES ('HE140639', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE140842', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE153206', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161139', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161357', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161481', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161512', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161733', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161869', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE163146', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170051', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170245', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170422', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170428', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170444', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170842', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170863', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170907', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170996', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171071', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171073', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171162', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171442', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171482', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171687', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171851', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171865', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176182', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176697', 13);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176751', 13);


--Insert into Participate (IS1702 - SWE201c)
INSERT INTO Participate (studentId, groupId) VALUES ('HE140339', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE150282', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE160625', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE160682', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161469', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161861', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161875', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161882', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE161918', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE163001', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE163146', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE163154', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE163233', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170051', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170245', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170422', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170428', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170444', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170842', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170863', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170907', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE170996', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171071', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171073', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171162', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171163', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171403', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171408', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171442', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171482', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171590', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171687', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171851', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE171985', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE172734', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE172742', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE173033', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176160', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176182', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176187', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176230', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176586', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176697', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HE176751', 11);
INSERT INTO Participate (studentId, groupId) VALUES ('HS160715', 11);


--Participate TIENTD17

-- Insert into Participate SWE201c - Tientd17
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE151390', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE161152', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE161165', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE161181', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163891', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE164019', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170012', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170027', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170147', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171284', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171454', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171518', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171587', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171927', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172073', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172273', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172339', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172486', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172517', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172525', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172826', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE173222', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE173258', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176027', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176125', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176256', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176715', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176743', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176810', '4');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE181414', '4');
-- Insert into Participate PRN211 - Tientd17
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE150271', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE150862', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170646', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170662', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170738', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170800', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170827', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170995', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171110', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171364', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171534', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172014', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172264', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172372', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172701', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172717', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172726', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE173209', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE173235', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176292', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176767', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE180542', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE181024', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE181266', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE182276', '8');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE187276', '8');
-- Insert into Participate SSG104 - Tientd17
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE130464', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170038', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170351', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170436', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170459', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170593', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170625', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170663', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170704', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170855', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170911', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170913', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE170966', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171112', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171116', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171153', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171271', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171494', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171519', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171547', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171589', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE171601', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172039', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172040', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172095', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172175', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172860', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE172875', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176347', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176485', '3');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE176673', '3');
-- Insert into Participate IOT102 - Tientd17
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE153487', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160021', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160120', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160277', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160533', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160623', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160639', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160854', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160866', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160929', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE160982', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE161234', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE161475', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163040', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163063', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163083', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163158', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163166', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163193', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163249', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163283', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163359', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163397', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163500', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163639', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163653', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163774', '10');
INSERT INTO [Participate] ([studentId], [groupId]) VALUES ('HE163906', '10');