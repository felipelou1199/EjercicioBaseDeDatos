/* Ejercicio 1 */
-- a Consultar las tablas para saber que contiene 
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM payments;
SELECT * FROM productlines;
SELECT * FROM products;

-- b: obtener ordenes completas por cleinte 
SELECT E.firstName AS NombreEmpleado, E.lastName AS ApellidoEmpleado ,c.customerName AS NombreCliente, O.customerNumber AS Numerodecliente, P.productName AS NombreProducto,OD.quantityOrdered AS Cantidad , P.productDescription AS Descripcion,O.status  AS EstadoEnvio,offi.addressLine1 AS Direccion, offi.city AS Ciudad,
offi.postalCode AS CodigoPostal, offi.city AS Pais, Pay.amount AS TotalPagar
FROM customers AS C
LEFT JOIN employees E ON E.employeeNumber = C.salesRepEmployeeNumber
LEFT JOIN orders O ON C.customerNumber = O.customerNumber
LEFT JOIN orderdetails OD ON OD.orderNumber = O.orderNumber
LEFT JOIN products P ON P.productCode = OD.productCode
LEFT JOIN offices offi ON offi.officeCode = E.officeCode
LEFT JOIN payments Pay ON Pay.customerNumber = C.customerNumber;

-- C: Crea una vista
SELECT * FROM vista_ordenes_por_cliente;