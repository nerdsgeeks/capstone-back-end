
/****** Object:  StoredProcedure [dbo].[Getuser]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Getuser]
  @username varchar(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ID,FirstName,LastName,EmployeeType,Password,imageURL FROM [dbo].[Employee]
	   WHERE [EmployeeID] = @username;
END
GO