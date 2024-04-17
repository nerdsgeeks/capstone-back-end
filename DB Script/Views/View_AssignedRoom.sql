
/****** Object:  View [dbo].[View_AssignedRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AssignedRoom]
AS
SELECT dbo.AssignedRoom.assignedDateTime, dbo.AssignedRoom.cleaningStatus, dbo.AssignedRoom.startTime, dbo.AssignedRoom.endTime, dbo.AssignedRoom.cleaningDuration, dbo.AssignedRoom.isHelperRequested, 
                  dbo.AssignedRoom.reguestedHelperID, dbo.AssignedRoom.AdditionalNotes, Employee_1.firstName, Employee_1.lastName, dbo.Rooms.RoomName, dbo.Rooms.Floor, Employee_1.employeeType, dbo.Rooms.RoomTypeID, 
                  dbo.AssignedRoom.roomID, dbo.Rooms.RoomImageUrl, dbo.AssignedRoom.assignedEmployeeID, dbo.RoomTypes.roomTypeName, dbo.Reservation.CheckinDate, dbo.Reservation.CheckoutDate, dbo.Reservation.guestName, 
                  dbo.Reservation.noOfGuest, dbo.AssignedRoom.inspectionFeedback, dbo.AssignedRoom.rating, dbo.AssignedRoom.inspectionPhotos, dbo.AssignedRoom.inspectionNotes, dbo.Rooms.RoomTier, 
                  dbo.Employee.firstName AS HelperFirstName, dbo.Employee.lastName AS HelperLastName, dbo.Rooms.RoomStatus, dbo.AssignedRoom.isCompleted, dbo.AssignedRoom.isHelperRequestedApproved, dbo.AssignedRoom.ID, 
                  dbo.AssignedRoom.helperRequestedAdditionalNotes, Employee_1.imageURL AS employeeImageURL
FROM     dbo.AssignedRoom LEFT OUTER JOIN
                  dbo.Employee ON dbo.AssignedRoom.reguestedHelperID = dbo.Employee.ID LEFT OUTER JOIN
                  dbo.RoomTypes INNER JOIN
                  dbo.Rooms ON dbo.RoomTypes.ID = dbo.Rooms.RoomTypeID INNER JOIN
                  dbo.Reservation ON dbo.Rooms.ID = dbo.Reservation.RoomID ON dbo.AssignedRoom.roomID = dbo.Rooms.ID LEFT OUTER JOIN
                  dbo.Employee AS Employee_1 ON dbo.AssignedRoom.assignedEmployeeID = Employee_1.ID
GO