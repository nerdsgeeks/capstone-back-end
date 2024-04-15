
/****** Object:  StoredProcedure [dbo].[UpdateAssignedRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateAssignedRoom]
    @ID int,
    @RoomID int,
    @AssignedDateTime datetime,
    @AssignedEmployeeID int,
    @CleaningStatus varchar(50),
    @IsCompleted bit,
    @VerifiedPhotoUrl varchar(150),
    @StartTime datetime,
    @EndTime datetime,
    @CleaningDuration datetime,
    @IsHelperRequested bit,
    @RequestedHelperID int,
    @AdditionalNotes varchar(500),
    @InspectionFeedback varchar(500),
    @Rating int,
    @InspectionPhotos varchar(max),
    @InspectionNotes varchar(500),
	@IsHelperRequestedApproved bit,
	@HelperRequestedAdditionalNotes varchar(500)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[AssignedRoom]
    SET [RoomID] = @RoomID,
        [assignedDateTime] = @AssignedDateTime,
        [assignedEmployeeID] = @AssignedEmployeeID,
        [cleaningStatus] = @CleaningStatus,
        [isCompleted] = @IsCompleted,
        [verifiedPhotoUrl] = @VerifiedPhotoUrl,
        [startTime] = @StartTime,
        [endTime] = @EndTime,
        [cleaningDuration] = @CleaningDuration,
        [isHelperRequested] = @IsHelperRequested,
        [reguestedHelperID] = @RequestedHelperID,
        [AdditionalNotes] = @AdditionalNotes,
        [inspectionFeedback] = @InspectionFeedback,
        [rating] = @Rating,
        [inspectionPhotos] = @InspectionPhotos,
        [inspectionNotes] = @InspectionNotes,
		[isHelperRequestedApproved] = @IsHelperRequestedApproved,
		[helperRequestedAdditionalNotes] = @HelperRequestedAdditionalNotes

    WHERE [ID] = @ID;
END
GO