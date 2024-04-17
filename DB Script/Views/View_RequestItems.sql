
/****** Object:  View [dbo].[View_RequestItems]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_RequestItems]
AS
SELECT        dbo.Items.ID, dbo.Items.ItemName, dbo.Items.AvailableNum, dbo.Items.Description, dbo.Items.ImageUrl, dbo.Items.GroupName, dbo.Items.ItemType, dbo.RequestItem.Quantity, dbo.RequestItem.Note, 
                         dbo.RequestItem.RequestedDateTime, dbo.RequestItem.isCompleted, dbo.Employee.firstName, dbo.Employee.lastName, Employee_1.firstName AS SupervisiorFirstName, Employee_1.lastName AS SupervisiorLastName, 
                         dbo.Employee.ID AS requesterId, dbo.Rooms.RoomName, dbo.RequestItem.approvedBySupervisorID, dbo.RequestItem.assignedRoomID, dbo.RequestItem.ID AS requestItemId, 
                         dbo.Employee.imageURL AS employeeImageURL, dbo.RequestItem.requestItemStatus
FROM            dbo.Rooms INNER JOIN
                         dbo.AssignedRoom INNER JOIN
                         dbo.Employee ON dbo.AssignedRoom.assignedEmployeeID = dbo.Employee.ID ON dbo.Rooms.ID = dbo.AssignedRoom.roomID RIGHT OUTER JOIN
                         dbo.Employee AS Employee_1 RIGHT OUTER JOIN
                         dbo.RequestItem ON Employee_1.ID = dbo.RequestItem.approvedBySupervisorID ON dbo.AssignedRoom.ID = dbo.RequestItem.assignedRoomID LEFT OUTER JOIN
                         dbo.Items ON dbo.RequestItem.RequestedItemID = dbo.Items.ID
GO