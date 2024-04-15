
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
    @ID int,
    @FirstName varchar(50),
    @LastName varchar(50),
    @Email varchar(50),
    @PhoneNumber varchar(20),
    @ShiftSchadule varchar(500),
    @EmployeeID varchar(20),
    @Password varbinary(100),
    @EmployeeType int
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Employee]
    SET [FirstName] = @FirstName,
        [LastName] = @LastName,
        [Email] = @Email,
        [PhoneNumber] = @PhoneNumber,
        [ShiftSchadule] = @ShiftSchadule,
        [EmployeeID] = @EmployeeID,
        [Password] = @Password,
        [EmployeeType] = @EmployeeType
    WHERE [ID] = @EmployeeID;
END

GO