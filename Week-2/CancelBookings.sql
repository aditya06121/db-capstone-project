CREATE PROCEDURE CancelBooking
    @BookingID INT
AS
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = @BookingID;
END;
