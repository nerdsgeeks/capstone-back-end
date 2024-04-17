
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
    @EmployeeID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Employee]
    WHERE [ID] = @EmployeeID;
END

GO