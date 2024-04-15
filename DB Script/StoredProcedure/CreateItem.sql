
/****** Object:  StoredProcedure [dbo].[CreateItem]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateItem]
    @ItemName varchar(50),
    @AvailableNum int,
    @Description varchar(250),
    @ImageUrl varchar(150),
    @GroupName varchar(50),
    @ItemType varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Items] ([ItemName], [AvailableNum], [Description], [ImageUrl], [GroupName], [ItemType])
    VALUES (@ItemName, @AvailableNum, @Description, @ImageUrl, @GroupName, @ItemType);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END

GO