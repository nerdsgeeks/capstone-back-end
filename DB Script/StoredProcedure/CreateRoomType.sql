
/****** Object:  StoredProcedure [dbo].[CreateRoomType]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRoomType]
    @RoomTypeName varchar(50),
    @RoomTasks varchar(max),
    @CleaningDuration varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[RoomTypes] ([roomTypeName], [roomTasks], [cleaningDuration])
    VALUES (@RoomTypeName, @RoomTasks, @CleaningDuration);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END

GO