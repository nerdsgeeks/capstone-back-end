
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login]
    @Username varchar(20),
    @Password varchar(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID int;

    SELECT @UserID = ID
    FROM [dbo].[Employee]
    WHERE [EmployeeID] = @Username
    AND [Password] = @Password;

    IF @UserID IS NOT NULL
    BEGIN
        SELECT 'Login successful' AS [Status], @UserID AS [UserID];
    END
    ELSE
    BEGIN
        SELECT 'Invalid username or password' AS [Status], NULL AS [UserID];
    END
END
GO