
/****** Object:  StoredProcedure [dbo].[CreateRequestItem]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRequestItem]
    @assignedRoomID int,
    @RequestedItemID int,
    @Quantity int,
    @Note varchar(250),
    @RequestedDateTime datetime,
    @IsCompleted bit,
    @ApprovedBySupervisorID int,
	 @requestItemStatus varchar(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[RequestItem] ([assignedRoomID], [RequestedItemID], [Quantity], [Note], [RequestedDateTime], [isCompleted], [approvedBySupervisorID],[requestItemStatus])
    VALUES (@assignedRoomID, @RequestedItemID, @Quantity, @Note, @RequestedDateTime, @IsCompleted, @ApprovedBySupervisorID, @requestItemStatus);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END
GO