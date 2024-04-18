
/****** Object:  StoredProcedure [dbo].[GetRooms]    Script Date: 4/14/2024 4:01:15 AM ******/
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