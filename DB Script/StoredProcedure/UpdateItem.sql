
/****** Object:  StoredProcedure [dbo].[UpdateItem]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateItem]
    @ItemID int,
    @ItemName varchar(50),
    @AvailableNum int,
    @Description varchar(250),
    @ImageUrl varbinary(150),
    @GroupName varchar(50),
    @ItemType varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Items]
    SET [ItemName] = @ItemName,
        [AvailableNum] = @AvailableNum,
        [Description] = @Description,
        [ImageUrl] = @ImageUrl,
        [GroupName] = @GroupName,
        [ItemType] = @ItemType
    WHERE [ID] = @ItemID;
END

GO