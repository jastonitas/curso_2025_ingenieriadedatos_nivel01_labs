
-- Tabla: Cliente
CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    tipo_documento VARCHAR(20),
    numero_documento VARCHAR(20),
    fecha_nacimiento DATE,
    segmento VARCHAR(50)
);

-- Tabla: CuentaBancaria
CREATE TABLE CuentaBancaria (
    id_cuenta SERIAL PRIMARY KEY,
    numero_cuenta VARCHAR(30),
    tipo_cuenta VARCHAR(30),
    moneda VARCHAR(10),
    saldo NUMERIC(18,2),
    fecha_apertura DATE,
    id_cliente INTEGER REFERENCES Cliente(id_cliente)
);

-- Tabla: Prestamo
CREATE TABLE Prestamo (
    id_prestamo SERIAL PRIMARY KEY,
    monto NUMERIC(18,2),
    tasa_interes NUMERIC(5,2),
    plazo_meses INTEGER,
    tipo_amortizacion VARCHAR(30),
    fecha_desembolso DATE,
    id_cliente INTEGER REFERENCES Cliente(id_cliente)
);

-- Tabla: MovimientoCuenta
CREATE TABLE MovimientoCuenta (
    id_movimiento SERIAL PRIMARY KEY,
    fecha DATE,
    tipo_movimiento VARCHAR(30),
    monto NUMERIC(18,2),
    canal VARCHAR(30),
    id_cuenta INTEGER REFERENCES CuentaBancaria(id_cuenta)
);

-- Tabla: ProvisionCredito
CREATE TABLE ProvisionCredito (
    id_provision SERIAL PRIMARY KEY,
    fecha DATE,
    porcentaje_provision NUMERIC(5,2),
    estado_credito VARCHAR(30),
    ifrs9_stage VARCHAR(10),
    id_prestamo INTEGER REFERENCES Prestamo(id_prestamo)
);

-- Tabla: ReporteRegulatorio
CREATE TABLE ReporteRegulatorio (
    id_reporte SERIAL PRIMARY KEY,
    codigo_reporte VARCHAR(30),
    mes INTEGER,
    anio INTEGER,
    entidad VARCHAR(100),
    segmento VARCHAR(50),
    monto_total NUMERIC(18,2),
    id_cliente INTEGER REFERENCES Cliente(id_cliente)
);
