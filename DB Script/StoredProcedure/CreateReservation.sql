
/****** Object:  StoredProcedure [dbo].[CreateReservation]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateReservation]
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

    INSERT INTO [dbo].[Reservation] ([RoomID], [CheckinDate], [CheckoutDate], [guestName], [noOfGuest], [AdditionalNotes], [isCompleted])
    VALUES (@RoomID, @CheckinDate, @CheckoutDate, @GuestName, @NoOfGuest, @AdditionalNotes, @IsCompleted);
    
    SELECT SCOPE_IDENTITY() AS [ID]; -- Return the ID of the newly inserted record
END

GO