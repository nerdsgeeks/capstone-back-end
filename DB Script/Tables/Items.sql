
/****** Object:  Table [dbo].[Items]    Script Date: 4/14/2024 4:01:15 AM ******/
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