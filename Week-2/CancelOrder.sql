CREATE PROCEDURE CancelOrder(IN OrderID INT)
AS
BEGIN
    DELETE FROM orders
    WHERE OrderID = @OrderID;
END;
