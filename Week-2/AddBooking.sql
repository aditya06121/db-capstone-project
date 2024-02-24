CREATE PROCEDURE AddBooking (IN BookingID INT, IN CustomerID INT, IN TableNumber INT, IN Date DATE)
BEGIN
INSERT INTO Bookings (BookingID, CustomerID, TableNumber, Date) VALUES (BookingID, CustomerID, TableNumber, BookingDate); 
END