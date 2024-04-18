
/****** Object:  StoredProcedure [dbo].[DeleteAssignedRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAssignedRoom]
    @ID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[AssignedRoom]
    WHERE [ID] = @ID;
END

GO