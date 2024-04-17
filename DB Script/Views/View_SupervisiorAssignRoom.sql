
/****** Object:  View [dbo].[View_SupervisiorAssignRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_SupervisiorAssignRoom]
AS
SELECT        dbo.Rooms.RoomStatus, dbo.Rooms.RoomName, dbo.Rooms.RoomTypeID, dbo.Rooms.Floor, dbo.Rooms.RoomImageUrl, dbo.Rooms.RoomTier, dbo.AssignedRoom.ID, dbo.AssignedRoom.roomID, 
                         dbo.AssignedRoom.assignedDateTime, dbo.AssignedRoom.assignedEmployeeID, dbo.AssignedRoom.cleaningStatus, dbo.AssignedRoom.isCompleted, dbo.AssignedRoom.verifiedPhotoUrl, dbo.AssignedRoom.startTime, 
                         dbo.AssignedRoom.endTime, dbo.AssignedRoom.cleaningDuration, dbo.AssignedRoom.isHelperRequested, dbo.AssignedRoom.reguestedHelperID, dbo.AssignedRoom.AdditionalNotes, dbo.AssignedRoom.inspectionFeedback, 
                         dbo.AssignedRoom.rating, dbo.AssignedRoom.inspectionPhotos, dbo.AssignedRoom.inspectionNotes
FROM            dbo.AssignedRoom LEFT OUTER JOIN
                         dbo.Rooms ON dbo.AssignedRoom.roomID = dbo.Rooms.ID
GO
ALTER TABLE [dbo].[AssignedRoom] ADD  DEFAULT ('00:00:00') FOR [cleaningDuration]
GO
ALTER TABLE [dbo].[AssignedRoom] ADD  CONSTRAINT [DF_AssignedRoom_inspectionReviews]  DEFAULT ('') FOR [inspectionFeedback]
GO
ALTER TABLE [dbo].[AssignedRoom] ADD  CONSTRAINT [DF_AssignedRoom_rating]  DEFAULT ((0)) FOR [rating]
GO
ALTER TABLE [dbo].[AssignedRoom] ADD  CONSTRAINT [DF_AssignedRoom_inspectionPhotos]  DEFAULT ('') FOR [inspectionPhotos]
GO
ALTER TABLE [dbo].[AssignedRoom] ADD  CONSTRAINT [DF_AssignedRoom_inspectionNotes]  DEFAULT ('') FOR [inspectionNotes]
GO
ALTER TABLE [dbo].[AssignedRoom] ADD  DEFAULT ((0)) FOR [isHelperRequestedApproved]
GO
ALTER TABLE [dbo].[AssignedRoom] ADD  DEFAULT ('') FOR [helperRequestedAdditionalNotes]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_refreshToken]  DEFAULT ('') FOR [refreshToken]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_imageURL]  DEFAULT ('') FOR [imageURL]
GO
ALTER TABLE [dbo].[RequestItem] ADD  CONSTRAINT [DF_RequestItem_michelle.williams@example.com
requestItemStatus]  DEFAULT ('') FOR [requestItemStatus]
GO
ALTER TABLE [dbo].[AssignedRoom]  WITH CHECK ADD  CONSTRAINT [FK_AssignedRoom_Employee] FOREIGN KEY([assignedEmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[AssignedRoom] CHECK CONSTRAINT [FK_AssignedRoom_Employee]
GO
ALTER TABLE [dbo].[AssignedRoom]  WITH CHECK ADD  CONSTRAINT [FK_AssignedRoom_Rooms] FOREIGN KEY([roomID])
REFERENCES [dbo].[Rooms] ([ID])
GO
ALTER TABLE [dbo].[AssignedRoom] CHECK CONSTRAINT [FK_AssignedRoom_Rooms]
GO
ALTER TABLE [dbo].[RequestItem]  WITH NOCHECK ADD  CONSTRAINT [FK_RequestItem_AssignedRoom] FOREIGN KEY([assignedRoomID])
REFERENCES [dbo].[AssignedRoom] ([ID])
GO
ALTER TABLE [dbo].[RequestItem] NOCHECK CONSTRAINT [FK_RequestItem_AssignedRoom]
GO
ALTER TABLE [dbo].[RequestItem]  WITH CHECK ADD  CONSTRAINT [FK_RequestItem_Items] FOREIGN KEY([RequestedItemID])
REFERENCES [dbo].[Items] ([ID])
GO
ALTER TABLE [dbo].[RequestItem] CHECK CONSTRAINT [FK_RequestItem_Items]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([ID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Rooms]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomTypes] ([ID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes]
GO