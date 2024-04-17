
/****** Object:  StoredProcedure [dbo].[DeleteRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRoom]
    @RoomID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Rooms]
    WHERE [ID] = @RoomID;
END

GO