
/****** Object:  StoredProcedure [dbo].[DeleteReservation]    Script Date: 4/14/2024 4:01:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteReservation]
    @ReservationID int
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Reservation]
    WHERE [ID] = @ReservationID;
END

GO