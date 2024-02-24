CREATE PROCEDURE UpdateBooking (IN BookingID INT, IN Date DATE)
BEGIN
UPDATE booking SET date = BookingDate WHERE BookingID = BookingID; 
END