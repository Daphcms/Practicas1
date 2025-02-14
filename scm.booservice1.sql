Db: scm.bookservice.sql

CREATE TABLE Usuario(
    UsuarioId INTEGER NOT NULL AUTO_INCREMENT,
    NickName VARCHAR(50),
    Password VARCHAR(64),
    PRIMARY KEY (UsuarioId)
);

CREATE TABLE Marca(
    MarcaId INTEGER NOT NULL AUTO_INCREMENT,
    NombreMarca VARCHAR(50),
    PRIMARY KEY (MarcaId)
);
CREATE TABLE Unidad(
    UnidadId INTEGER NOT null AUTO_INCREMENT,
    NombreUnidad VARCHAR(50),
    Descripcion VARCHAR(50),
    PRIMARY KEY (UnidadId)
);
CREATE TABLE Proveedor(
    ProveedorId INTEGER NOT null AUTO_INCREMENT,
    Compania VARCHAR(50),
    NombreProveedor VARCHAR(50),
    Direccion VARCHAR(50),
    Celular VARCHAR(10),
    PRIMARY KEY (ProveedorId)
);
CREATE TABLE Precio (
    PrecioId INTEGER NOT NULL AUTO_INCREMENT,
    PrecioCompra FLOAT(5,1),
    PrecioVenta FLOAT(5,1),
    Active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (PrecioId)
);
CREATE TABLE FacturaCompra(
    FacturaCompraId INTEGER NOT NULL AUTO_INCREMENT,
    FechaCompra DATETIME DEFAULT CURDATE(),
    ProveedorId INTEGER,
    PRIMARY KEY (FacturaCompraId)
);
CREATE TABLE MarcaProveedor (
    MarcaProveedorId INTEGER NOT NULL AUTO_INCREMENT,
    MarcaId INTEGER,
    ProveedorId INTEGER,
    FOREIGN KEY (MarcaId) REFERENCES Marca(MarcaId),
    FOREIGN KEY (ProveedorId) REFERENCES Proveedor(ProveedorId),
    PRIMARY KEY (MarcaProveedorId)
);

CREATE TABLE Cliente(
    ClienteId INTEGER NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Direccion VARCHAR(50),
    Celular VARCHAR(10),
    PRIMARY KEY (ClienteId)
);
CREATE TABLE FacturaVenta(
    FacturaVentaId INTEGER NOT NULL AUTO_INCREMENT,
    FechaVenta DATETIME DEFAULT CURDATE(),
    ClienteId INTEGER,
    PRIMARY KEY (FacturaVentaId),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(ClienteId)
);
CREATE TABLE Imagen(
    ImagenId INTEGER NOT NULL AUTO_INCREMENT,
    Ruta VARCHAR(70),
    Nombre VARCHAR(70),
    PRIMARY KEY (ImagenId)
);

CREATE TABLE Producto(
    ProductoId INTEGER NOT NULL AUTO_INCREMENT,
    Descripcion VARCHAR(50),
    Codigo VARCHAR(10),
    MarcaId INTEGER,
    PrecioId INTEGER,
    UnidadId INTEGER,
    ImagenId INTEGER,
    ProveedorId INTEGER,
    FOREIGN KEY (MarcaId) REFERENCES Marca(MarcaId),
    FOREIGN KEY (PrecioId) REFERENCES Precio(PrecioId),
    FOREIGN KEY (UnidadId) REFERENCES Unidad(UnidadId),
    FOREIGN KEY (ImagenId) REFERENCES Imagen(ImagenId),
    FOREIGN KEY (ProveedorId) REFERENCES Proveedor(ProveedorId),
    PRIMARY KEY (ProductoId)
);
CREATE TABLE ProductoFactura(
    ProductoFacturaId INTEGER NOT NULL AUTO_INCREMENT,
    ProductoId INTEGER,
    FOREIGN KEY (ProductoId) REFERENCES Producto(ProductoId),
    PRIMARY KEY (ProductoFacturaId)
);

CREATE TABLE ProductoProveedor(
    ProductoProveedorId INTEGER NOT NULL AUTO_INCREMENT,
    ProductoId INTEGER,
    ProveedorId INTEGER,
    FOREIGN KEY (ProductoId) REFERENCES Producto(ProductoId),
    FOREIGN KEY (ProveedorId) REFERENCES Proveedor(ProveedorId),
    PRIMARY KEY (ProductoProveedorId)
);

CREATE TABLE ProductoImagen(
    ProductoImagenId INTEGER NOT NULL AUTO_INCREMENT,
    ProductoId INTEGER,
    ImagenId INTEGER,
    FOREIGN KEY (ProductoId) REFERENCES Producto(ProductoId),
    FOREIGN KEY (ImagenId) REFERENCES Imagen(ImagenId),
    PRIMARY KEY (ProductoImagenId)
);

CREATE TABLE Repartidor(
    RepartidorId INTEGER NOT NULL AUTO_INCREMENT,
    NombreRepartidor VARCHAR(50),
    ApellidoRepartidor VARCHAR(50),
    PRIMARY KEY (RepartidorId)
);

CREATE TABLE Departamento(
    DepartamentoId INTEGER NOT NULL AUTO_INCREMENT,
    NombreDepartamento VARCHAR(150),
    Descripción VARCHAR(50),
    PRIMARY KEY (DepartamentoId)
);
INSERT INTO Usuario (NickName, Password) VALUES ('admin','admin34');

INSERT INTO usuario (NickName, Password) VALUES ('Sarai', '12345');

INSERT INTO usuario (NickName, Password) VALUES ('Carolina', 'Lucas32');

INSERT INTO usuario (NickName, Password) VALUES ('Leo', 'Tom54');

INSERT INTO usuario (NickName, Password) VALUES ('Neo', '3528');

INSERT INTO usuario (NickName, Password) VALUES ('Gama', '13134');

INSERT INTO usuario (NickName, Password) VALUES ('Fran', '10130');

INSERT INTO usuario (NickName, Password) VALUES ('Usui', 'Niria');

INSERT INTO usuario (NickName, Password) VALUES ('Alexa', '1144');

INSERT INTO usuario (NickName, Password) VALUES ('Elin', '61215');

INSERT INTO usuario (NickName, Password) VALUES ('Yoselin', '12053');

SELEC * FROM Usuario;

UPDATE Usuario SET NickName='Sarai editado'
WHERE UsuarioId=2;

UPDATE Usuario SET NickName='Carolina editado'
WHERE UsuarioId=3;

UPDATE Usuario SET NickName='Leo editado'
WHERE UsuarioId=4;

UPDATE Usuario SET NickName='Neo editado'
WHERE UsuarioId=5;

UPDATE Usuario SET NickName='Gama editado'
WHERE UsuarioId=6;

UPDATE Usuario SET NickName='Fran editado'
WHERE UsuarioId=7;

UPDATE Usuario SET NickName='Usui editado'
WHERE UsuarioId=8;

UPDATE Usuario SET NickName='Alexa editado'
WHERE UsuarioId=9;

UPDATE Usuario SET NickName='Elin editado'
WHERE UsuarioId=10;

UPDATE Usuario SET NickName='Jose editado'
WHERE UsuarioId=11;

SELECT * FROM Usuario;

DELETE FROM Usuario WHERE UsuarioId=1;

