
/****** Object:  StoredProcedure [dbo].[UpdateToken]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateToken]
    @ID int,
    @refreshToken varchar(150)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Employee]
    SET 
        refreshToken = @refreshToken
    WHERE [ID] = @ID;
END
GO