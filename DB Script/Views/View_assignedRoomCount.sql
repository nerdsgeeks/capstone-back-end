
/****** Object:  View [dbo].[View_assignedRoomCount]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_assignedRoomCount]
AS
SELECT        COUNT(*) AS AssignedRoomCount, cleaningStatus, SUBSTRING(CONVERT(varchar, assignedDateTime), 1, 11) AS assignedDate
FROM            dbo.AssignedRoom
GROUP BY cleaningStatus, SUBSTRING(CONVERT(varchar, assignedDateTime), 1, 11)
GO
/****** Object:  View [dbo].[View_AssignedRoomsInfo]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AssignedRoomsInfo]
AS
SELECT        ar.ID AS assignedRoomID, ar.ID, ar.roomID, ar.assignedDateTime, ar.assignedEmployeeID, ar.cleaningStatus, ar.isCompleted, ar.verifiedPhotoUrl, ar.startTime, ar.endTime, ar.cleaningDuration, ar.isHelperRequested, 
                         ar.reguestedHelperID, ar.AdditionalNotes, ar.inspectionFeedback, ar.rating, ar.inspectionPhotos, ar.inspectionNotes, ar.isHelperRequestedApproved, ar.helperRequestedAdditionalNotes, r.RoomName, r.Floor, r.RoomImageUrl, 
                         rt.roomTypeName, res.guestName, res.AdditionalNotes AS reservationNotes, res.CheckinDate AS checkIn, res.CheckoutDate AS checkOut, res.noOfGuest, e.firstName, e.lastName, e.employeeType
FROM            dbo.AssignedRoom AS ar LEFT OUTER JOIN
                         dbo.Rooms AS r ON ar.roomID = r.ID INNER JOIN
                         dbo.RoomTypes AS rt ON r.RoomTypeID = rt.ID LEFT OUTER JOIN
                         dbo.Reservation AS res ON ar.ID = res.ID LEFT OUTER JOIN
                         dbo.Employee AS e ON ar.assignedEmployeeID = e.ID
GO