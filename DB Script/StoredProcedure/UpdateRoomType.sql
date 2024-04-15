
/****** Object:  StoredProcedure [dbo].[UpdateRoomType]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRoomType]
    @RoomTypeID int,
    @RoomTypeName varchar(50),
    @RoomTasks varchar(max),
    @CleaningDuration varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[RoomTypes]
    SET [roomTypeName] = @RoomTypeName,
        [roomTasks] = @RoomTasks,
        [cleaningDuration] = @CleaningDuration
    WHERE [ID] = @RoomTypeID;
END

GO