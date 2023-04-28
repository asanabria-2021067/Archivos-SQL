USE banca_Electronica;

DELIMITER $$
	CREATE PROCEDURE ingresarClientes(IN nombre_Cliente VARCHAR(50), apellido_Cliente VARCHAR(50),
    sexo_Cliente VARCHAR (9), nacionalidad_Cliente VARCHAR(50), identificacion_Cliente BIGINT,
    tipo_Identificacion VARCHAR (10))
	BEGIN
	INSERT INTO cliente(nombreCliente, apellidoCliente, sexoCliente, nacionalidadCliente, identificacionCliente
    ,tipoIdentificacion)
	VALUES (nombre_Cliente, apellido_Cliente, sexo_Cliente, nacionalidad_Cliente, identificacion_Cliente
    ,tipo_Identificacion);
	END$$
	CALL ingresarClientes("Angel Gabriel",'Sanabria Morales', 'Masculino', 'Guatemalteco', '3253464563453', 'DPI');
    Drop procedure ingresarClientes;
    
    DELIMITER $$
    CREATE PROCEDURE borrarClientes(IN borrador int)
	BEGIN
		DELETE FROM cliente
        where codigoCliente=borrador;
    END$$
    CALL borrarClientes(5);
    
	DELIMITER $$
    CREATE PROCEDURE modificarClientes(IN codigo_Cliente int, nombre_Cliente VARCHAR(50), 
    apellido_Cliente VARCHAR(50))
	BEGIN
		UPDATE cliente
        set nombreCliente=nombre_Cliente, apellidoCliente=apellido_Cliente where codigoCliente=codigo_Cliente;
    END$$
    CALL modificarClientes(1, "Jose Miguel", "Gutierrez Sosa");
    drop procedure modificarClientes;

DELIMITER $$
	CREATE PROCEDURE ingresarTransaccion(IN fecha_Transaccion DATE, monto_Transaccion BIGINT,
    cuenta_Proveedora BIGINT, cuenta_Acreedora BIGINT, moneda_Transaccion VARCHAR (25),
 motivo_Transaccion VARCHAR (50), pagado VARCHAR (50))
	BEGIN
	INSERT INTO historialTransacciones(fechaTransaccion, montoTransaccion, cuentaProveedora, cuentaAcreedora, monedaTransaccion
    ,motivoTransaccion, pagado)
	VALUES (fecha_Transaccion, monto_Transaccion, cuenta_Proveedora, cuenta_Acreedora, moneda_Transaccion
    ,motivo_Transaccion,pagado);
	END$$
	CALL ingresarTransaccion("2021-07-06", '32', 8952479562, NULL, 'Dolares', 'Pago Internet', 'Angel Gabriel, Sanabria Morales');

DELIMITER $$
CREATE PROCEDURE modificarTransacciones (IN id_Transaccion INT, fecha_Transaccion DATE, monto_Transaccion BIGINT,
    cuenta_Proveedora BIGINT, cuenta_Acreedora BIGINT, moneda_Transaccion VARCHAR (25),
 motivo_Transaccion VARCHAR (50), pagado VARCHAR (50))
	BEGIN
		UPDATE historialTransacciones
        set idTransaccion=id_Transaccion, fechaTransaccion=fecha_Transaccion,
        montoTransaccion=monto_Transaccion, cuentaProveedora=cuenta_Proveedora, 
        cuentaAcreedora=cuenta_Acreedora, monedaTransaccion=moneda_Transaccion, 
        motivoTransaccion=motivo_Transaccion WHERE idTransaccion=id_Transaccion;
    END$$
    CALL modificarTransacciones(2, "2021/09/21", 200, 8952479562, NULL, "Dolares", "Consumo Comida", "Angel Sanabria");

DELIMITER $$
    CREATE PROCEDURE modificarCuentasBancarias(IN id_Cuenta INT, propietario_Cuenta INT,tipo_Cuenta VARCHAR(50),
   moneda_Cuenta VARCHAR (25),saldo_Cuenta BIGINT)
	BEGIN
		UPDATE cuentasBancarias
        set saldoCuenta = saldo_Cuenta, propietarioCuenta=propietario_Cuenta, tipoCuenta=tipo_Cuenta, monedaCuenta= moneda_Cuenta WHERE idCuenta=id_Cuenta;
    END$$
    CALL modificarCuentasBancarias(958789514, '3', 'Ahorro','Dolares', 500);
