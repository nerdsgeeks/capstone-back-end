
/****** Object:  View [dbo].[View_RequestHelp]    Script Date: 4/14/2024 4:01:15 AM ******/
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