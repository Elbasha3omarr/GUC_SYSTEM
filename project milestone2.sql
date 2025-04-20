CREATE DATABASE Advising_Team_Your_Team_Number ;
USE Advising_Team_Your_Team_Number
GO
CREATE PROCEDURE CreateAllTables

AS
	CREATE TABLE  Advisor(
		advisor_id int primary key identity,
		name varchar(40),
		email varchar(40),
		office varchar(40),
		password varchar(40)
	)
	CREATE TABLE Student(
		student_id int PRIMARY KEY identity,
		f_name varchar(40),
		l_name varchar(40),
		gpa decimal(4,2),
		faculty varchar(40),
		email varchar(40),
		major varchar(40),
		password varchar(40),
		financial_status bit ,
		semester int,
		acquired_hours int,
		assigned_hours int,
		advisor_id int

		FOREIGN KEY(advisor_id) REFERENCES Advisor(advisor_id) ON DELETE CASCADE ON UPDATE CASCADE
	)
		CREATE TABLE Student_Phone(
		student_id int,
		phone_number varchar(40)
		FOREIGN KEY(student_id) references Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
		primary key(student_id,phone_number)
	)
	CREATE TABLE Course (
		course_id int primary key IDENTITY,
		name varchar(40),
		major varchar(40),
		is_offered bit,
		credit_hours int,
		semester int
	)
	CREATE TABLE PreqCourse_course(
		prerequisite_course_id int,
		course_id int,
		FOREIGN KEY(prerequisite_course_id) REFERENCES Course(course_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
		FOREIGN KEY(course_id) REFERENCES Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
		PRIMARY KEY(prerequisite_course_id, course_id)
	)

	CREATE TABLE Instructor(
		instructor_id int primary key identity,
		name varchar(40),
		email varchar(40),
		faculty varchar(40),
		office varchar(40),
	)

	CREATE TABLE Instructor_Course(
		course_id int FOREIGN KEY(course_id) references Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
		instructor_id int Foreign KEY(instructor_id) references Instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE,
		
		primary key(course_id,instructor_id)
	)
	CREATE TABLE Student_Instructor_Course_Take(
		student_id int FOREIGN KEY(student_id) references Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
		course_id int FOREIGN KEY(course_id) references Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
		instructor_id int FOREIGN KEY(instructor_id) references Instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE,
		semester_code varchar(40),
		exam_type varchar(40),
		grade varchar(40),
		primary key(student_id,course_id,semester_code)
	)
		CREATE TABLE Semester(
		semester_code varchar(40) primary key  ,
		start_date date,
		end_date date,
	)
		CREATE TABLE Course_Semester(
		course_id int FOREIGN KEY(course_id) references Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
		semester_code varchar(40) FOREIGN KEY (semester_code) references Semester(semester_code) ON DELETE CASCADE ON UPDATE CASCADE
		primary key(course_id,semester_code)
		
	)
		CREATE TABLE Slot(
		slot_id int primary key identity,
		day varchar(40),
		time varchar(40),
		location varchar(40),
		course_id int FOREIGN KEY(course_id) references Course(course_id) ON DELETE  CASCADE ON UPDATE CASCADE,
		instructor_id int FOREIGN KEY(instructor_id) references Instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE
	)

		CREATE TABLE Graduation_Plan (
		plan_id int IDENTITY , 
		semester_code varchar(40),
		semester_credit_hours int, 
		expected_grad_date date, 
		advisor_id int FOREIGN KEY(advisor_id) references Advisor(advisor_id) ,
		student_id int FOREIGN KEY(student_id) references Student(student_id),
		PRIMARY KEY(plan_id,semester_code)
		)
		CREATE TABLE GradPlan_Course (
			plan_id int,
			semester_code varchar(40),
			course_id int,
			FOREIGN KEY(plan_id, semester_code) REFERENCES Graduation_Plan(plan_id, semester_code) ON DELETE CASCADE ON UPDATE CASCADE,
			PRIMARY KEY(plan_id, semester_code, course_id)
		)
		CREATE TABLE Request (
		request_id int primary key identity,
		type varchar(40),
		comment varchar(40),
		status varchar(40) DEFAULT 'pending',
		credit_hours int,
		student_id int ,
		advisor_id int ,
		course_id int,
		FOREIGN KEY(student_id) references Student(student_id) ON DELETE NO ACTION ,
		FOREIGN KEY(advisor_id) references Advisor(advisor_id) ON DELETE NO ACTION ,
		FOREIGN KEY(course_id) references Course(course_id) ON DELETE NO ACTION 
	)
	CREATE TABLE MakeUp_Exam(
		exam_id int primary key IDENTITY,
		date datetime, 
		type varchar(40) DEFAULT 'Normal', 
		course_id int Foreign KEY(course_id) references Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE
	)
	CREATE TABLE Exam_Student(
		exam_id int Foreign KEY(exam_id) references MakeUp_Exam(exam_id) ON DELETE CASCADE ON UPDATE CASCADE,
		student_id int Foreign KEY(student_id) references Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
		course_id int,
		primary key(exam_id,student_id)
	)

	CREATE TABLE Payment(
		payment_id int primary key identity,
		amount decimal(4,2),
		deadline date,
		n_installment int,
		status varchar(40) DEFAULT 'notPaid',
		fund_percentage decimal(4,2),
		start_date datetime,
		student_id int FOREIGN KEY(student_id) references Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE ,
		semester_code varchar(40) FOREIGN KEY(semester_code) references Semester(semester_code) ON DELETE CASCADE ON UPDATE CASCADE,
	)
	
	CREATE TABLE Installment(
		payment_id int FOREIGN KEY(payment_id) references Payment(payment_id) ON DELETE CASCADE ON UPDATE CASCADE,
		deadline datetime ,
		amount decimal(8,2),
		status varchar(40) DEFAULT 'notPaid',
		start_date datetime,
		primary key(payment_id,deadline)
	)

		GO
EXEC CreateAllTables

GO
CREATE PROCEDURE DropAllTables
AS
DROP TABLE Student_Instructor_Course_Take
DROP TABLE Exam_Student
DROP TABLE MakeUp_Exam
DROP TABLE Course_Semester
DROP TABLE Instructor_Course
DROP TABLE PreqCourse_course
DROP TABLE GradPlan_Course
DROP TABLE Graduation_Plan
DROP TABLE Installment
DROP TABLE Payment
DROP TABLE Semester
DROP TABLE Request
DROP TABLE Slot
DROP TABLE Student_Phone
DROP TABLE Student
DROP TABLE Advisor
DROP TABLE Course
DROP TABLE Instructor

GO
EXEC DropAllTables

GO
CREATE PROCEDURE clearAllTables
AS
DELETE FROM Student
DELETE FROM Course
DELETE FROM PreqCourse_course
DELETE FROM Student_Phone
DELETE FROM Instructor
DELETE FROM Instructor_Course
DELETE FROM Student_Instructor_Course_Take
DELETE FROM Semester
DELETE FROM Course_Semester
DELETE FROM Advisor
DELETE FROM Slot
DELETE FROM Graduation_Plan
DELETE FROM Request
DELETE FROM GradPlan_Course
DELETE FROM MakeUp_Exam
DELETE FROM Exam_Student
DELETE FROM Payment
DELETE FROM Installment
GO
EXEC clearAllTables

GO
create view view_Students
As  
select s.* 
from Student s
where s.financial_status=1
GO

GO
create view view_Course_prerequisites 
As  
select c.*, P.prerequisite_course_id 
from Course c INNER JOIN PreqCourse_course P ON c.course_id=P.course_id
GO

GO
create view Instructors_AssignedCourses 
As  
select I.* , C.course_id 
from Instructor I INNER JOIN Instructor_Course IC ON I.instructor_id=IC.instructor_id INNER JOIN Course c ON IC.course_id= C.course_id 
GO

GO
create view Student_Payment 
As  
select P.* ,S.student_id AS 'student_identity'
from Payment P INNER JOIN Student S ON P.student_id=S.student_id 
GO

GO
create view Courses_Slots_Instructor 
As 
select C.ID ,C.name ,S.*,I.name, S.id , S.day ,S.time ,S.location 
from Slot S INNER JOIN Course C ON S.course_id=C.course_id INNER JOIN Instructor I ON S.instructor_id=I.instructor_id
GO

GO
create view Courses_Slots_Instructor
AS
select C.course_id AS 'course_identity' ,C.name 'course name' ,S.*,I.name FROM Course C INNER JOIN Slot S ON S.course_id=C.course_id 
												     INNER JOIN Instructor I ON I.instructor_id=S.instructor_id
GO

GO
create view Courses_MakeupExams 
As 
select C.name , C.semester ,M.* 
from  MakeUp_Exam M INNER  JOIN Course C ON M.course_id=C.course_id 
GO


GO
create view Students_Courses_transcript 
AS  
select SICT.student_id , S.f_name AS 'student first name',S.l_name AS'student last name', C.course_id , C.name , SICT.exam_type ,SICT.grade,SICT.semester_code,I.name AS 'Instructor name'
from Student_Instructor_Course_Take SICT INNER JOIN Student S ON S.student_id=SICT.student_id 
										 INNER JOIN Course C ON C.course_id=SICT.course_id 
										 INNER JOIN Instructor I ON I.instructor_id=SICT.instructor_id
GO

GO
create view Semster_offered_Courses 
As  
select C.name ,C.course_id , CS.semester_code 
from Course_Semester CS	INNER JOIN Course C ON C.course_id=CS.course_id
GO

GO
create view Advisors_Graduation_Plan 
As 
select GP.* , A.advisor_id AS 'advisor identity' , A.name  
from Graduation_Plan GP INNER JOIN Advisor A ON A.advisor_id=GP.advisor_id
GO

GO
CREATE PROCEDURE Procedures_StudentRegistration
	@first_name varchar (40),
	@last_name varchar(40),
	@password varchar(40),
	@faculty varchar(40),
	@email varchar(40),
	@major varchar(40),
	@semester int
	AS
	
	INSERT INTO Student (f_name, l_name, password, faculty, email, major, semester)
	VALUES (@first_name, @last_name, @password, @faculty, @email, @major, @semester);
GO
DECLARE @student_id int
EXEC Procedures_StudentRegistration 'Mohamed', 'Abdallah', '11110','Engineering','Mohamed.Abdallah@student.guc.edu.eg','MET',2
SELECT @student_id=student_id FROM Student WHERE student_id=(SELECT max(student_id) FROM Student)
print @student_id



GO
CREATE PROCEDURE Procedures_AdvisorRegistration
	@advisor_name varchar (40),
	@password varchar (40),
	@email varchar (40),
	@office varchar (40)
AS
	INSERT INTO Advisor (name,email,office, password)
	VALUES (@advisor_name,@email, @office, @password)
GO 
DECLARE @advisor_id INT
SELECT @advisor_id=advisor_id FROM Advisor where advisor_id=(SELECT max(advisor_id)FROM Advisor)
EXEC Procedures_AdvisorRegistration 'omar','1010','ahmed@yahoo','d001'

print @advisor_id
GO

CREATE PROCEDURE Procedures_AdminListStudents
AS
	SELECT * FROM Student
GO
EXEC Procedures_AdminListStudents

GO
CREATE PROCEDURE Procedures_AdminListAdvisors
AS
	SELECT * FROM Advisor
GO
EXEC Procedures_AdminListAdvisors


GO
CREATE PROCEDURE AdminListStudentsWithAdvisors
	AS
		SELECT * FROM Student INNER JOIN Advisor ON Student.advisor_id=Advisor.advisor_id

GO
EXEC AdminListStudentsWithAdvisors

go
CREATE PROCEDURE AdminAddingSemester
	@start_date date,
	@end_date date,
	@semester_code varchar(40)
	AS
		INSERT INTO Semester(start_date,end_date,semester_code)
		VALUES (@start_date,@end_date,@semester_code)
	GO

GO
CREATE PROCEDURE Procedures_AdminAddingCourse
@major varchar (40), 
@semester int, 
@credit_hours int,
@course_name varchar (40), 
@offered bit
AS
	INSERT INTO Course(major,semester,credit_hours,name,is_offered)
	VALUES (@major,@semester,@credit_hours,@course_name,@offered)
GO
EXEC Procedures_AdminAddingCourse 'MET',5,2,'CSEN601',1

GO
CREATE PROCEDURE Procedures_AdminLinkInstructor 
@InstructorId int, 
@courseId int,
@slotID int
AS
	UPDATE Slot SET course_id=@courseID ,
				    instructor_id=@InstructorId WHERE slot_id=@slotID


GO
EXEC Procedures_AdminLinkInstructor 3,21,5


GO
CREATE PROCEDURE Procedures_AdminLinkStudent
@Instructor_Id int, 
@student_ID int, 
@course_ID int,
@semester_code varchar (40) 
AS
	
	INSERT INTO Student_Instructor_Course_Take(student_id, course_id, instructor_id,semester_code)
	VALUES(@student_ID,@course_ID,@Instructor_Id,@semester_code)
GO
EXEC Procedures_AdminLinkStudent 1,31,4,'S24'


GO
CREATE PROCEDURE AdminLinkStudentToAdvisor
@studentID int,
@advisorID int	
AS
	UPDATE Student SET advisor_id=@advisorID where student_id=@studentID
GO
EXEC AdminLinkStudentToAdvisor @studentID=1,@advisorID=1


GO
CREATE PROCEDURE Procedures_AdminAddExam
	@Type varchar (40), 
	@date datetime, 
	@courseID int
	AS
	INSERT INTO MakeUp_Exam( date, type, course_id)
				VALUES (@date,@Type,@courseID)
GO
EXEC Procedures_AdminAddExam '2nd chance','2024/09/30',2

GO
CREATE PROCEDURE Procedures_AdminIssueInstallment 
@payment_ID int
AS
	DECLARE @amount int
	DECLARE @numinstallment int
	DECLARE @PAY_start_date date
	DECLARE @Pay_deadline date
	DECLARE @Ins_start date
	DECLARE @amount_per_ins int
	DECLARE @ins_deadline date
	DECLARE @x int
	Set @x=0

	SELECT @amount=amount,@PAY_start_date=start_date,@Pay_deadline=deadline,@numinstallment=DATEDIFF(MONTH,@PAY_start_date,@Pay_deadline) FROM Payment WHERE payment_id=@payment_ID
	UPDATE Payment SET n_installment=@numinstallment WHERE payment_id=@payment_ID
	SET @amount_per_ins=@amount/@numinstallment
	SET @Ins_start=@PAY_start_date
	WHILE (@x< @numinstallment)
	BEGIN
		SET @ins_deadline=DATEADD(MONTH,1,@Ins_start)
		INSERT INTO Installment(payment_id,deadline,amount,start_date)
		VALUES(@payment_ID,@ins_deadline,@amount_per_ins,@Ins_start)
		SET @Ins_start=@ins_deadline
		SET @x = @x+1
	END
	GO
	EXEC Procedures_AdminIssueInstallment @payment_ID=8

GO


GO
CREATE PROCEDURE Procedures_AdminDeleteCourse
@courseID int
AS
	DELETE FROM Course where course_id=@courseID
GO
Exec Procedures_AdminDeleteCourse 2

GO
CREATE PROCEDURE Procedure_AdminUpdateStudentStatus
@StudentID int
AS
DECLARE @installmentstatus varchar(40)
DECLARE @deadline date
DECLARE @payment_id int
SELECT @payment_id=payment_id FROM Payment where student_id=@StudentID

DECLARE @sum int
DECLARE @amount int
SELECT @amount=amount FROM Payment where payment_id=@payment_id
select @sum=sum(amount) FROM Installment where payment_id=@payment_id and status='Paid' AND CURRENT_TIMESTAMP<deadline
UPDATE Payment SET fund_percentage=@sum/@amount * 100

SELECT @installmentstatus=status from Installment where payment_id=@payment_id AND deadline<CURRENT_TIMESTAMP

if @installmentstatus='notPaid' 
begin
	UPDATE Student set Student.financial_status =0 where student_id=@StudentID
end
else
begin
	UPDATE Student set Student.financial_status =1 where student_id=@StudentID
end
GO
EXEC Procedure_AdminUpdateStudentStatus 34


GO
CREATE VIEW all_Pending_Requests
AS
SELECT R.*,S.f_name,A.name FROM Request R INNER JOIN Student S ON S.student_id=R.student_id
						INNER JOIN Advisor A ON A.advisor_id=R.advisor_id WHERE status='pending'

GO

CREATE PROCEDURE Procedures_AdminDeleteSlots
@current_semester varchar (40)
AS

DECLARE @course_id int
SELECT @course_id=course_id FROM Course_Semester where semester_code=@current_semester
DELETE FROM Slot WHERE course_id<>@course_id

GO
EXEC Procedures_AdminDeleteSlots 'W24'



GO	
CREATE FUNCTION [FN_AdvisorLogin]
(@id int,@password varchar(40))
returns bit
AS
BEGIN
	DECLARE @Success bit 
	DECLARE @advisor_id int
	DECLARE @advisor_password varchar(40)
	SELECT @advisor_id=advisor_id,@advisor_password=password FROM Advisor where advisor_id=@id AND password=@password

if @advisor_id is null OR @password is null
	BEGIN 
		SET @Success=0
	END
ELSE
	BEGIN
		SET @Success=1
	END

RETURN @Success

END
GO

DECLARE @LoginSuccess bit
SET @LoginSuccess = dbo.FN_AdvisorLogin(2,'1010');
print @LoginSuccess

GO 
CREATE PROCEDURE Procedures_AdvisorCreateGP
@Semester_code varchar (40),
@expected_graduation_date date, 
@sem_credit_hours int,
@advisor_id int, 
@student_id int
AS
INSERT INTO Graduation_Plan(semester_code,semester_credit_hours,expected_grad_date,advisor_id,student_id)
VALUES(@Semester_code,@sem_credit_hours,@expected_graduation_date,@advisor_id,@student_id)

GO
EXEC Procedures_AdvisorCreateGP 'W24','2028-06-30',32,1,34

GO
CREATE PROCEDURE Procedures_AdvisorAddCourseGP
@student_id int, 
@Semester_code varchar (40), 
@course_name varchar (40)
AS
DECLARE @course_id int
DECLARE @plan_id int
SELECT @course_id=course_id FROM Course where name=@course_name
SELECT @plan_id=plan_id FROM Graduation_Plan WHERE student_id=@student_id AND semester_code=@Semester_code

if @plan_id is null
	BEGIN 
		print('student id is incorrect or incorrect semester code')
	END
ELSE
	BEGIN
		INSERT INTO GradPlan_Course(plan_id,semester_code,course_id)
		VALUES(@plan_id,@Semester_code,@course_id)
	END
GO
EXEC Procedures_AdvisorAddCourseGP 34,'W24','Drawing101'


GO
CREATE PROCEDURE Procedures_AdvisorUpdateGP
	@expected_grad_semster varchar (40),
	@studentID int
AS
UPDATE Graduation_Plan SET semester_code=@expected_grad_semster where student_id=@studentID
GO

EXEC Procedures_AdvisorUpdateGP

GO
CREATE PROCEDURE Procedures_AdvisorDeleteFromGP
@studentID int, 
@semester_code varchar (40),
@courseID int
AS
DECLARE @plan_id int

select @plan_id=plan_id FROM Graduation_Plan  WHERE student_id=@studentID AND semester_code=@semester_code 

DELETE FROM GradPlan_Course where semester_code=@semester_code AND course_id=@courseID AND plan_id=@plan_id

GO
EXEC Procedures_AdvisorDeleteFromGP 31,'S24',4


GO
CREATE FUNCTION [FN_Advisors_Requests]
(@advisorID INT)
RETURNS  Table
AS
 Return (SELECT * FROM Request where advisor_id=@advisorID)
GO
SELECT * FROM dbo.FN_Advisors_Requests(3)


GO
CREATE PROCEDURE Procedures_AdvisorApproveRejectCHRequest
@requestID int,
@Current_semester_code varchar(40)
AS
DECLARE @credithours int
declare @studentid int
DECLARE @assignedhours int
DECLARE @GPA decimal
DECLARE @cost int
DECLARE @amount int
SELECT @studentid=student_id,@credithours=credit_hours FROM Request where request_id=@requestID
select @GPA=gpa,@assignedhours=assigned_hours FROM Student where student_id=@studentid

SET @cost=@credithours*1000
SELECT @amount=amount from Payment where semester_code=@Current_semester_code AND student_id=@studentid
SET @amount=@amount+@cost

if @credithours<=3 OR @GPA<=3.7 AND @assignedhours+@credithours<=34
	BEGIN
			UPDATE Request SET status= 'Accepted'
			update Student SET assigned_hours=@assignedhours+@credithours
			UPDATE Payment SET amount=@amount where semester_code=@Current_semester_code AND student_id=@studentid
	END
ELSE
	Begin
			UPDATE Request SET status= 'Rejected'

	END
GO
EXEC Procedures_AdvisorApproveRejectCHRequest 1,'S24'

GO
CREATE PROCEDURE Procedures_AdvisorViewPendingRequests
@Advisor_ID int
AS
	SELECT R.* from Request R INNER JOIN Student S ON S.student_id=R.student_id where R.advisor_id=@Advisor_ID AND R.status='pending'
GO
EXEC Procedures_AdvisorViewPendingRequests 5

GO

CREATE PROCEDURE Procedures_AdvisorViewAssignedStudents
@AdvisorID int,
@major varchar(40)
AS
SELECT S.student_id,S.f_name+' '+S.l_name AS name,S.major from Student S INNER JOIN Graduation_Plan GP ON S.student_id=GP.student_id
																		 INNER JOIN GradPlan_Course GPC ON GP.plan_id=GPC.plan_id
																		 INNER JOIN Course C ON C.course_id=GPC.course_id
																		 WHERE S.advisor_id=@AdvisorID AND S.major=@major 
GO
EXEC Procedures_AdvisorViewAssignedStudents


GO
CREATE PROCEDURE Procedures_AdvisorApproveRejectCourseRequest
	@RequestID int,
	@studentID int,
	@advisorID int 
AS
DECLARE @courseid int 
DECLARE @numprerequisite int
DECLARE @num int
DECLARE @GPA decimal(4,2)
DECLARE @tookpreq bit
DECLARE @course_credit_hour int

SELECT @courseid=course_id FROM Request where @RequestID=request_id

SELECT @numprerequisite=COUNT(*) FROM PreqCourse_course where course_id=@courseid

SELECT @num=COUNT(*) FROM (SELECT SICT.course_id AS 'STUDENT INSTRUCTOR course',SICT.grade
	FROM Student_Instructor_Course_Take SICT INNER JOIN ( SELECT * FROM PreqCourse_course PC WHERE course_id = @courseid) AS PC ON PC.prerequisite_course_id = SICT.course_id AND SICT.grade IS NOT NULL
) AS SICTPC

IF @num=@numprerequisite 
	BEGIN
		SET @tookpreq=1
	END
ELSE
BEGIN
	SET @tookpreq=0
END

DECLARE @assignedhourlimitflag bit
DECLARE @assigned_hour int
DECLARE @Course_credithour int
SELECT @assigned_hour=assigned_hours FROM Student WHERE student_id=@studentID
SELECT @course_credit_hour=course_id FROM Course WHERE course_id=@courseid
if @assigned_hour-@course_credit_hour<0
	BEGIN
		SET @assignedhourlimitflag=0
	END
ELSE
	BEGIN
		SET @assignedhourlimitflag=1
		UPDATE Student SET assigned_hours=@assigned_hour-@course_credit_hour
	END

	IF @assignedhourlimitflag=1 AND @tookpreq=1 
		BEGIN
			UPDATE Request SET status='accepted' where request_id=@RequestID
		END
	ELSE
		BEGIN
			UPDATE Request SET status='rejected' where request_id=@RequestID
		END
GO

GO
CREATE PROCEDURE Procedures_StudentaddMobile
@StudentID int, 
@mobile_number varchar (40)
AS
INSERT INTO Student_Phone(student_id, phone_number)
VALUES(@StudentID,@mobile_number)

GO
EXEC Procedures_StudentaddMobile



GO
CREATE PROCEDURE Procedures_StudentSendingCourseRequest
@Student_ID int, 
@course_ID int, 
@type varchar (40), 
@comment varchar (40) 
AS
DECLARE @advisor_id int
DECLARE @credit_hours int
select @credit_hours=credit_hours FROM Course
select @advisor_id=advisor_id from Student where student_id=@Student_ID
INSERT INTO Request(student_id,course_id,type,comment,credit_hours,advisor_id)
VALUES(@Student_ID,@course_ID,@type,@comment,@credit_hours,@advisor_id)

GO
EXEC Procedures_StudentSendingCourseRequest

GO
CREATE PROCEDURE Procedures_StudentSendingCHRequest
@StudentID int, 
@credithours int, 
@type varchar (40),
@comment varchar (40) 
AS

INSERT INTO Request(type,comment,credit_hours,student_id)
VALUES(@type,@comment,@credithours,@StudentID)
GO
EXEC Procedures_StudentSendingCHRequest 34,3,'extra credit hour request','engez'

go
CREATE FUNCTION [FN_StudentLogin]
(@StudentID int, @password varchar (40))
RETURNS bit
as
Begin
  Declare @Success bit
  DECLARE @student_id int
  DECLARE @studentpass varchar(40)
  SELECT @student_id=student_id,@studentpass=password FROM Student where student_id=@StudentID AND password=@password
  if @student_id is null OR @studentpass is null
    set @Success=0
  else
    set @Success=1
  Return @Success
end
go

GO
CREATE FUNCTION[FN_StudentUpcoming_installment]
(@StudentID int)
RETURNS DATE
AS
BEGIN
	DECLARE @deadline datetime
	DECLARE @payment_id int
	SELECT @payment_id=payment_id FROM Payment where student_id=@StudentID
	SELECT @deadline=I.deadline FROM Installment I INNER JOIN Payment P ON P.payment_id=I.payment_id where I.payment_id=@payment_id AND I.status='notPaid' ORDER BY I.deadline DESC
	RETURN @deadline
END
GO
DECLARE @deadline datetime
SET @deadline=dbo.FN_StudentUpcoming_installment(32)
print @deadline
SELECT * FROM Installment 

GO
CREATE PROCEDURE Procedures_StudentRegisterFirstMakeup
	 @StudentID int, 
	 @courseID int, 
	 @studentCurrent_semester varchar (40)
	 AS
		Declare @exam_id int
		DECLARE @grade varchar(40)
		DECLARE @extype VARCHAR(40)
		SELECT @grade=grade,@extype=exam_type FROM Student_Instructor_Course_Take where student_id=@StudentID AND course_id=@courseID
		if (@grade='FF'OR @grade='F') AND @extype='Normal'
			INSERT INTO Student_Instructor_Course_Take(student_id,course_id,semester_code,exam_type)
			VALUES(@StudentID,@courseID,@studentCurrent_semester,'First_makeup')
			SELECT @exam_id=exam_id FROM Makeup_Exam order BY exam_id DESC
			INSERT INTO Exam_Student(exam_id,student_id,course_id)
			VALUES(@exam_id,@StudentID,@courseID)
			INSERT INTO MakeUp_Exam(type,course_id)
			VALUES ('First_makeup',@courseID)
			

GO

EXEC Procedures_StudentRegisterFirstMakeup 32,3,'W25'


GO
CREATE FUNCTION [FN_StudentCheckSMEligiability]
(@CourseID int,@StudentID int)
RETURNS bit
AS
BEGIN
DECLARE @counteven int
DECLARE @countodd int

DECLARE @eligible bit

SELECT @countodd=count(*) FROM Course C INNER JOIN Course_Semester CS ON CS.course_id=C.course_id 
									      INNER JOIN Student_Instructor_Course_Take SICT ON SICT.course_id=CS.course_id 
										  WHERE SICT.student_id=@StudentID AND SICT.semester_code LIKE '%Winter%' 
										  AND (SICT.grade='F' OR SICT.grade='FA' or SICT.grade='FF' ) 


SELECT @counteven=count(*) FROM Course C INNER JOIN Course_Semester CS ON CS.course_id=C.course_id 
									      INNER JOIN Student_Instructor_Course_Take SICT ON SICT.course_id=C.course_id 
										  WHERE CS.semester_code LIKE '%Spring%' AND SICT.student_id=@StudentID AND SICT.semester_code LIKE '%S%' 
										  AND (SICT.grade='F' OR SICT.grade='FA' or SICT.grade='FF') 

DECLARE @grade varchar(40)
select @grade=grade from Student_Instructor_Course_Take where student_id=@StudentID AND exam_type='First_makeup' AND course_id=@CourseID

if (@countodd>2 OR @counteven>2) AND @grade is NULL 
	SET @eligible=0
ELSE
	SET @eligible=1

RETURN @eligible

END
GO

DECLARE @bit bit
SET @bit=dbo.FN_StudentCheckSMEligiability(30,19)
print @bit

GO
CREATE PROCEDURE Procedures_ViewRequiredCourses
@StudentID int, 
@Current_semester_code Varchar(40)
AS
DECLARE @year int
SELECT @year=YEAR(Start_date) FROM Semester WHERE semester_code='S24'


SELECT C.* FROM Course C INNER JOIN Course_Semester CS ON C.course_id = CS.course_id INNER JOIN Semester Sem ON Sem.semester_code=CS.semester_code
					     INNER JOIN Student_Instructor_Course_Take SICT ON SICT.course_id = C.course_id
						 INNER JOIN Student S ON S.student_id=SICT.student_id  where (
						 (SICT.grade = 'F' OR SICT.grade='FA' OR SICT.grade='FF') 
						 AND CS.semester_code LIKE '%W%' AND SICT.student_id = 33 
						 AND ((SELECT COUNT(*) 
						 FROM Student_Instructor_Course_Take 
					     WHERE student_id = S.student_id AND (grade = 'F' OR grade = 'FA' OR grade = 'FF')) > 2) AND C.is_offered=1
)								   
OR (
						 (SICT.grade = 'F' OR SICT.grade='FA' OR SICT.grade='FF') 
						 AND CS.semester_code LIKE '%S%' AND SICT.student_id = 33 
						 AND ((SELECT COUNT(*) 
						 FROM Student_Instructor_Course_Take 
						 WHERE student_id = S.student_id AND (grade = 'F' OR grade = 'FA' OR grade = 'FF')) > 2) AND C.is_offered=1
						 )

OR 
(
	(SICT.course_id IS NULL OR SICT.grade is null ) AND YEAR(Sem.start_date)<@year 
)

EXEC Procedures_ViewRequiredCourses 33, 'W24'
--SELECT * FROM Student where student_id=33

GO
CREATE PROCEDURE Procedures_StudentRegisterSecondMakeup
@StudentID int, 
@courseID int, 
@StudentCurrentSemester Varchar (40)
AS
BEGIN
    DECLARE @eligible BIT = dbo.FN_StudentCheckSMEligiability(@StudentID,@CourseID )

    IF @eligible = 1
    BEGIN      
			DECLARE @ID int
			INSERT INTO MakeUp_Exam(course_id,type)
			VALUES(@CourseID,'Second_makeup')
			SELECT @ID=exam_id FROM MakeUp_Exam ORDER BY exam_id DESC 
			INSERT INTO Exam_Student (exam_id,student_id, course_id)
            VALUES (@ID,@StudentID, @CourseID)
			INSERT INTO Student_Instructor_Course_Take(student_id,semester_code,course_id,exam_type)
			VALUES(@StudentID,@StudentCurrentSemester,@CourseID,'Second_makeup')
            PRINT 'successful'
      end
	  ELSE
        IF @eligible=0
        BEGIN
        PRINT 'NOT ELIGIBLE'
        END
END
GO
EXEC Procedures_StudentRegisterSecondMakeup 33,19,'S24'
--select * from MakeUp_Exam
SELECT * FROM Student_Instructor_Course_Take WHERE student_id=33
delete from Exam_Student where student_id=33
delete FROM Student_Instructor_Course_Take WHERE student_id=33 and exam_type='Second_makeup'
GO
CREATE PROCEDURE Procedures_ViewOptionalCourse
	@StudentID int, 
	@Current_semester_code varchar(40)
AS

	   DECLARE @year int
	   SELECT @year=YEAR(S.start_date) FROM Semester S where S.semester_code=@Current_semester_code
	   IF @Current_semester_code LIKE '%Winter%'
		   	   SELECT C.* FROM Semester S INNER JOIN Course_Semester CS ON S.semester_code=CS.semester_code 
								  INNER JOIN Course C ON CS.course_id=C.course_id 
								  INNER JOIN PreqCourse_course PC ON PC.course_id=C.course_id
								  INNER JOIN Student_Instructor_Course_Take SICT ON SICT.course_id=PC.prerequisite_course_id AND SICT.student_id=@StudentID
								  WHERE YEAR(S.start_date)>=@year AND SICT.grade IS NOT NULL AND SICT.semester_code LIKE '%Winter%'
		else if @Current_semester_code LIKE '%Spring%'	
			SELECT C.* FROM Semester S INNER JOIN Course_Semester CS ON S.semester_code=CS.semester_code 
								  INNER JOIN Course C ON CS.course_id=C.course_id 
								  INNER JOIN PreqCourse_course PC ON PC.course_id=C.course_id
								  INNER JOIN Student_Instructor_Course_Take SICT ON SICT.course_id=PC.prerequisite_course_id AND SICT.student_id=@StudentID
								  WHERE YEAR(S.start_date)>=@year AND SICT.grade IS NOT NULL AND SICT.semester_code LIKE '%Spring%'
GO
EXEC Procedures_ViewOptionalCourse

SELECT * FROM PreqCourse_course

GO
CREATE PROCEDURE  Procedures_ChooseInstructor
	@StudentID int, 
	@InstructorID int, 
	@CourseID int,
	@current_semester_code varchar(40)
AS
	UPDATE Student_Instructor_Course_Take SET instructor_id=@InstructorID WHERE student_id=@StudentID AND course_id=@CourseID and semester_code=@current_semester_code

GO
EXEC Procedures_ChooseInstructor

GO
CREATE PROCEDURE Procedures_ViewMS 
@StudentID int
AS
DECLARE @major varchar(40)
SELECT @major=major FROM Student where student_id=@StudentID

SELECT * FROM Course where major=@major 
EXCEPT 
SELECT C.*  FROM Course C INNER JOIN Student_Instructor_Course_Take SICT ON C.course_id=SICT.course_id 
WHERE SICT.grade is null AND SICT.student_id=@StudentID
go

EXEC Procedures_ViewMS 31


GO
CREATE FUNCTION [FN_SemsterAvailableCourses]
(@semester_code varchar (40) )
RETURNS TABLE
AS
RETURN (SELECT C.* FROM Course_Semester CS INNER JOIN Course C ON CS.course_id=C.course_id  where CS.semester_code=@semester_code)
GO
SELECT * FROM dbo.FN_SemsterAvailableCourses('W24')


GO
CREATE FUNCTION[FN_StudentViewGP]
(@student_ID int)
RETURNS TABLE
AS
RETURN( SELECT S.student_id,S.f_name +' '+ S.l_name AS 'Student_name',GP.plan_id,C.course_id,C.name,GP.semester_code,GP.expected_grad_date,GP.semester_credit_hours,GP.advisor_id FROM Student S INNER JOIN Graduation_Plan GP ON S.student_id=GP.student_id
																							INNER JOIN GradPlan_Course GPC ON GPC.plan_id=GP.plan_id
																							INNER JOIN Course C ON GPC.course_id=C.course_id
																							WHERE S.student_id=@student_ID)

GO
SELECT * FROM dbo.FN_StudentViewGP(33)

GO
CREATE FUNCTION [FN_StudentViewSlot]
(@CourseID int, @InstructorID int)
RETURNS TABLE
AS
RETURN(SELECT S.slot_id,S.location,S.time,S.day,C.name AS 'Course name',I.name 'Instructor name' from Slot S INNER JOIN Course C ON S.course_id=C.course_id
																   INNER JOIN Instructor I ON I.instructor_id=S.instructor_id 
																   WHERE S.course_id=@CourseID AND S.instructor_id=@InstructorID)
GO
select * from dbo.FN_StudentViewSlot(2,1)
