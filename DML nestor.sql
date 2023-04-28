USE banca_Electronica;

INSERT INTO cliente (codigoCliente, nombreCliente, apellidoCliente, sexoCliente, nacionalidadCliente, identificacionCliente, tipoIdentificacion)
VALUES (1, 'Nestor Alejandro', 'Juarez Albeño', 'Masculino', 'Guatemalteco', '2434224820101', 'DPI');

INSERT INTO cliente (codigoCliente, nombreCliente, apellidoCliente, sexoCliente, nacionalidadCliente, identificacionCliente, tipoIdentificacion)
VALUES (2, 'Jose Manuel', 'Ramirez Gonzales', 'Masculino', 'Guatemalteco', '2665580170101', 'DPI');

INSERT INTO cliente (codigoCliente, nombreCliente, apellidoCliente, sexoCliente, nacionalidadCliente, identificacionCliente, tipoIdentificacion)
VALUES (3, 'José Fernando', 'Herrera Garcia', 'Masculino', 'Mexicano', '036985481284', 'Pasaporte');

INSERT INTO cliente (codigoCliente, nombreCliente, apellidoCliente, sexoCliente, nacionalidadCliente, identificacionCliente, tipoIdentificacion)
VALUES (4, 'Sofia Daniela', 'Perez', 'Femenino', 'Española', '658756462415', 'Pasaporte');

SELECT * FROM cliente;


INSERT INTO cuentasBancarias (idCuenta, propietarioCuenta, tipoCuenta, monedaCuenta, saldoCuenta)
VALUES (0958789514, 1, 'Monetaria', 'Quetzales', '500');

 INSERT INTO cuentasBancarias (idCuenta, propietarioCuenta, tipoCuenta, monedaCuenta, saldoCuenta)
VALUES (0587892482, 3, 'De Ahorro', 'Peso Mexicano', '12000');

 INSERT INTO cuentasBancarias (idCuenta, propietarioCuenta, tipoCuenta, monedaCuenta, saldoCuenta)
 VALUES (8952479562, 2, 'Planilla', 'Quetzales', '3500');
 
  INSERT INTO cuentasBancarias (idCuenta, propietarioCuenta, tipoCuenta, monedaCuenta, saldoCuenta)
  VALUES (1234567890, 1, 'Pension', 'Quetzales', '2500');
  
   INSERT INTO cuentasBancarias (idCuenta, propietarioCuenta, tipoCuenta, monedaCuenta, saldoCuenta)
   VALUES (55574896366, 4, 'Tarjeta de Credito', 'Dolares', '5000');
   
   SELECT * FROM cuentasBancarias;
   
  
  
 INSERT INTO usuario (propietarioUsuario, cuentaAsociada, contraseñaUsuario, nombreUsuario, estadoUsuario, fechaCreacion)
 VALUES (1, 0958789514, 'buenosdias', 'alejuarez', 'Habilitado', "2020-08-15");
 
 INSERT INTO usuario (propietarioUsuario, cuentaAsociada, contraseñaUsuario, nombreUsuario, estadoUsuario, fechaCreacion)
 VALUES (2, 8952479562, 'buenastardes', 'jRamirez', 'Habilitado', "2021-06-08");
 
 INSERT INTO usuario (propietarioUsuario, cuentaAsociada, contraseñaUsuario, nombreUsuario, estadoUsuario, fechaCreacion)
VALUES (3, 0587892482, 'FernandoHerrera', 'Fernando10', 'Deshabilitada temporalmente', "2020-05-08");

INSERT INTO usuario (propietarioUsuario, cuentaAsociada, contraseñaUsuario, nombreUsuario, estadoUsuario, fechaCreacion)
VALUES (4, 55574896366, 'CiudadDeGuatemala', 'Sofia Daniela1', 'Habilitado', "2021-09-21");

 INSERT INTO usuario (propietarioUsuario, cuentaAsociada, contraseñaUsuario, nombreUsuario, estadoUsuario, fechaCreacion)
 VALUES (1, 1234567890, 'buenasnoches', 'alejuarez2', 'Habilitado', "2021-06-06");
   
   SELECT * FROM usuario;
 
 
 
INSERT INTO historialTransacciones (idTransaccion, fechaTransaccion, montoTransaccion, cuentaProveedora, cuentaAcreedora,  monedaTransaccion, motivoTransaccion,pagado)
VALUES (1,"2021-09-06", '150', '8952479562', NULL, 'Quetzales','Pago Internet','Claro');

INSERT INTO historialTransacciones (idTransaccion, fechaTransaccion, montoTransaccion, cuentaProveedora, cuentaAcreedora,  monedaTransaccion, motivoTransaccion,pagado)
VALUES (2, "2021-08-05", '100', 55574896366, NULL, 'Dolares', 'Pago Luz', 'EEGSA'); 

INSERT INTO historialTransacciones (idTransaccion, fechaTransaccion, montoTransaccion, cuentaProveedora, cuentaAcreedora,  monedaTransaccion, motivoTransaccion,pagado)
VALUES (3, "2021-01-01", '200', 55574896366, NULL, 'Quetzales', 'Regalo', 'Nestor Alejandro, Juarez Albeño');

INSERT INTO historialTransacciones (idTransaccion, fechaTransaccion, montoTransaccion, cuentaProveedora, cuentaAcreedora,  monedaTransaccion, motivoTransaccion,pagado)
VALUES (4, "2021-08-07", '80', 1234567890, NULL, 'Quetzales', 'Deuda', 'José Fernando, Herrera Garcia');

INSERT INTO historialTransacciones (idTransaccion, fechaTransaccion, montoTransaccion, cuentaProveedora, cuentaAcreedora,  monedaTransaccion, motivoTransaccion,pagado)
VALUES (5, "2021-07-01", '50', 55574896366, NULL, 'Quetzales', 'Pago Comida', 'Nestor Alejandro, Juarez Albeño');

SELECT * FROM historialTransacciones;

