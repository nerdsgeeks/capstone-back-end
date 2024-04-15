
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/14/2024 4:01:15 AM ******/
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