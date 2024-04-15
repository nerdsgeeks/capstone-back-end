
/****** Object:  View [dbo].[View_EmployeeCount]    Script Date: 4/14/2024 4:01:15 AM ******/
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