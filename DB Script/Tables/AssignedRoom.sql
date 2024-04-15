/****** Object:  Table [dbo].[AssignedRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
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