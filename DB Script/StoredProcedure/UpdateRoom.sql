
/****** Object:  StoredProcedure [dbo].[UpdateRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateRoom]
    @RoomID int,
    @RoomName varchar(50),
    @RoomTypeID int,
    @Floor int,
    @RoomStatus varchar(50),
    @RoomImageUrl varchar(150),
	@RoomTier varchar(150)

AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Rooms]
    SET [RoomName] = @RoomName,
        [RoomTypeID] = @RoomTypeID,
        [Floor] = @Floor,
        [RoomStatus] = @RoomStatus,
        [RoomImageUrl] = @RoomImageUrl,
		[RoomTier] = @RoomTier
    WHERE [ID] = @RoomID;
END
GO