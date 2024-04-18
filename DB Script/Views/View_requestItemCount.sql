
/****** Object:  View [dbo].[View_requestItemCount]    Script Date: 4/14/2024 4:01:15 AM ******/
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