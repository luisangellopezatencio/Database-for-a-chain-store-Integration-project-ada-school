CREATE TABLE cliente (
	ID serial primary key,
	Nombre text not null,
	Telefono integer
);

CREATE TABLE sucursal (
	ID serial primary key,
	Nombre text not null,
	Direccion text
);

CREATE TABLE orden (
    ID serial PRIMARY KEY,
    Cliente_ID INTEGER,
    Sucursal_ID INTEGER,
    Fecha_orden DATE NOT NULL,
    Total REAL NOT NULL,
    FOREIGN KEY (Cliente_ID) REFERENCES cliente(ID),
    FOREIGN KEY (Sucursal_ID) REFERENCES sucursal(ID)
);

CREATE TABLE categoria (
	ID serial PRIMARY KEY,
	Nombre TEXT NOT NULL
);

CREATE TABLE producto (
	ID serial PRIMARY KEY,
	Nommbre TEXT NOT NULL,
	Marca TEXT,
	Categoria_ID INTEGER,
	Precio_unitario REAL,
	FOREIGN KEY (Categoria_ID) REFERENCES categoria(ID)
);

CREATE TABLE stock (
	ID serial PRIMARY KEY,
	Sucursal_ID INTEGER,
	Producto_ID INTEGER,
	Total REAL NOT NULL,
	FOREIGN KEY (Sucursal_ID) REFERENCES sucursal(ID),
	FOREIGN KEY (Producto_ID) REFERENCES producto(ID)
);

CREATE TABLE item (
	ID serial PRIMARY KEY,
	Orden_ID INTEGER,
	Producto_ID INTEGER,
	Cantidad REAL NOT NULL,
	Monto_venta REAL NOT NULL,
	FOREIGN KEY (Orden_ID) REFERENCES orden(ID),
	FOREIGN KEY (Producto_ID) REFERENCES producto(ID)
);



