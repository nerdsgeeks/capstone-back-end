
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployees]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT    ID, firstName, lastName, email, phoneNumber, shiftSchadule, employeeID, employeeType, imageURL
 FROM [dbo].[Employee];
END
GO