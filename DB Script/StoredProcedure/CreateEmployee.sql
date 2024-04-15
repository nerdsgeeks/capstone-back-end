

/****** Object:  StoredProcedure [dbo].[CreateEmployee]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateEmployee]
    @FirstName varchar(50),
    @LastName varchar(50),
    @Email varchar(50),
    @PhoneNumber varchar(20),
    @ShiftSchadule varchar(500),
    @EmployeeID varchar(20),
    @Password varchar(100),
    @EmployeeType int,
	@ImageURL varchar(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Employee] ([FirstName], [LastName], [Email], [PhoneNumber], [ShiftSchadule], [EmployeeID], [Password], [EmployeeType],[ImageURL])
    VALUES (@FirstName, @LastName, @Email, @PhoneNumber, @ShiftSchadule, @EmployeeID, @Password, @EmployeeType,@ImageURL);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END

GO