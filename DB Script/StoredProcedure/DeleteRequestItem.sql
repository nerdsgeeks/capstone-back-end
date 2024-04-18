
/****** Object:  StoredProcedure [dbo].[DeleteRequestItem]    Script Date: 4/14/2024 4:01:15 AM ******/
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