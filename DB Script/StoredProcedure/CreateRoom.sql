
/****** Object:  StoredProcedure [dbo].[CreateRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRoom]
    @RoomName varchar(50),
    @RoomTypeID int,
    @Floor int,
    @RoomStatus varchar(50),
    @RoomImageUrl varchar(150)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Rooms] ([RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl])
    VALUES (@RoomName, @RoomTypeID, @Floor, @RoomStatus, @RoomImageUrl);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END
GO