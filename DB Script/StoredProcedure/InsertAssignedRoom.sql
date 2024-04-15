
/****** Object:  StoredProcedure [dbo].[InsertAssignedRoom]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[InsertAssignedRoom]
    @RoomID int,
    @RoomStatus varchar(50),
    @AssignedDateTime datetime,
    @assignedEmployeeID int,
    @CleaningStatus varchar(50),
    @IsCompleted bit,
    @VerifiedPhotoUrl varchar(150),
    @StartTime datetime,
    @EndTime datetime,
    @CleaningDuration time,
    @IsHelperRequested bit,
    @RequestedHelperID int,
    @AdditionalNotes varchar(500),
    @InspectionFeedback varchar(500),
    @Rating int,
    @InspectionPhotos varchar(max),
    @InspectionNotes varchar(500)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[AssignedRoom] (
        [RoomID],
        [assignedDateTime],
        [assignedEmployeeID],
        [cleaningStatus],
        [isCompleted],
        [verifiedPhotoUrl],
        [startTime],
        [endTime],
        [cleaningDuration],
        [isHelperRequested],
        [reguestedHelperID],
        [AdditionalNotes],
        [inspectionFeedback],
        [rating],
        [inspectionPhotos],
        [inspectionNotes]
    )
    VALUES (
        @RoomID,
        @AssignedDateTime,
        @assignedEmployeeID,
        @CleaningStatus,
        @IsCompleted,
        @VerifiedPhotoUrl,
        @StartTime,
        @EndTime,
        @CleaningDuration,
        @IsHelperRequested,
        @RequestedHelperID,
        @AdditionalNotes,
        @InspectionFeedback,
        @Rating,
        @InspectionPhotos,
        @InspectionNotes
    );
END

GO