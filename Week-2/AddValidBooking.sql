CREATE PROCEDURE AddValidBooking (IN BookingDate DATE, IN TableNumber INT)

START TRANSACTION;

SELECT BookingDate, TableNumber
WHERE exists (SELECT * from Booking where Date = Date and TableNumber = TableNumber)

INSERT INTO booking (date, table_number)
VALUES (Date, TableNumber);
COMMIT; 

    
