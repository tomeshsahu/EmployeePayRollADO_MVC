create database EmployeePayRoll_ADO_WithMVC
use EmployeePayRoll_ADO_WithMVC

---Create Table----
create table EmployeeModel(
Emp_Id int primary key identity,
Emp_Name varchar(100),
Emp_Gender varchar(50),
Emp_Department varchar(50),
Emp_Salary Money,
Emp_StartDate datetime,
emp_Notes varchar(100)
)

drop table EmployeeModel
--select--
select * from EmployeeModel

---StoreProcedure of CreateEmployee-----
alter procedure spAddEmployee(
@Emp_Name varchar(100),
@Emp_Gender varchar(50),
@Emp_Department varchar(50),
@Emp_Salary Money,
@Emp_StartDate datetime,
@Emp_Notes varchar(100)
)
As
Begin try
insert into EmployeeModel(Emp_Name,Emp_Gender,Emp_Department,Emp_Salary,Emp_StartDate,emp_Notes) values(@Emp_Name,@Emp_Gender,@Emp_Department,@Emp_Salary,@Emp_StartDate,@Emp_Notes)
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH


---
exec spAddEmployee 'Ramesh','Male','IT','40000','first notes'
select * from EmployeeModel


--------GetEmployee-----------
alter Procedure spGetAllEmployee
As
Begin try
select * from EmployeeModel
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec spGetAllEmployee

-------Delete Employee--------
alter procedure spDeleteEmployee(@Emp_Id int)
As
Begin try
 DELETE FROM EmployeeModel WHERE Emp_Id = @Emp_Id
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH

-------Update Employee------

alter procedure spUpdateEmployee(
@Emp_Id int,
@Emp_Name varchar(100),
@Emp_Gender varchar(50),
@Emp_Department varchar(50),
@Emp_Salary Money,
@Emp_StartDate datetime,
@Emp_Notes varchar(100))
As
Begin try
 Update EmployeeModel set Emp_Name=@Emp_Name,Emp_Gender=@Emp_Gender,Emp_Department=@Emp_Department,Emp_Salary=@Emp_Salary,Emp_StartDate=@Emp_StartDate,emp_Notes=@Emp_Notes where Emp_Id=@Emp_Id
Select * from EmployeeModel where Emp_Id = @Emp_Id
end try
Begin catch
SELECT 
	ERROR_NUMBER() AS ErrorNumber,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage;
END CATCH
