
/****** Object:  View [dbo].[View_room]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_room]
AS
SELECT        dbo.Rooms.ID, dbo.Rooms.RoomName, dbo.Rooms.RoomTypeID, dbo.Rooms.Floor, dbo.Rooms.RoomStatus, dbo.Rooms.RoomImageUrl, dbo.Rooms.RoomTier, dbo.RoomTypes.roomTypeName, dbo.RoomTypes.roomTasks, 
                         dbo.RoomTypes.cleaningDuration
FROM            dbo.Rooms LEFT OUTER JOIN
                         dbo.RoomTypes ON dbo.Rooms.RoomTypeID = dbo.RoomTypes.ID
GO