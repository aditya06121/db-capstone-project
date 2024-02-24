SELECT 
    c.CustomerID,
    c.Name AS FullName,
    o.OrderID,
    o.Cost,
    m.MenuName,
    mi.ItemName,
    mi.Category
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    Menus m ON o.MenuID = m.MenuID
JOIN 
    MenuItems mi ON m.MenuID = mi.MenuID
WHERE 
    o.Cost > 150
ORDER BY 
    o.Cost;
