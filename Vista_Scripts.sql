CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `classicmodels`.`vista_ordenes_por_cliente` AS
    SELECT 
        `e`.`firstName` AS `NombreEmpleado`,
        `e`.`lastName` AS `ApellidoEmpleado`,
        `c`.`customerName` AS `NombreCliente`,
        `o`.`customerNumber` AS `NumeroDeCliente`,
        `p`.`productName` AS `NombreProducto`,
        `od`.`quantityOrdered` AS `Cantidad`,
        `p`.`productDescription` AS `Descripcion`,
        `o`.`status` AS `EstadoEnvio`,
        `offi`.`addressLine1` AS `Direccion`,
        `offi`.`city` AS `Ciudad`,
        `offi`.`postalCode` AS `CodigoPostal`,
        `offi`.`country` AS `Pais`,
        `pay`.`amount` AS `TotalPagar`
    FROM
        ((((((`classicmodels`.`customers` `c`
        LEFT JOIN `classicmodels`.`employees` `e` ON ((`e`.`employeeNumber` = `c`.`salesRepEmployeeNumber`)))
        LEFT JOIN `classicmodels`.`orders` `o` ON ((`c`.`customerNumber` = `o`.`customerNumber`)))
        LEFT JOIN `classicmodels`.`orderdetails` `od` ON ((`od`.`orderNumber` = `o`.`orderNumber`)))
        LEFT JOIN `classicmodels`.`products` `p` ON ((`p`.`productCode` = `od`.`productCode`)))
        LEFT JOIN `classicmodels`.`offices` `offi` ON ((`offi`.`officeCode` = `e`.`officeCode`)))
        LEFT JOIN `classicmodels`.`payments` `pay` ON ((`pay`.`customerNumber` = `c`.`customerNumber`)))