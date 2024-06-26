USE [CleanOpsDB]
GO
/****** Object:  Table [dbo].[AssignedRoom]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[roomID] [int] NOT NULL,
	[assignedDateTime] [datetime] NOT NULL,
	[assignedEmployeeID] [int] NOT NULL,
	[cleaningStatus] [varchar](50) NOT NULL,
	[isCompleted] [bit] NOT NULL,
	[verifiedPhotoUrl] [varchar](150) NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[cleaningDuration] [time](7) NULL,
	[isHelperRequested] [bit] NULL,
	[reguestedHelperID] [int] NULL,
	[AdditionalNotes] [varchar](500) NULL,
	[inspectionFeedback] [varchar](500) NULL,
	[rating] [int] NULL,
	[inspectionPhotos] [varchar](max) NULL,
	[inspectionNotes] [varchar](500) NULL,
	[isHelperRequestedApproved] [bit] NOT NULL,
	[helperRequestedAdditionalNotes] [varchar](500) NOT NULL,
 CONSTRAINT [PK_WorkProccess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phoneNumber] [varchar](20) NOT NULL,
	[shiftSchadule] [varchar](500) NOT NULL,
	[employeeID] [varchar](20) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[employeeType] [int] NOT NULL,
	[refreshToken] [varchar](150) NOT NULL,
	[imageURL] [varchar](150) NOT NULL,
 CONSTRAINT [PK_HouseKeepers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[AvailableNum] [int] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[ImageUrl] [varchar](150) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[ItemType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestItem]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[assignedRoomID] [int] NOT NULL,
	[RequestedItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [varchar](250) NOT NULL,
	[RequestedDateTime] [datetime] NOT NULL,
	[isCompleted] [bit] NOT NULL,
	[approvedBySupervisorID] [int] NOT NULL,
	[requestItemStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RequestItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[CheckinDate] [datetime] NOT NULL,
	[CheckoutDate] [datetime] NOT NULL,
	[guestName] [varchar](50) NOT NULL,
	[noOfGuest] [int] NOT NULL,
	[AdditionalNotes] [varchar](500) NOT NULL,
	[isCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [varchar](50) NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[Floor] [int] NOT NULL,
	[RoomStatus] [varchar](50) NOT NULL,
	[RoomImageUrl] [varchar](150) NOT NULL,
	[RoomTier] [varchar](50) NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[roomTypeName] [varchar](50) NOT NULL,
	[roomTasks] [varchar](max) NOT NULL,
	[cleaningDuration] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysproperties]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysproperties](
	[id] [int] NULL,
	[smallid] [int] NULL,
	[type] [int] NULL,
	[name] [nvarchar](50) NULL,
	[value] [nvarchar](50) NULL,
	[$SUser] [int] NULL,
	[$SDate] [nvarchar](20) NULL,
	[$DUser] [int] NULL,
	[$DDate] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDic]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDic](
	[Table] [nvarchar](50) NULL,
	[Field] [nvarchar](50) NULL,
	[CustomAtt] [nvarchar](50) NULL,
	[DefaultValue] [nvarchar](50) NULL,
	[$SUser] [int] NULL,
	[$SDate] [nvarchar](20) NULL,
	[$DUser] [int] NULL,
	[$DDate] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_AssignedRoom]    Script Date: 4/14/2024 3:56:33 AM ******/
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
/****** Object:  View [dbo].[View_assignedRoomCount]    Script Date: 4/14/2024 3:56:33 AM ******/
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
/****** Object:  View [dbo].[View_AssignedRoomsInfo]    Script Date: 4/14/2024 3:56:33 AM ******/
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
/****** Object:  View [dbo].[View_employee]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_employee]
AS
SELECT        dbo.Employee.ID, dbo.Employee.firstName, dbo.Employee.lastName, dbo.Employee.email, dbo.Employee.phoneNumber, dbo.Employee.shiftSchadule, dbo.Employee.employeeID, dbo.Employee.employeeType, 
                         dbo.AssignedRoom.assignedDateTime, dbo.AssignedRoom.assignedEmployeeID, dbo.AssignedRoom.cleaningStatus, dbo.AssignedRoom.isCompleted, dbo.AssignedRoom.verifiedPhotoUrl, dbo.AssignedRoom.startTime, 
                         dbo.AssignedRoom.endTime, dbo.AssignedRoom.cleaningDuration, dbo.AssignedRoom.isHelperRequested, dbo.AssignedRoom.reguestedHelperID, dbo.AssignedRoom.AdditionalNotes, dbo.AssignedRoom.inspectionFeedback, 
                         dbo.AssignedRoom.rating, dbo.AssignedRoom.inspectionPhotos, dbo.AssignedRoom.inspectionNotes, dbo.Rooms.RoomName, dbo.Rooms.RoomImageUrl, dbo.RequestItem.RequestedItemID, dbo.RequestItem.Quantity, 
                         dbo.RequestItem.Note, dbo.RequestItem.RequestedDateTime, dbo.RequestItem.isCompleted AS RequestItem_isCompleted, dbo.RequestItem.approvedBySupervisorID, dbo.Items.ItemName, 
                         dbo.Items.ImageUrl AS Items_ImageUrl, dbo.Items.Description, dbo.Items.GroupName, dbo.Items.ItemType, dbo.Employee.imageURL AS Employee_imageURL
FROM            dbo.RequestItem INNER JOIN
                         dbo.AssignedRoom ON dbo.RequestItem.assignedRoomID = dbo.AssignedRoom.ID INNER JOIN
                         dbo.Rooms ON dbo.AssignedRoom.roomID = dbo.Rooms.ID INNER JOIN
                         dbo.Items ON dbo.RequestItem.RequestedItemID = dbo.Items.ID RIGHT OUTER JOIN
                         dbo.Employee ON dbo.AssignedRoom.assignedEmployeeID = dbo.Employee.ID
GO
/****** Object:  View [dbo].[View_EmployeeCount]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_EmployeeCount]
AS
SELECT        COUNT(*) AS empcount, employeeType
FROM            dbo.Employee
GROUP BY employeeType
GO
/****** Object:  View [dbo].[View_RequestHelp]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_RequestHelp]
AS
SELECT        dbo.AssignedRoom.*, dbo.Employee.FirstName, dbo.Employee.LastName
FROM            dbo.AssignedRoom LEFT OUTER JOIN
                         dbo.Employee ON dbo.AssignedRoom.reguestedHelperID = dbo.Employee.ID
GO
/****** Object:  View [dbo].[View_requestItemCount]    Script Date: 4/14/2024 3:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_requestItemCount]
AS
SELECT        COUNT(*) AS Expr1, isCompleted
FROM            dbo.RequestItem
GROUP BY isCompleted
GO
/****** Object:  View [dbo].[View_RequestItems]    Script Date: 4/14/2024 3:56:33 AM ******/
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
/****** Object:  View [dbo].[View_room]    Script Date: 4/14/2024 3:56:33 AM ******/
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
/****** Object:  View [dbo].[View_SupervisiorAssignRoom]    Script Date: 4/14/2024 3:56:33 AM ******/
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
SET IDENTITY_INSERT [dbo].[AssignedRoom] ON 

INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (53, 1, CAST(N'2024-03-28T21:55:12.337' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-28T22:25:36.917' AS DateTime), CAST(N'2024-03-28T22:26:51.823' AS DateTime), CAST(N'00:01:13' AS Time), 1, 0, N'', N'blabvla', 4, N'https://s3.us-west-2.amazonaws.com/cleanops/image/ddd3af11-ade5-49a2-938d-c1c3b3950602,https://s3.us-west-2.amazonaws.com/cleanops/image/9da042b4-8b68-46e3-8a23-65905d2432fd', NULL, 1, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (54, 4, CAST(N'2024-03-28T21:55:43.480' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-29T04:33:39.107' AS DateTime), CAST(N'2024-03-29T04:34:20.993' AS DateTime), CAST(N'00:00:05' AS Time), 1, 0, N'', N'', 3, N'https://s3.us-west-2.amazonaws.com/cleanops/image/ad5b964e-3e70-431c-9d45-211adb61b3dd,https://s3.us-west-2.amazonaws.com/cleanops/image/1c070090-acd5-4622-ae02-b17f60cb9bed', NULL, 1, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (55, 5, CAST(N'2024-03-28T21:55:43.483' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-28T22:29:39.353' AS DateTime), CAST(N'2024-03-28T22:30:47.127' AS DateTime), CAST(N'00:01:07' AS Time), 0, 0, N'', N'', 3, N'https://s3.us-west-2.amazonaws.com/cleanops/image/e3297dad-ab7f-4d3c-90d5-f88a9cc114d3,https://s3.us-west-2.amazonaws.com/cleanops/image/10695915-1595-41e6-9066-7944081a12e6,https://s3.us-west-2.amazonaws.com/cleanops/image/b88b910b-5fbd-49a9-98cc-9a46a06957aa', NULL, 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (56, 7, CAST(N'2024-03-28T21:58:38.903' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-29T05:18:51.460' AS DateTime), CAST(N'2024-03-29T05:18:55.390' AS DateTime), CAST(N'00:00:03' AS Time), 1, 0, N'', N'', 3, N'https://s3.us-west-2.amazonaws.com/cleanops/image/c5d3ecc2-717d-4caf-9064-0c4fe018fc64,https://s3.us-west-2.amazonaws.com/cleanops/image/0e7381c8-7bb4-4fc7-a012-cfba4bb5a9bf,https://s3.us-west-2.amazonaws.com/cleanops/image/bb755406-1475-43f9-919d-621cce665228', NULL, 1, N'Peee')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (57, 8, CAST(N'2024-03-28T22:12:41.737' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-29T05:51:43.470' AS DateTime), CAST(N'2024-03-29T05:51:44.220' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 3, N'', NULL, 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (58, 10, CAST(N'2024-03-28T22:12:41.747' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-29T05:57:52.677' AS DateTime), CAST(N'2024-03-29T05:57:55.193' AS DateTime), CAST(N'00:00:02' AS Time), 0, 0, N'', N'', 3, N'https://s3.us-west-2.amazonaws.com/cleanops/image/c17c5043-22ba-4564-a978-55efbea53ac8,https://s3.us-west-2.amazonaws.com/cleanops/image/fae34e60-430b-4c93-88c7-dcc225c0220e', NULL, 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (59, 1, CAST(N'2024-03-29T03:13:51.727' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-29T03:21:50.660' AS DateTime), CAST(N'2024-03-29T03:21:57.067' AS DateTime), CAST(N'00:00:06' AS Time), 1, 0, N'', N'', 3, N'https://s3.us-west-2.amazonaws.com/cleanops/image/765d297c-3df7-46e3-b294-ed61af6eda84,https://s3.us-west-2.amazonaws.com/cleanops/image/9d5ad5c6-9c85-4480-881d-72bd7b3872ce,https://s3.us-west-2.amazonaws.com/cleanops/image/7e3f01ee-cd1b-4fe0-98a6-576cab56b201', NULL, 1, N'Sink is broken, send plumbere')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (60, 2, CAST(N'2024-03-29T03:13:51.733' AS DateTime), 14, N'To Do', 0, NULL, CAST(N'2024-03-29T03:13:51.733' AS DateTime), CAST(N'2024-03-29T03:13:51.733' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 3, N'', NULL, 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (61, 3, CAST(N'2024-03-29T05:22:15.610' AS DateTime), 2, N'To Do', 0, NULL, CAST(N'2024-03-29T05:22:15.610' AS DateTime), CAST(N'2024-03-29T05:22:15.610' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 4, N'', NULL, 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (62, 6, CAST(N'2024-03-29T05:22:15.610' AS DateTime), 2, N'To Do', 0, NULL, CAST(N'2024-03-29T05:22:15.610' AS DateTime), CAST(N'2024-03-29T05:22:15.610' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 4, N'', NULL, 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (63, 8, CAST(N'2024-03-29T05:22:15.610' AS DateTime), 2, N'To Do', 0, NULL, CAST(N'2024-03-29T05:22:15.610' AS DateTime), CAST(N'2024-03-29T05:22:15.610' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 4, N'', NULL, 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (64, 1, CAST(N'2024-03-30T07:31:04.067' AS DateTime), 14, N'Approved', 1, NULL, CAST(N'2024-03-30T07:33:49.450' AS DateTime), CAST(N'2024-03-30T07:34:04.867' AS DateTime), CAST(N'00:00:15' AS Time), 1, 0, N'', N'', 5, N'https://s3.us-west-2.amazonaws.com/cleanops/image/ca81d384-c7a9-4459-80f1-7cbdd154b9de', N'', 1, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (65, 3, CAST(N'2024-03-30T07:31:04.073' AS DateTime), 14, N'Cleaned', 1, NULL, CAST(N'2024-03-30T09:27:05.483' AS DateTime), CAST(N'2024-03-30T09:27:06.563' AS DateTime), CAST(N'00:00:01' AS Time), 1, 0, N'', N'Pipi', 4, N'https://s3.us-west-2.amazonaws.com/cleanops/image/3b9ac77a-9b84-406e-ae02-a594f3a33f3d,https://s3.us-west-2.amazonaws.com/cleanops/image/220a40a6-2035-48a7-b432-4d7775fb3dcd,https://s3.us-west-2.amazonaws.com/cleanops/image/a6b5e496-e202-4dcf-ac25-654ac2475db6,https://s3.us-west-2.amazonaws.com/cleanops/image/859d5349-1434-475e-98f4-e874865f2d44', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (66, 2, CAST(N'2024-03-30T07:31:04.070' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-30T10:55:38.953' AS DateTime), CAST(N'2024-03-30T10:55:46.037' AS DateTime), CAST(N'00:00:04' AS Time), 0, 0, N'', N'', 4, N'https://s3.us-west-2.amazonaws.com/cleanops/image/ab1ecd94-f4d5-472f-aa9c-9f5435bda3b0,https://s3.us-west-2.amazonaws.com/cleanops/image/f5236854-281b-47ca-8f0b-7083662ec10b', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (67, 4, CAST(N'2024-03-30T07:31:04.077' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-30T11:03:37.220' AS DateTime), CAST(N'2024-03-30T11:03:40.137' AS DateTime), CAST(N'00:00:02' AS Time), 0, 0, N'', N'', 4, N'https://s3.us-west-2.amazonaws.com/cleanops/image/7984b807-3da1-4349-98fb-4f322fe01067,https://s3.us-west-2.amazonaws.com/cleanops/image/cc1967f6-55d4-45ab-ad7e-dd0c962eed35', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (69, 6, CAST(N'2024-03-30T07:31:04.080' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-30T19:54:39.470' AS DateTime), CAST(N'2024-03-30T19:55:55.737' AS DateTime), CAST(N'00:01:16' AS Time), 0, 0, N'', N'', 4, N'https://s3.us-west-2.amazonaws.com/cleanops/image/066d5e5f-2545-4db9-9604-281c96f3b652,https://s3.us-west-2.amazonaws.com/cleanops/image/5c1d10b7-721c-49cf-8035-fb3a304be9b5,https://s3.us-west-2.amazonaws.com/cleanops/image/76ff8941-b47b-4a7e-bb36-d44e4a45b557', N'Cleaned!', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (73, 8, CAST(N'2024-03-30T20:20:30.837' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-03-30T20:32:05.280' AS DateTime), CAST(N'2024-03-30T20:33:08.633' AS DateTime), CAST(N'00:01:03' AS Time), 0, 0, N'', N'', 3, N'https://s3.us-west-2.amazonaws.com/cleanops/image/96f780a3-1e60-491d-b76b-ef6f94380da2', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (74, 5, CAST(N'2024-03-30T20:20:30.830' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-03-30T20:20:30.830' AS DateTime), CAST(N'2024-03-30T20:20:30.830' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (75, 7, CAST(N'2024-03-30T20:20:30.833' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-03-30T20:20:30.833' AS DateTime), CAST(N'2024-03-30T20:20:30.833' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (76, 10, CAST(N'2024-03-30T20:35:40.017' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-03-30T20:35:40.017' AS DateTime), CAST(N'2024-03-30T20:35:40.017' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (77, 2, CAST(N'2024-04-01T23:23:20.643' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-02T06:20:39.910' AS DateTime), CAST(N'2024-04-02T06:27:11.340' AS DateTime), CAST(N'00:06:21' AS Time), 1, 0, N'', N'', 4, N'https://s3.us-west-2.amazonaws.com/cleanops/image/2d567c0e-8015-403b-bd25-88da91f48c75,https://s3.us-west-2.amazonaws.com/cleanops/image/0489c4d5-8a6f-41c1-b402-bbd28c75114c', N'', 0, N'Plumber')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (78, 1, CAST(N'2024-04-01T23:23:20.640' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-01T23:23:20.640' AS DateTime), CAST(N'2024-04-01T23:23:20.640' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (79, 3, CAST(N'2024-04-01T23:23:20.647' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-01T23:23:20.647' AS DateTime), CAST(N'2024-04-01T23:23:20.647' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (80, 5, CAST(N'2024-04-01T23:23:35.060' AS DateTime), 2, N'To Do', 0, N'', CAST(N'2024-04-01T23:23:35.060' AS DateTime), CAST(N'2024-04-01T23:23:35.060' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (81, 6, CAST(N'2024-04-01T23:23:35.063' AS DateTime), 2, N'To Do', 0, N'', CAST(N'2024-04-01T23:23:35.063' AS DateTime), CAST(N'2024-04-01T23:23:35.063' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (82, 4, CAST(N'2024-04-01T23:23:35.057' AS DateTime), 2, N'To Do', 0, N'', CAST(N'2024-04-01T23:23:35.057' AS DateTime), CAST(N'2024-04-01T23:23:35.057' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (83, 7, CAST(N'2024-04-01T23:23:45.370' AS DateTime), 3, N'To Do', 0, N'', CAST(N'2024-04-01T23:23:45.370' AS DateTime), CAST(N'2024-04-01T23:23:45.370' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (84, 8, CAST(N'2024-04-01T23:23:45.377' AS DateTime), 3, N'To Do', 0, N'', CAST(N'2024-04-01T23:23:45.377' AS DateTime), CAST(N'2024-04-01T23:23:45.377' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (85, 2, CAST(N'2024-04-02T18:37:31.807' AS DateTime), 14, N'To Do', 0, NULL, CAST(N'2024-04-02T18:37:31.807' AS DateTime), CAST(N'2024-04-02T18:37:31.807' AS DateTime), CAST(N'00:00:00' AS Time), 1, 0, N'', N'', 0, N'', N'', 1, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (86, 1, CAST(N'2024-04-02T18:37:31.803' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-02T18:37:31.803' AS DateTime), CAST(N'2024-04-02T18:37:31.803' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (87, 4, CAST(N'2024-04-02T18:37:31.810' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-02T18:37:31.810' AS DateTime), CAST(N'2024-04-02T18:37:31.810' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (88, 3, CAST(N'2024-04-02T18:37:31.807' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-02T18:37:31.807' AS DateTime), CAST(N'2024-04-02T18:37:31.807' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (89, 1, CAST(N'2024-04-03T21:18:36.993' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-03T23:30:20.407' AS DateTime), CAST(N'2024-04-03T23:30:54.653' AS DateTime), CAST(N'00:00:10' AS Time), 1, 0, N'', N'', 4, N'https://s3.us-west-2.amazonaws.com/cleanops/image/90fc6762-7b44-4b67-bd13-ea86e6bc8907,https://s3.us-west-2.amazonaws.com/cleanops/image/365825e4-57b7-4e87-8088-8bdde8e7277d', N'aa', 0, N'Manager')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (90, 3, CAST(N'2024-04-03T21:18:37.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-03T21:18:37.000' AS DateTime), CAST(N'2024-04-03T21:18:37.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (91, 4, CAST(N'2024-04-03T21:18:37.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-03T21:18:37.000' AS DateTime), CAST(N'2024-04-03T21:18:37.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (92, 2, CAST(N'2024-04-03T21:18:36.997' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-03T21:18:36.997' AS DateTime), CAST(N'2024-04-03T21:18:36.997' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (93, 5, CAST(N'2024-04-03T21:18:37.003' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-03T21:18:37.003' AS DateTime), CAST(N'2024-04-03T21:18:37.003' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (94, 6, CAST(N'2024-04-03T21:18:37.003' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-03T21:18:37.003' AS DateTime), CAST(N'2024-04-03T21:18:37.003' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (95, 7, CAST(N'2024-04-03T21:18:37.007' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-03T21:18:37.007' AS DateTime), CAST(N'2024-04-03T21:18:37.007' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (96, 8, CAST(N'2024-04-03T21:18:37.007' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-03T21:18:37.007' AS DateTime), CAST(N'2024-04-03T21:18:37.007' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (97, 10, CAST(N'2024-04-03T21:18:37.010' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-03T21:18:37.010' AS DateTime), CAST(N'2024-04-03T21:18:37.010' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (98, 1, CAST(N'2024-04-04T18:21:54.467' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-04T23:30:18.597' AS DateTime), CAST(N'2024-04-04T23:37:35.297' AS DateTime), CAST(N'00:06:17' AS Time), 1, 0, N'', N'', 3, N'https://s3.us-west-2.amazonaws.com/cleanops/image/985b062d-a740-40ee-942c-ca9dd33b3dba,https://s3.us-west-2.amazonaws.com/cleanops/image/750f002f-a1d6-4a26-9053-3e48aca85e73', N'', 0, N'Plumber')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (99, 2, CAST(N'2024-04-04T18:21:54.470' AS DateTime), 14, N'Approved', 1, NULL, CAST(N'2024-04-04T20:26:59.910' AS DateTime), CAST(N'2024-04-04T20:27:02.660' AS DateTime), CAST(N'00:00:02' AS Time), 1, 0, N'', N'All images are black but i trust you', 5, N'https://s3.us-west-2.amazonaws.com/cleanops/image/22facb95-c356-4eb6-bd54-d1eb9fd2abfd,https://s3.us-west-2.amazonaws.com/cleanops/image/2ed5a1f8-56f4-461f-a5d4-fb9b4c2635a2,https://s3.us-west-2.amazonaws.com/cleanops/image/c48fa39c-345e-45cf-a232-31c092f14062', N'', 0, N'Electric, Manager')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (100, 3, CAST(N'2024-04-04T18:21:54.473' AS DateTime), 14, N'Approved', 1, NULL, CAST(N'2024-04-04T18:50:16.460' AS DateTime), CAST(N'2024-04-04T18:51:19.767' AS DateTime), CAST(N'00:00:53' AS Time), 1, 0, N'', N'', 0, N'https://s3.us-west-2.amazonaws.com/cleanops/image/b6b1424b-d419-4513-bb20-dd72d13fe57a,https://s3.us-west-2.amazonaws.com/cleanops/image/05a677ec-c1f1-4484-a0cd-c4135a3ad274,https://s3.us-west-2.amazonaws.com/cleanops/image/57221205-4989-4fa3-9545-23450c02d87c', N'', 0, N'Manager, Electric')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (101, 5, CAST(N'2024-04-04T18:21:54.477' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-04T23:51:44.377' AS DateTime), CAST(N'2024-04-05T00:01:05.427' AS DateTime), CAST(N'00:00:18' AS Time), 0, 0, N'', N'', 4, N'https://s3.us-west-2.amazonaws.com/cleanops/image/a8d84524-c274-4e46-83d8-a6c2738c563b,https://s3.us-west-2.amazonaws.com/cleanops/image/71f124fc-0bed-4fdd-8668-92ba4496fdef,https://s3.us-west-2.amazonaws.com/cleanops/image/22f9a8f5-c982-4fb6-82fd-f108f48e31cc', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (102, 4, CAST(N'2024-04-04T18:21:54.477' AS DateTime), 14, N'To Do', 0, NULL, CAST(N'2024-04-04T18:21:54.477' AS DateTime), CAST(N'2024-04-04T18:21:54.477' AS DateTime), CAST(N'00:00:00' AS Time), 1, 0, N'', N'', 0, N'', N'', 0, N'Manager, Plumber')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (103, 6, CAST(N'2024-04-04T18:21:54.480' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-05T00:46:21.797' AS DateTime), CAST(N'2024-04-05T00:47:00.527' AS DateTime), CAST(N'00:00:38' AS Time), 0, 0, N'', N'', 3, N'https://s3.us-west-2.amazonaws.com/cleanops/image/b14a7d9e-09ab-4dc6-a5df-266d29547188,https://s3.us-west-2.amazonaws.com/cleanops/image/8796d025-6206-4987-bdeb-2cff9248c346,https://s3.us-west-2.amazonaws.com/cleanops/image/82f0f31c-6d68-4556-b527-200ea1842063', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (104, 7, CAST(N'2024-04-04T23:19:58.630' AS DateTime), 2, N'To Do', 0, N'', CAST(N'2024-04-04T23:19:58.630' AS DateTime), CAST(N'2024-04-04T23:19:58.630' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (117, 2, CAST(N'2024-04-06T15:42:08.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-06T15:42:08.000' AS DateTime), CAST(N'2024-04-06T15:42:08.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (118, 1, CAST(N'2024-04-06T15:42:08.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-06T15:42:08.000' AS DateTime), CAST(N'2024-04-06T15:42:08.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (119, 4, CAST(N'2024-04-06T15:42:51.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-06T15:42:51.000' AS DateTime), CAST(N'2024-04-06T15:42:51.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (120, 3, CAST(N'2024-04-06T15:42:51.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-06T15:42:51.000' AS DateTime), CAST(N'2024-04-06T15:42:51.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (121, 1, CAST(N'2024-04-07T12:26:02.000' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-08T01:23:21.500' AS DateTime), CAST(N'2024-04-08T01:24:45.053' AS DateTime), CAST(N'00:01:22' AS Time), 1, 0, N'', N'', 121, N'https://s3.us-west-2.amazonaws.com/cleanops/image/5c7602d3-dedf-4464-b4cf-948dac2f3575,https://s3.us-west-2.amazonaws.com/cleanops/image/d935fa93-504e-459b-9f2e-7ee121ced67b,https://s3.us-west-2.amazonaws.com/cleanops/image/7d35e67e-a1b5-4974-9276-a0b1ede1406a,https://s3.us-west-2.amazonaws.com/cleanops/image/782ea36a-0104-4c48-9f2b-1bb2daaf213c', N'', 0, N'Electric')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (122, 2, CAST(N'2024-04-07T12:26:02.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-07T12:26:02.000' AS DateTime), CAST(N'2024-04-07T12:26:02.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (123, 3, CAST(N'2024-04-07T12:26:02.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-07T12:26:02.000' AS DateTime), CAST(N'2024-04-07T12:26:02.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (124, 1, CAST(N'2024-04-08T14:31:55.000' AS DateTime), 14, N'Approved', 1, NULL, CAST(N'2024-04-08T21:34:15.187' AS DateTime), CAST(N'2024-04-08T21:34:20.003' AS DateTime), CAST(N'00:00:04' AS Time), 1, 0, N'', N'Greeeat job!!!', 5, N'https://s3.us-west-2.amazonaws.com/cleanops/image/fc7edfc0-dde3-4819-8a9c-d441249379a3,https://s3.us-west-2.amazonaws.com/cleanops/image/0aaeed70-f2ec-4b76-b96f-0bc1bfa1b930', N'', 0, N'Housekeeper')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (125, 2, CAST(N'2024-04-08T14:31:55.000' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-09T02:35:20.247' AS DateTime), CAST(N'2024-04-09T02:35:47.320' AS DateTime), CAST(N'00:00:26' AS Time), 0, 0, N'', N'', 125, N'https://s3.us-west-2.amazonaws.com/cleanops/image/9282f147-4d5d-4386-b2cd-8b97df5c3602,https://s3.us-west-2.amazonaws.com/cleanops/image/42c69338-2a2d-4052-9434-c4e63ff5b78d,https://s3.us-west-2.amazonaws.com/cleanops/image/6add5f16-7b4d-4f1e-b317-e08c0eb3398a,https://s3.us-west-2.amazonaws.com/cleanops/image/d652a8e9-11fd-43a7-9c21-ae8d652b98f6', N'Super test', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (126, 3, CAST(N'2024-04-08T14:31:55.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-08T14:31:55.000' AS DateTime), CAST(N'2024-04-08T14:31:55.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (127, 4, CAST(N'2024-04-08T14:31:55.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-08T14:31:55.000' AS DateTime), CAST(N'2024-04-08T14:31:55.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (128, 6, CAST(N'2024-04-08T19:27:29.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-08T19:27:29.000' AS DateTime), CAST(N'2024-04-08T19:27:29.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (129, 5, CAST(N'2024-04-08T19:27:29.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-08T19:27:29.000' AS DateTime), CAST(N'2024-04-08T19:27:29.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (167, 1, CAST(N'2024-04-10T01:30:23.000' AS DateTime), 14, N'Approved', 1, NULL, CAST(N'2024-04-10T08:36:11.200' AS DateTime), CAST(N'2024-04-10T08:36:47.017' AS DateTime), CAST(N'00:00:04' AS Time), 1, 0, N'', N'', 0, N'https://s3.us-west-2.amazonaws.com/cleanops/image/5a6c3e43-2f3c-48b1-8860-6fc84e354df1,https://s3.us-west-2.amazonaws.com/cleanops/image/7743cc52-267a-494a-b3e5-ac9eb2bad643', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (168, 2, CAST(N'2024-04-10T01:30:23.000' AS DateTime), 14, N'Approved', 1, NULL, CAST(N'2024-04-10T08:45:13.200' AS DateTime), CAST(N'2024-04-10T08:45:17.670' AS DateTime), CAST(N'00:00:04' AS Time), 1, 0, N'', N'', 0, N'https://s3.us-west-2.amazonaws.com/cleanops/image/26bbf1ff-a8bc-43fa-862e-fe26aad3bb8b', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (169, 3, CAST(N'2024-04-10T01:32:26.000' AS DateTime), 14, N'Approved', 1, NULL, CAST(N'2024-04-10T09:13:49.067' AS DateTime), CAST(N'2024-04-10T09:16:50.733' AS DateTime), CAST(N'00:00:04' AS Time), 1, 0, N'', N'Blblaa', 5, N'https://s3.us-west-2.amazonaws.com/cleanops/image/a90958cf-1abe-4413-a4b3-7e07294da80f,https://s3.us-west-2.amazonaws.com/cleanops/image/362673bf-fbf4-4f46-967f-a9388537f100,https://s3.us-west-2.amazonaws.com/cleanops/image/31eb1621-9780-48a3-95cf-cbd1e5942ff7', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (170, 4, CAST(N'2024-04-10T01:32:26.000' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-10T09:17:28.687' AS DateTime), CAST(N'2024-04-10T09:17:33.317' AS DateTime), CAST(N'00:00:04' AS Time), 0, 0, N'', N'', 170, N'https://s3.us-west-2.amazonaws.com/cleanops/image/fbd94b39-51ab-4cac-89e3-69420b27768a,https://s3.us-west-2.amazonaws.com/cleanops/image/fc963391-bcc1-4c0e-90bd-babb338314f9', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (171, 5, CAST(N'2024-04-10T01:32:38.000' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-11T03:26:27.107' AS DateTime), CAST(N'2024-04-11T03:26:43.043' AS DateTime), CAST(N'00:00:05' AS Time), 0, 0, N'', N'', 171, N'https://s3.us-west-2.amazonaws.com/cleanops/image/dc3f0b2b-2b98-4949-bee9-b4b0b3d76e56,https://s3.us-west-2.amazonaws.com/cleanops/image/e7d1baaa-fef5-49e7-acd5-0ec60e708f55,https://s3.us-west-2.amazonaws.com/cleanops/image/fdb5f740-6da4-4237-a6fe-977ced429d1c', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (172, 4, CAST(N'2024-04-10T01:32:38.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-10T01:32:38.000' AS DateTime), CAST(N'2024-04-10T01:32:38.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (173, 3, CAST(N'2024-04-11T21:14:09.000' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-12T04:18:40.987' AS DateTime), CAST(N'2024-04-12T04:18:45.853' AS DateTime), CAST(N'00:00:04' AS Time), 0, 0, N'', N'', 173, N'https://s3.us-west-2.amazonaws.com/cleanops/image/d46fcf90-701f-4ff9-a85c-813cca0f2f8e,https://s3.us-west-2.amazonaws.com/cleanops/image/6ffd758d-530f-4636-bfc5-e71491676966,https://s3.us-west-2.amazonaws.com/cleanops/image/70fe1e28-58e4-4a38-b0b4-4b9274efb7b0', N'Be be apr 11', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (174, 2, CAST(N'2024-04-11T21:14:09.000' AS DateTime), 14, N'In Progress', 0, NULL, CAST(N'2024-04-12T06:59:02.677' AS DateTime), CAST(N'2024-04-11T21:14:09.000' AS DateTime), CAST(N'00:00:15' AS Time), 1, 0, N'', N'', 0, N'', N'', 0, N'Manager, Electric, Plumber')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (175, 1, CAST(N'2024-04-11T21:14:09.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-11T21:14:09.000' AS DateTime), CAST(N'2024-04-11T21:14:09.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (176, 4, CAST(N'2024-04-11T21:14:09.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-11T21:14:09.000' AS DateTime), CAST(N'2024-04-11T21:14:09.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (177, 8, CAST(N'2024-04-11T21:14:24.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (178, 6, CAST(N'2024-04-11T21:14:24.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (179, 5, CAST(N'2024-04-11T21:14:24.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (180, 7, CAST(N'2024-04-11T21:14:24.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (181, 10, CAST(N'2024-04-11T21:14:24.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'2024-04-11T21:14:24.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (182, 2, CAST(N'2024-04-12T00:25:20.000' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-12T18:11:03.087' AS DateTime), CAST(N'2024-04-12T18:13:09.987' AS DateTime), CAST(N'00:01:44' AS Time), 0, 0, N'', N'', 182, N'https://s3.us-west-2.amazonaws.com/cleanops/image/5c0525a6-dc61-49a2-8181-f66bdd84650b,https://s3.us-west-2.amazonaws.com/cleanops/image/704ca646-0943-4875-bcb0-4d18cd890f1e,https://s3.us-west-2.amazonaws.com/cleanops/image/d67de108-7d2a-49c5-8865-1e623c05a7ff', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (183, 3, CAST(N'2024-04-12T00:25:20.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-12T00:25:20.000' AS DateTime), CAST(N'2024-04-12T00:25:20.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (184, 1, CAST(N'2024-04-12T00:25:20.000' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-12T07:26:34.553' AS DateTime), CAST(N'2024-04-12T07:27:02.717' AS DateTime), CAST(N'00:00:23' AS Time), 1, 0, N'', N'', 184, N'https://s3.us-west-2.amazonaws.com/cleanops/image/b0afe826-f240-4e84-8518-b95d4c4d9cef,https://s3.us-west-2.amazonaws.com/cleanops/image/1d0bc481-7fa3-42ec-94f2-f309d4bb3ad5,https://s3.us-west-2.amazonaws.com/cleanops/image/73a84657-0f7b-4629-9141-e44439d6c1ed', N'Testest', 0, N'Manager, Electric, Plumber, Housekeeper')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (185, 4, CAST(N'2024-04-12T00:25:20.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-12T00:25:20.000' AS DateTime), CAST(N'2024-04-12T00:25:20.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (186, 5, CAST(N'2024-04-13T08:09:49.000' AS DateTime), 14, N'In Progress', 0, NULL, CAST(N'2024-04-13T15:11:33.623' AS DateTime), CAST(N'2024-04-13T08:09:49.000' AS DateTime), CAST(N'00:00:04' AS Time), 1, 0, N'', N'', 0, N'', N'', 0, N'Bell Hop, Guest Assistant')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (187, 2, CAST(N'2024-04-13T08:09:49.000' AS DateTime), 14, N'Approved', 1, NULL, CAST(N'2024-04-13T15:24:13.587' AS DateTime), CAST(N'2024-04-13T15:24:54.770' AS DateTime), CAST(N'00:00:40' AS Time), 1, 0, N'', N'Great job!', 5, N'https://s3.us-west-2.amazonaws.com/cleanops/image/2590463e-8592-4f18-bef7-cbb84ec0e63b,https://s3.us-west-2.amazonaws.com/cleanops/image/cbfc190c-e4b2-4ac3-b431-d2986d571b8e,https://s3.us-west-2.amazonaws.com/cleanops/image/02790795-9a36-4f97-b32a-e98369fb356b,https://s3.us-west-2.amazonaws.com/cleanops/image/fb54c6fc-7c7b-4151-a08e-0865a843aff1', N'Testtestttest', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (188, 3, CAST(N'2024-04-13T08:09:49.000' AS DateTime), 14, N'Cleaned', 0, NULL, CAST(N'2024-04-13T17:02:38.087' AS DateTime), CAST(N'2024-04-13T17:05:06.767' AS DateTime), CAST(N'00:02:26' AS Time), 0, 0, N'', N'', 188, N'https://s3.us-west-2.amazonaws.com/cleanops/image/ef5ce744-3c69-4186-b01d-7a63402a15cd,https://s3.us-west-2.amazonaws.com/cleanops/image/27ae6be0-54f8-4b19-965d-922136c698fa', N'Testtesttest', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (189, 1, CAST(N'2024-04-13T08:09:49.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-13T08:09:49.000' AS DateTime), CAST(N'2024-04-13T08:09:49.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (190, 4, CAST(N'2024-04-13T08:09:49.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-13T08:09:49.000' AS DateTime), CAST(N'2024-04-13T08:09:49.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (191, 6, CAST(N'2024-04-13T08:09:49.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-13T08:09:49.000' AS DateTime), CAST(N'2024-04-13T08:09:49.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (192, 10, CAST(N'2024-04-13T12:11:30.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-13T12:11:30.000' AS DateTime), CAST(N'2024-04-13T12:11:30.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (193, 8, CAST(N'2024-04-13T12:11:30.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-13T12:11:30.000' AS DateTime), CAST(N'2024-04-13T12:11:30.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
INSERT [dbo].[AssignedRoom] ([ID], [roomID], [assignedDateTime], [assignedEmployeeID], [cleaningStatus], [isCompleted], [verifiedPhotoUrl], [startTime], [endTime], [cleaningDuration], [isHelperRequested], [reguestedHelperID], [AdditionalNotes], [inspectionFeedback], [rating], [inspectionPhotos], [inspectionNotes], [isHelperRequestedApproved], [helperRequestedAdditionalNotes]) VALUES (194, 7, CAST(N'2024-04-13T12:11:30.000' AS DateTime), 14, N'To Do', 0, N'', CAST(N'2024-04-13T12:11:30.000' AS DateTime), CAST(N'2024-04-13T12:11:30.000' AS DateTime), CAST(N'00:00:00' AS Time), 0, 0, N'', N'', 0, N'', N'', 0, N'')
SET IDENTITY_INSERT [dbo].[AssignedRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [firstName], [lastName], [email], [phoneNumber], [shiftSchadule], [employeeID], [password], [employeeType], [refreshToken], [imageURL]) VALUES (1, N'Emma', N'Smith', N'emma.smith@example.com
', N'123-456-7890', N'Mon-Fri 9-5', N'EMP001', N'$2b$10$hFMzUUHKhIiQEGdsigsLveA.8fA8gHX4VpgQsCJEGuUTUPk6GWngK', 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOjEsImlhdCI6MTcxMjI3OTIxNSwiZXhwIjoxNzEyMzY1NjE1fQ.CEPZM_CvhFWo9DuQ4EfxMOnL6uL03_X24a-pvna9lto', N'https://s3.us-west-2.amazonaws.com/cleanops/image/2d3d6390-13cb-4986-9f60-619933d9731f')
INSERT [dbo].[Employee] ([ID], [firstName], [lastName], [email], [phoneNumber], [shiftSchadule], [employeeID], [password], [employeeType], [refreshToken], [imageURL]) VALUES (2, N'Olivia', N'Johnson', N'emily.johnson@example.com', N'987-654-3210', N'Tue-Sat 10-6', N'EMP002', N'$2b$10$hFMzUUHKhIiQEGdsigsLveA.8fA8gHX4VpgQsCJEGuUTUPk6GWngK', 2, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/c0e647d0-53ac-4767-a36c-8350fd355b3c')
INSERT [dbo].[Employee] ([ID], [firstName], [lastName], [email], [phoneNumber], [shiftSchadule], [employeeID], [password], [employeeType], [refreshToken], [imageURL]) VALUES (3, N'Sarah', N'Williams', N'sarah.williams@example.com', N'555-123-4567', N'Mon-Sun 8-4', N'EMP003', N'$2b$10$hFMzUUHKhIiQEGdsigsLveA.8fA8gHX4VpgQsCJEGuUTUPk6GWngK', 2, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/ee4b30b8-b2d0-4883-ae40-3ae293fa1be4')
INSERT [dbo].[Employee] ([ID], [firstName], [lastName], [email], [phoneNumber], [shiftSchadule], [employeeID], [password], [employeeType], [refreshToken], [imageURL]) VALUES (5, N'Isabella', N'Jones', N'isabella.jones@example.com
', N'222-888-9999', N'Thu-Tue 12-8', N'EMP005', N'$2b$10$hFMzUUHKhIiQEGdsigsLveA.8fA8gHX4VpgQsCJEGuUTUPk6GWngK', 2, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/0939e854-f5a8-48ee-82ae-0047a1427591')
INSERT [dbo].[Employee] ([ID], [firstName], [lastName], [email], [phoneNumber], [shiftSchadule], [employeeID], [password], [employeeType], [refreshToken], [imageURL]) VALUES (14, N'Michelle', N'Williams', N'michael.williams@example.com', N'111-222-3344', N'Mon-Fri 10-6', N'EMP010', N'$2b$10$8tlM.TUYlXy3HYmnHsh62eMrH5WOFcqwxv2VOcZkfDm6uwH5aLvAm', 2, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOjE0LCJpYXQiOjE3MTMwNDUzMTksImV4cCI6MTcxMzEzMTcxOX0.KsT8qsKBBSLT7KJrNioFCMHJBZft8BlDMPHPwIVMnRk', N'https://s3.us-west-2.amazonaws.com/cleanops/image/34deff9b-170a-417f-9790-3ba341642da0')
INSERT [dbo].[Employee] ([ID], [firstName], [lastName], [email], [phoneNumber], [shiftSchadule], [employeeID], [password], [employeeType], [refreshToken], [imageURL]) VALUES (15, N'Lauren', N'Martinez', N'lauren.martinez@example.com', N'111-222-3344', N'Mon-Fri 10-6', N'EMP011', N'$2b$10$TdWi4ld.wCghMrkxOJ6RAOwqZEg315ZKyfc./CKDu6xGeoio791fq', 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOjE1LCJpYXQiOjE3MTMwNDU0MDYsImV4cCI6MTcxMzEzMTgwNn0.rh9mxC0gLfU2wr7clg48W_3Jt8Up4T82hmfyijLnlLg', N'https://s3.us-west-2.amazonaws.com/cleanops/image/56bae6ac-dfaa-483f-a762-e5b29f66d571')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (1, N'Towel', 50, N'Soft and absorbent towel for guest use', N'https://s3.us-west-2.amazonaws.com/cleanops/image/490afca0-b980-440e-9d7b-41501d16bec5', N'Room Supplies', N'Linen')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (2, N'Shampoo', 100, N'Travel-sized shampoo bottle', N'https://s3.us-west-2.amazonaws.com/cleanops/image/f1b02815-3204-4146-ad1b-2b446ff4f1bd', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (3, N'Soap(Regular)', 150, N'Bar soap for hand washing', N'https://s3.us-west-2.amazonaws.com/cleanops/image/cd752ed8-3add-4d27-8ede-beba7b9ca751', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (4, N'Tissue', 200, N'Facial tissue for guest convenience', N'https://s3.us-west-2.amazonaws.com/cleanops/image/2a6a0509-335c-4be4-98ac-b0ea1e473ea0', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (5, N'Pillow', 50, N'Soft pillow for guest comfort', N'https://s3.us-west-2.amazonaws.com/cleanops/image/66eebae1-6a20-4412-848c-8116a7c4e8a7', N'Room Supplies', N'Linen')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (6, N'Coffee Mug', 100, N'Ceramic mug for coffee or tea', N'https://s3.us-west-2.amazonaws.com/cleanops/image/1f2a7546-20e6-419c-b908-317da86c027c', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (7, N'Toilet Paper', 300, N'Toilet paper rolls for bathroom use', N'https://s3.us-west-2.amazonaws.com/cleanops/image/f83fc95f-fe24-42fb-b204-b32ecfdfe19e', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (8, N'Bath Towel', 100, N'Large bath towel for guest use', N'https://s3.us-west-2.amazonaws.com/cleanops/image/0bdf2c81-fe0c-4be9-a3c5-9156b52e46ca', N'Room Supplies', N'Linen')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (9, N'Toothbrush (Regular)', 200, N'Disposable toothbrush with toothpaste', N'https://s3.us-west-2.amazonaws.com/cleanops/image/ba306377-9df8-4df7-bcb2-f5598fad9f6a', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (10, N'Disposable Slippers', 150, N'Disposable slippers for guest use', N'https://s3.us-west-2.amazonaws.com/cleanops/image/6ad6231b-56de-4a0a-96ff-0080f1b6c483', N'Room Supplies', N'Linen')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (11, N'Hand Cream', 80, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/ee990915-a4a0-4126-b004-b164e4950cbf', N'Room Supplies', N'Linen')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (12, N'Body Gel', 120, N'Body wash in travel-sized container', N'https://s3.us-west-2.amazonaws.com/cleanops/image/a3feef7c-7d41-4c17-990d-b0eeb96b1171', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (13, N'Conditioner', 100, N'Conditioner for hair conditioning', N'https://s3.us-west-2.amazonaws.com/cleanops/image/6c464ee4-36ce-4d7f-93d0-f3bd89a22acd', N'Cart Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (14, N'Body Lotion', 150, N'Moisturizing lotion for skin care', N'https://s3.us-west-2.amazonaws.com/cleanops/image/663e62b7-0feb-45c4-97ed-3f42658e310c', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (15, N'Bathrobe', 40, N'Comfortable bathrobe for guest use', N'https://s3.us-west-2.amazonaws.com/cleanops/image/d2bfe8fd-dc8c-47dd-b236-f29b5f7e1a90', N'Cart Supplies', N'Linen')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (16, N'Drinking Glass', 200, N'Glassware for serving beverages', N'https://s3.us-west-2.amazonaws.com/cleanops/image/81394fc2-0792-44cf-b855-ba9da2ce51fe', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (17, N'Face Towel', 80, N'Small towel for facial cleansing', N'https://s3.us-west-2.amazonaws.com/cleanops/image/5fd19883-0904-4cde-8bc5-0a318253163e', N'Room Supplies', N'Linen')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (18, N'Body Lotion', 120, N'Moisturizing lotion for body', N'https://s3.us-west-2.amazonaws.com/cleanops/image/663e62b7-0feb-45c4-97ed-3f42658e310c', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (19, N'Slippers', 100, N'Comfortable slippers for guest use', N'https://s3.us-west-2.amazonaws.com/cleanops/image/c6b3a396-27fd-4685-83fa-6d89864d3b1e', N'Room Supplies', N'Linen')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (20, N'Hair Dryer', 30, N'Hair dryer for guest use', N'https://s3.us-west-2.amazonaws.com/cleanops/image/7fab0c7d-9a23-48ac-9d0a-ac00be875d8d', N'Cart Supplies', N'Appliance')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (21, N'Soap (Suite)', 150, N'Bar soap for hand washing', N'https://s3.us-west-2.amazonaws.com/cleanops/image/91b984db-1757-4561-bf0b-d78d9cbca153', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (22, N'Soap (King)', 150, N'Bar soap for hand washing', N'https://s3.us-west-2.amazonaws.com/cleanops/image/afa97773-271b-4df6-b12f-281f1cd3aa5f', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (23, N'Toothbrush (Suite)', 200, N'Disposable toothbrush with toothpaste', N'https://s3.us-west-2.amazonaws.com/cleanops/image/c3cfb833-7840-4598-ab5f-04e51fd64914', N'Room Supplies', N'Toiletry')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (24, N'Bleach', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/396c793c-aaf3-4446-8bd6-d766c458a483', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (25, N'Cleaning Spray', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/dea8dba8-e414-49bf-a4eb-b24a3155b7e4', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (26, N'Floor Cleaner', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/26b1cb36-5f13-4a18-acce-e08eb5df3c27', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (27, N'Mop', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/5e8b18b7-1146-4bfa-982d-9fe8e2a3961b', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (28, N'Squeegee', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/89001cdf-b1f9-42d4-92a5-7f02a90e8643', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (29, N'Sink Cleaner', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/bc8af426-f535-4ffa-88ab-973b06dfab66', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (30, N'Small Brush', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/947e780c-8589-4425-ac07-136e49a0353b', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (31, N'Sponge', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/60df036f-60fe-4813-b38f-e4b40d5f07b0', N'Cart Supplies', N'Utensil')
INSERT [dbo].[Items] ([ID], [ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType]) VALUES (32, N'Toilet Cleaner', 34, N'', N'https://s3.us-west-2.amazonaws.com/cleanops/image/178a5592-7255-4682-98b8-b25c80f753ad', N'Cart Supplies', N'Utensil')
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestItem] ON 

INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (28, 53, 5, 2, N'nn', CAST(N'2024-03-29T22:25:52.053' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (29, 53, 7, 2, N'', CAST(N'2024-03-28T22:25:52.053' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (30, 0, 30, 1, N'', CAST(N'2024-03-29T03:27:55.157' AS DateTime), 1, 14, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (31, 56, 9, 1, N'Tttttyyts', CAST(N'2024-03-29T05:17:37.217' AS DateTime), 1, 14, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (32, 102, 2, 2, N'', CAST(N'2024-04-05T00:04:02.020' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (34, 109, 2, 2, N'', CAST(N'2024-04-06T04:46:52.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (35, 111, 2, 2, N'', CAST(N'2024-04-06T14:29:07.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (36, 0, 13, 2, N'', CAST(N'2024-04-06T14:30:34.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (37, 112, 7, 5, N'', CAST(N'2024-04-06T15:07:12.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (38, 0, 26, 3, N'', CAST(N'2024-04-06T15:08:27.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (39, 121, 2, 5, N'Bibi', CAST(N'2024-04-07T15:27:22.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (40, 121, 1, 3, N'Test test', CAST(N'2024-04-07T15:27:22.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (41, 0, 12, 2, N'', CAST(N'2024-04-07T16:49:40.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (42, 122, 10, 1, N'', CAST(N'2024-04-07T16:49:40.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (43, 0, 2, 2, N'', CAST(N'2024-04-08T03:35:45.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (44, 124, 5, 2, N'', CAST(N'2024-04-08T14:34:06.000' AS DateTime), 0, 0, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (45, 125, 5, 3, N'The pillows have been eaten', CAST(N'2024-04-08T19:35:36.000' AS DateTime), 0, 0, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (46, 0, 2, 4, N'Request from HK - request', CAST(N'2024-04-08T19:36:22.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (47, 0, 27, 2, N'', CAST(N'2024-04-10T02:03:46.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (48, 0, 25, 2, N'', CAST(N'2024-04-10T02:03:46.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (49, 173, 5, 4, N'Test apr 11', CAST(N'2024-04-11T21:18:26.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (50, 184, 19, 3, N'', CAST(N'2024-04-12T00:26:59.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (51, 186, 11, 5, N'Testestapr12', CAST(N'2024-04-13T08:17:07.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (52, 187, 1, 4, N'Test test April grgr', CAST(N'2024-04-13T08:24:39.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (53, 186, 2, 5, N'', CAST(N'2024-04-13T08:24:39.000' AS DateTime), 1, 15, N'')
INSERT [dbo].[RequestItem] ([ID], [assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID], [requestItemStatus]) VALUES (54, 188, 19, 2, N'Apl 1212r', CAST(N'2024-04-13T10:05:02.000' AS DateTime), 1, 15, N'')
SET IDENTITY_INSERT [dbo].[RequestItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (1, 5, CAST(N'2024-04-15T14:00:00.000' AS DateTime), CAST(N'2024-04-17T11:00:00.000' AS DateTime), N'John Smith', 2, N'', 1)
INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (2, 4, CAST(N'2024-04-08T12:00:00.000' AS DateTime), CAST(N'2024-04-12T10:00:00.000' AS DateTime), N'Emily Johnson', 1, N'Early check-in req.', 1)
INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (3, 3, CAST(N'2024-04-11T15:00:00.000' AS DateTime), CAST(N'2024-04-14T09:00:00.000' AS DateTime), N'Michael Brown', 3, N'', 0)
INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (4, 6, CAST(N'2024-04-13T13:00:00.000' AS DateTime), CAST(N'2024-04-16T12:00:00.000' AS DateTime), N'Sarah Davis', 2, N'Late checkout req.', 0)
INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (5, 8, CAST(N'2024-04-15T10:00:00.000' AS DateTime), CAST(N'2024-04-16T11:00:00.000' AS DateTime), N'David Lee', 1, N'', 1)
INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (7, 10, CAST(N'2024-04-11T11:00:00.000' AS DateTime), CAST(N'2024-04-14T08:00:00.000' AS DateTime), N'Matthew Kim', 2, N'', 0)
INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (8, 2, CAST(N'2024-04-14T16:00:00.000' AS DateTime), CAST(N'2024-04-17T13:00:00.000' AS DateTime), N'Lauren Wong', 1, N'', 1)
INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (9, 1, CAST(N'2024-04-11T14:00:00.000' AS DateTime), CAST(N'2024-04-13T09:00:00.000' AS DateTime), N'Daniel Park', 3, N'', 1)
INSERT [dbo].[Reservation] ([ID], [RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted]) VALUES (11, 7, CAST(N'2024-04-13T10:00:00.000' AS DateTime), CAST(N'2024-04-16T11:00:00.000' AS DateTime), N'Ashley Kim', 2, N'', 1)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (1, N'A101', 2, 1, N'CheckedOut', N'https://s3.us-west-2.amazonaws.com/cleanops/image/8638947e-64d4-4eed-afce-ef4bc33d90f6', N'gold')
INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (2, N'A102', 6, 1, N'CheckedOut-DueIn', N'https://s3.us-west-2.amazonaws.com/cleanops/image/293ca8ef-f3fa-411d-9f96-ff9b8add8725', N'silver')
INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (3, N'A103', 6, 1, N'DueOut-DueIn', N'https://s3.us-west-2.amazonaws.com/cleanops/image/293ca8ef-f3fa-411d-9f96-ff9b8add8725', N'diamond')
INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (4, N'A201', 2, 2, N'DueIn', N'https://s3.us-west-2.amazonaws.com/cleanops/image/8638947e-64d4-4eed-afce-ef4bc33d90f6', N'gold')
INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (5, N'A202', 2, 2, N'CheckedOut', N'https://s3.us-west-2.amazonaws.com/cleanops/image/8638947e-64d4-4eed-afce-ef4bc33d90f6', N'silver')
INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (6, N'A203', 6, 2, N'DueOut-DueIn', N'https://s3.us-west-2.amazonaws.com/cleanops/image/293ca8ef-f3fa-411d-9f96-ff9b8add8725', N'diamond')
INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (7, N'A301', 3, 3, N'DueIn', N'https://s3.us-west-2.amazonaws.com/cleanops/image/2ad7c0fb-a018-41ef-821a-72ce464b573d', N'gold')
INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (8, N'A302', 2, 3, N'CheckedOut', N'https://s3.us-west-2.amazonaws.com/cleanops/image/8638947e-64d4-4eed-afce-ef4bc33d90f6', N'silver')
INSERT [dbo].[Rooms] ([ID], [RoomName], [RoomTypeID], [Floor], [RoomStatus], [RoomImageUrl], [RoomTier]) VALUES (10, N'A401', 1, 4, N'CheckedOut', N'https://s3.us-west-2.amazonaws.com/cleanops/image/396c793c-aaf3-4446-8bd6-d766c458a483', N'diamond')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([ID], [roomTypeName], [roomTasks], [cleaningDuration]) VALUES (1, N'King Bed', N'1- Strip and replace bed linens.
2- Make the bed neatly.
3- Dust and wipe down furniture.
4- Clean and disinfect the toilet, sink, and shower.
5- Replenish towels and amenities.
6- Vacuum or sweep the floor.
7- Dust all surfaces and clean light switches.
8- Check for lost items and report maintenance issues.
9- Air out the room and add room deodorizer.
10- Perform a final inspection and secure the room.', N'120')
INSERT [dbo].[RoomTypes] ([ID], [roomTypeName], [roomTasks], [cleaningDuration]) VALUES (2, N'Queen Bed', N'1- Strip and replace bed linens.
2- Make the bed neatly.
3- Dust and wipe down furniture.
4- Clean and disinfect the toilet, sink, and shower.
5- Replenish towels and amenities.
6- Vacuum or sweep the floor.
7- Dust all surfaces and clean light switches.
8- Check for lost items and report maintenance issues.
9- Air out the room and add room deodorizer.
10- Perform a final inspection and secure the room.', N'115')
INSERT [dbo].[RoomTypes] ([ID], [roomTypeName], [roomTasks], [cleaningDuration]) VALUES (3, N'Suite', N'1- Strip and replace bed linens.
2- Make the bed neatly.
3- Dust and wipe down furniture.
4- Clean and disinfect the toilet, sink, and shower.
5- Replenish towels and amenities.
6- Vacuum or sweep the floor.
7- Dust all surfaces and clean light switches.
8- Check for lost items and report maintenance issues.
9- Air out the room and add room deodorizer.
10- Perform a final inspection and secure the room.', N'110')
INSERT [dbo].[RoomTypes] ([ID], [roomTypeName], [roomTasks], [cleaningDuration]) VALUES (5, N'Single Bed', N'1- Strip and replace bed linens.
2- Make the bed neatly.
3- Dust and wipe down furniture.
4- Clean and disinfect the toilet, sink, and shower.
5- Replenish towels and amenities.
6- Vacuum or sweep the floor.
7- Dust all surfaces and clean light switches.
8- Check for lost items and report maintenance issues.
9- Air out the room and add room deodorizer.
10- Perform a final inspection and secure the room.', N'80')
INSERT [dbo].[RoomTypes] ([ID], [roomTypeName], [roomTasks], [cleaningDuration]) VALUES (6, N'Double Bed', N'1- Strip and replace bed linens.
2- Make the bed neatly.
3- Dust and wipe down furniture.
4- Clean and disinfect the toilet, sink, and shower.
5- Replenish towels and amenities.
6- Vacuum or sweep the floor.
7- Dust all surfaces and clean light switches.
8- Check for lost items and report maintenance issues.
9- Air out the room and add room deodorizer.
10- Perform a final inspection and secure the room.', N'100')
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
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
/****** Object:  StoredProcedure [dbo].[CreateAssignedRoom]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAssignedRoom]
    @RoomID int,
    @AssignedDateTime datetime,
    @AssignedEmployeeID int,
    @CleaningStatus varchar(50),
    @IsCompleted bit,
    @VerifiedPhotoUrl varchar(150),
    @StartTime datetime,
    @EndTime datetime,
    @CleaningDuration datetime,
    @IsHelperRequested bit,
    @RequestedHelperID int,
    @AdditionalNotes varchar(500),
    @InspectionFeedback varchar(500),
    @Rating int,
    @InspectionPhotos varchar(max),
    @InspectionNotes varchar(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[AssignedRoom] (
        [RoomID],
        [assignedDateTime],
        [assignedEmployeeID],
        [cleaningStatus],
        [isCompleted],
        [verifiedPhotoUrl],
        [startTime],
        [endTime],
        [cleaningDuration],
        [isHelperRequested],
        [reguestedHelperID],
        [AdditionalNotes],
        [inspectionFeedback],
        [rating],
        [inspectionPhotos],
        [inspectionNotes]
    )
    VALUES (
        @RoomID,
        @AssignedDateTime,
        @AssignedEmployeeID,
        @CleaningStatus,
        @IsCompleted,
        @VerifiedPhotoUrl,
        @StartTime,
        @EndTime,
        @CleaningDuration,
        @IsHelperRequested,
        @RequestedHelperID,
        @AdditionalNotes,
        @InspectionFeedback,
        @Rating,
        @InspectionPhotos,
        @InspectionNotes
    );
END

GO
/****** Object:  StoredProcedure [dbo].[CreateEmployee]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateEmployee]
    @FirstName varchar(50),
    @LastName varchar(50),
    @Email varchar(50),
    @PhoneNumber varchar(20),
    @ShiftSchadule varchar(500),
    @EmployeeID varchar(20),
    @Password varchar(100),
    @EmployeeType int,
	@ImageURL varchar(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Employee] ([FirstName], [LastName], [Email], [PhoneNumber], [ShiftSchadule], [EmployeeID], [Password], [EmployeeType],[ImageURL])
    VALUES (@FirstName, @LastName, @Email, @PhoneNumber, @ShiftSchadule, @EmployeeID, @Password, @EmployeeType,@ImageURL);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END

GO
/****** Object:  StoredProcedure [dbo].[CreateItem]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateItem]
    @ItemName varchar(50),
    @AvailableNum int,
    @Description varchar(250),
    @ImageUrl varchar(150),
    @GroupName varchar(50),
    @ItemType varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Items] ([ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType])
    VALUES (@ItemName, @AvailableNum, @Description, @ImageUrl, @GroupName, @ItemType);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END

GO
/****** Object:  StoredProcedure [dbo].[CreateRequestItem]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRequestItem]
    @assignedRoomID int,
    @RequestedItemID int,
    @Quantity int,
    @Note varchar(250),
    @RequestedDateTime datetime,
    @IsCompleted bit,
    @ApprovedBySupervisorID int,
	 @requestItemStatus varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[RequestItem] ([assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID],[requestItemStatus])
    VALUES (@assignedRoomID, @RequestedItemID, @Quantity, @Note, @RequestedDateTime, @IsCompleted, @ApprovedBySupervisorID, @requestItemStatus);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END
GO
/****** Object:  StoredProcedure [dbo].[CreateReservation]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateReservation]
    @RoomID int,
    @CheckinDate datetime,
    @CheckoutDate datetime,
    @GuestName varchar(50),
    @NoOfGuest int,
    @AdditionalNotes varbinary(500),
    @IsCompleted bit
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Reservation] ([RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted])
    VALUES (@RoomID, @CheckinDate, @CheckoutDate, @GuestName, @NoOfGuest, @AdditionalNotes, @IsCompleted);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END

GO
/****** Object:  StoredProcedure [dbo].[CreateRoom]    Script Date: 4/14/2024 3:56:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CreateRoomType]    Script Date: 4/14/2024 3:56:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteAssignedRoom]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAssignedRoom]
    @ID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[AssignedRoom]
    WHERE [ID] = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
    @EmployeeID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Employee]
    WHERE [ID] = @EmployeeID;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteItem]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteItem]
    @ItemID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Items]
    WHERE [ID] = @ItemID;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteRequestItem]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRequestItem]
    @RequestItemID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[RequestItem]
    WHERE [ID] = @RequestItemID;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteReservation]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteReservation]
    @ReservationID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Reservation]
    WHERE [ID] = @ReservationID;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteRoom]    Script Date: 4/14/2024 3:56:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteRoomType]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRoomType]
    @RoomTypeID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[RoomTypes]
    WHERE [ID] = @RoomTypeID;
END

GO
/****** Object:  StoredProcedure [dbo].[GetAssignedRooms]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAssignedRooms]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[AssignedRoom];
END

GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployees]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT    ID, firstName, lastName, email, phoneNumber, shiftSchadule, employeeID, employeeType, imageURL
 FROM [dbo].[Employee];
END
GO
/****** Object:  StoredProcedure [dbo].[GetItems]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetItems]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM [dbo].[Items];
END

GO
/****** Object:  StoredProcedure [dbo].[GetRequestItems]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRequestItems]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM [dbo].[RequestItem];
END

GO
/****** Object:  StoredProcedure [dbo].[GetReservation]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReservation]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM [dbo].[Reservation];
END

GO
/****** Object:  StoredProcedure [dbo].[GetRooms]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRooms]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM [dbo].[Rooms];
END

GO
/****** Object:  StoredProcedure [dbo].[GetRoomTypes]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoomTypes]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM [dbo].[RoomTypes];
END

GO
/****** Object:  StoredProcedure [dbo].[Getuser]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Getuser]
  @username varchar(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ID,FirstName,LastName,EmployeeType,Password,imageURL FROM [dbo].[Employee]
	   WHERE [EmployeeID] = @username;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAssignedRoom]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[InsertAssignedRoom]
    @RoomID int,
    @RoomStatus varchar(50),
    @AssignedDateTime datetime,
    @assignedEmployeeID int,
    @CleaningStatus varchar(50),
    @IsCompleted bit,
    @VerifiedPhotoUrl varchar(150),
    @StartTime datetime,
    @EndTime datetime,
    @CleaningDuration time,
    @IsHelperRequested bit,
    @RequestedHelperID int,
    @AdditionalNotes varchar(500),
    @InspectionFeedback varchar(500),
    @Rating int,
    @InspectionPhotos varchar(max),
    @InspectionNotes varchar(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[AssignedRoom] (
        [RoomID],
        [assignedDateTime],
        [assignedEmployeeID],
        [cleaningStatus],
        [isCompleted],
        [verifiedPhotoUrl],
        [startTime],
        [endTime],
        [cleaningDuration],
        [isHelperRequested],
        [reguestedHelperID],
        [AdditionalNotes],
        [inspectionFeedback],
        [rating],
        [inspectionPhotos],
        [inspectionNotes]
    )
    VALUES (
        @RoomID,
        @AssignedDateTime,
        @assignedEmployeeID,
        @CleaningStatus,
        @IsCompleted,
        @VerifiedPhotoUrl,
        @StartTime,
        @EndTime,
        @CleaningDuration,
        @IsHelperRequested,
        @RequestedHelperID,
        @AdditionalNotes,
        @InspectionFeedback,
        @Rating,
        @InspectionPhotos,
        @InspectionNotes
    );
END

GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login]
    @Username varchar(20),
    @Password varchar(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID int;

    SELECT @UserID = ID
    FROM [dbo].[Employee]
    WHERE [EmployeeID] = @Username
    AND [Password] = @Password;

    IF @UserID IS NOT NULL
    BEGIN
        SELECT 'Login successful' AS [Status], @UserID AS [UserID];
    END
    ELSE
    BEGIN
        SELECT 'Invalid username or password' AS [Status], NULL AS [UserID];
    END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAssignedRoom]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateAssignedRoom]
    @ID int,
    @RoomID int,
    @AssignedDateTime datetime,
    @AssignedEmployeeID int,
    @CleaningStatus varchar(50),
    @IsCompleted bit,
    @VerifiedPhotoUrl varchar(150),
    @StartTime datetime,
    @EndTime datetime,
    @CleaningDuration datetime,
    @IsHelperRequested bit,
    @RequestedHelperID int,
    @AdditionalNotes varchar(500),
    @InspectionFeedback varchar(500),
    @Rating int,
    @InspectionPhotos varchar(max),
    @InspectionNotes varchar(500),
	@IsHelperRequestedApproved bit,
	@HelperRequestedAdditionalNotes varchar(500)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[AssignedRoom]
    SET [RoomID] = @RoomID,
        [assignedDateTime] = @AssignedDateTime,
        [assignedEmployeeID] = @AssignedEmployeeID,
        [cleaningStatus] = @CleaningStatus,
        [isCompleted] = @IsCompleted,
        [verifiedPhotoUrl] = @VerifiedPhotoUrl,
        [startTime] = @StartTime,
        [endTime] = @EndTime,
        [cleaningDuration] = @CleaningDuration,
        [isHelperRequested] = @IsHelperRequested,
        [reguestedHelperID] = @RequestedHelperID,
        [AdditionalNotes] = @AdditionalNotes,
        [inspectionFeedback] = @InspectionFeedback,
        [rating] = @Rating,
        [inspectionPhotos] = @InspectionPhotos,
        [inspectionNotes] = @InspectionNotes,
		[isHelperRequestedApproved] = @IsHelperRequestedApproved,
		[helperRequestedAdditionalNotes] = @HelperRequestedAdditionalNotes

    WHERE [ID] = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
    @ID int,
    @FirstName varchar(50),
    @LastName varchar(50),
    @Email varchar(50),
    @PhoneNumber varchar(20),
    @ShiftSchadule varchar(500),
    @EmployeeID varchar(20),
    @Password varbinary(100),
    @EmployeeType int
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Employee]
    SET [FirstName] = @FirstName,
        [LastName] = @LastName,
        [Email] = @Email,
        [PhoneNumber] = @PhoneNumber,
        [ShiftSchadule] = @ShiftSchadule,
        [EmployeeID] = @EmployeeID,
        [Password] = @Password,
        [EmployeeType] = @EmployeeType
    WHERE [ID] = @EmployeeID;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateItem]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItem]
    @ItemID int,
    @ItemName varchar(50),
    @AvailableNum int,
    @Description varchar(250),
    @ImageUrl varbinary(150),
    @GroupName varchar(50),
    @ItemType varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Items]
    SET [ItemName] = @ItemName,
        [AvailableNum] = @AvailableNum,
        [Description] = @Description,
        [ImageUrl] = @ImageUrl,
        [GroupName] = @GroupName,
        [ItemType] = @ItemType
    WHERE [ID] = @ItemID;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateRequestItem]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRequestItem]
    @RequestItemID int,
    @assignedRoomID int,
    @RequestedItemID int,
    @Quantity int,
    @Note varchar(250),
    @RequestedDateTime datetime,
    @IsCompleted bit,
    @ApprovedBySupervisorID int ,
	@requestItemStatus varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[RequestItem]
    SET [assignedRoomID] = @assignedRoomID,
        [RequestedItemID] = @RequestedItemID,
        [Quantity] = @Quantity,
        [Note] = @Note,
        [RequestedDateTime] = @RequestedDateTime,
        [isCompleted] = @IsCompleted,
        [approvedBySupervisorID] = @ApprovedBySupervisorID,
		[requestItemStatus] = @requestItemStatus
    WHERE [ID] = @RequestItemID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateReservation]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReservation]
    @ReservationID int,
    @RoomID int,
    @CheckinDate datetime,
    @CheckoutDate datetime,
    @GuestName varchar(50),
    @NoOfGuest int,
    @AdditionalNotes varbinary(500),
    @IsCompleted bit
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Reservation]
    SET [RoomID] = @RoomID,
        [CheckinDate] = @CheckinDate,
        [CheckoutDate] = @CheckoutDate,
        [guestName] = @GuestName,
        [noOfGuest] = @NoOfGuest,
        [AdditionalNotes] = @AdditionalNotes,
        [isCompleted] = @IsCompleted
    WHERE [ID] = @ReservationID;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateRoom]    Script Date: 4/14/2024 3:56:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateRoomType]    Script Date: 4/14/2024 3:56:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateToken]    Script Date: 4/14/2024 3:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateToken]
    @ID int,
    @refreshToken varchar(150)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Employee]
    SET 
        refreshToken = @refreshToken
    WHERE [ID] = @ID;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[37] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[53] 4[21] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[63] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AssignedRoom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 315
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 222
               Left = 268
               Bottom = 447
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "RoomTypes"
            Begin Extent = 
               Top = 0
               Left = 970
               Bottom = 165
               Right = 1150
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rooms"
            Begin Extent = 
               Top = 20
               Left = 700
               Bottom = 208
               Right = 870
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Reservation"
            Begin Extent = 
               Top = 131
               Left = 1041
               Bottom = 389
               Right = 1216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee_1"
            Begin Extent = 
               Top = 79
               Left = 432
               Bottom = 278
               Right = 602
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 37
         Width =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssignedRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2460
         Table = 2628
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssignedRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssignedRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AssignedRoom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 183
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2820
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_assignedRoomCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_assignedRoomCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 301
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 339
               Bottom = 136
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rt"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "res"
            Begin Extent = 
               Top = 138
               Left = 256
               Bottom = 268
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 138
               Left = 469
               Bottom = 268
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssignedRoomsInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssignedRoomsInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AssignedRoomsInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[14] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RequestItem"
            Begin Extent = 
               Top = 0
               Left = 802
               Bottom = 212
               Right = 1020
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssignedRoom"
            Begin Extent = 
               Top = 39
               Left = 296
               Bottom = 285
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "Rooms"
            Begin Extent = 
               Top = 66
               Left = 547
               Bottom = 258
               Right = 717
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Items"
            Begin Extent = 
               Top = 50
               Left = 1060
               Bottom = 254
               Right = 1230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 247
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'olumnWidths = 11
         Column = 3210
         Alias = 1890
         Table = 2235
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 210
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_EmployeeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_EmployeeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AssignedRoom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 263
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 250
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RequestHelp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RequestHelp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RequestItem"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 204
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_requestItemCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_requestItemCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[10] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -219
      End
      Begin Tables = 
         Begin Table = "Rooms"
            Begin Extent = 
               Top = 172
               Left = 671
               Bottom = 302
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AssignedRoom"
            Begin Extent = 
               Top = 13
               Left = 840
               Bottom = 301
               Right = 1038
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 73
               Left = 1128
               Bottom = 303
               Right = 1298
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Employee_1"
            Begin Extent = 
               Top = 146
               Left = 242
               Bottom = 326
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RequestItem"
            Begin Extent = 
               Top = 11
               Left = 468
               Bottom = 256
               Right = 686
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Items"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 191
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RequestItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 5685
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RequestItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RequestItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Rooms"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 233
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomTypes"
            Begin Extent = 
               Top = 19
               Left = 370
               Bottom = 231
               Right = 550
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_room'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_room'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[45] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AssignedRoom"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 191
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "Rooms"
            Begin Extent = 
               Top = 14
               Left = 403
               Bottom = 204
               Right = 573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 25
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SupervisiorAssignRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SupervisiorAssignRoom'
GO
