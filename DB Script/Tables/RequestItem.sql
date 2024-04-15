
/****** Object:  Table [dbo].[RequestItem]    Script Date: 4/14/2024 4:01:15 AM ******/
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