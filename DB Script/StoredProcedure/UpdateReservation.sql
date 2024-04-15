
/****** Object:  StoredProcedure [dbo].[UpdateReservation]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReservation]
    @ReservationID int,
    @RoomID int,
    @CheckinDate datetime,
    @CheckoutDate datetime,
    @GuestName varchar(50),
    @NoOfGuest int,
    @AdditionalNotes varbinary(500),
    @IsCompleted bit
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Reservation]
    SET [RoomID] = @RoomID,
        [CheckinDate] = @CheckinDate,
        [CheckoutDate] = @CheckoutDate,
        [guestName] = @GuestName,
        [noOfGuest] = @NoOfGuest,
        [AdditionalNotes] = @AdditionalNotes,
        [isCompleted] = @IsCompleted
    WHERE [ID] = @ReservationID;
END

GO