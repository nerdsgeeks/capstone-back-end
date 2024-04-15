/****** Object:  Table [dbo].[Employee]    Script Date: 4/14/2024 4:01:15 AM ******/
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