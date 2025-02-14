--tabla EstatusEst
CREATE TABLE EstatusEst (
  EstatusEstId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NombreEstatus VARCHAR(50) NOT NULL,
  Active BOOLEAN DEFAULT TRUE
);

--tabla Carrera
CREATE TABLE Carrera (
  CarreraId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Clave VARCHAR(10),
  Active BOOLEAN DEFAULT TRUE
  );

--tabla Materia
CREATE TABLE Materia (
MateriaId INTEGER NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(50),
Active BOOLEAN DEFAULT TRUE,
Clave VARCHAR(12),
CarreraId INTEGER,
PRIMARY KEY (MateriaId),
FOREIGN KEY (CarreraId) REFERENCES Carrera(CarreraId)
);

--tabla Clase
CREATE TABLE Clase (
  ClaseId INTEGER PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(25),
  Horario VARCHAR(50),
  MateriaId INTEGER,
  Active BOOLEAN DEFAULT TRUE,
  ProfesorId INTEGER,
  FOREIGN KEY (MateriaId) REFERENCES Materia(MateriaId),
  FOREIGN KEY (ProfesorId) REFERENCES Profesor(ProfesorId)
);

--tabla Profesor
CREATE TABLE Profesor (
  ProfesorId INTEGER PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  APaterno VARCHAR(50),
  AMaterno VARCHAR(50),
  RFC VARCHAR(13),
  Active BOOLEAN DEFAULT TRUE,
  CarreraId INTEGER,
  FOREIGN KEY (CarreraId) REFERENCES Carrera(CarreraId)
);

--tabla Estudiante
CREATE TABLE Estudiante (
  EstudianteId INTEGER PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(25),
  APaterno VARCHAR(25),
  AMaterno VARCHAR(25),
  Aniolngreso INTEGER,
  PeriodoId INTEGER,
  Celular VARCHAR(10),
  Email VARCHAR(50),
  EstatusEstld INTEGER,
  FechaNacimiento DATE,
  UsuarioId INTEGER,
  CarreraId INTEGER,
FOREIGN KEY(PeriodoId) REFERENCES Periodo(PeriodoId),
 FOREIGN KEY (CarreraId) REFERENCES Carrera(CarreraId),
  FOREIGN KEY (UsuarioId) REFERENCES Usuario(UsuarioId)
);

--tabla EstudianteEvaluacion
CREATE TABLE EstudianteEvaluacion(
EstudianteEvaluacionId INTEGER PRIMARY KEY AUTO_INCREMENT,
UnidadI DECIMAL(2,4),
UnidadII DECIMAL(2,4),
UnidadIII DECIMAL(2,4),
PuntosExtras INTEGER,
ClaseId INTEGER,
EstudianteId INTEGER,
FOREIGN KEY (ClaseId) REFERENCES Clase(ClaseId),
FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId)
);

--tabla TipoUsuario
CREATE TABLE TipoUsuario (
  TipoUsuarioId INTEGER PRIMARY KEY AUTO_INCREMENT,
  NombreTipo VARCHAR(25),
  FechaRegistro DATETIME DEFAULT CURDATE()
);

--Tabla Usuario
CREATE TABLE Usuario (
  UsuarioId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nickname VARCHAR(25),
  Contrasenia VARCHAR(25),
  TipoUsuarioId INTEGER,
  UltimoAcceso DATETIME DEFAULT CURDATE(),
  FechaRegistro DATETIME DEFAULT CURDATE(),
  Active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (TipoUsuarioId) REFERENCES TipoUsuario(TipoUsuarioId)
);

CREATE TABLE Version (
    VersionId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(100) NOT NULL,
    VersionBd VARCHAR(50) NOT NULL,
    VersionSistema VARCHAR(50) NOT NULL,
    Notas TEXT
);

CREATE TABLE TipoActividad (
    TipoActividadId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Observaciones TEXT
);

CREATE TABLE Actividad (
    ActividadId INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    ClaseId INTEGER NOT NULL,
    ValorMaximo INTEGER NOT NULL,
    FechaExpiracion DATETIME NOT NULL,
    TipoActividadId INTEGER NOT NULL,
    FOREIGN KEY (TipoActividadId) REFERENCES TipoActividad(TipoActividadId)
);

CREATE TABLE EstudianteActividad (
    EstudianteActividadId INTEGER PRIMARY KEY AUTO_INCREMENT,
    FechaRegistro DATETIME NOT NULL,
    Calificacion INTEGER NOT NULL,
    EstudianteId INTEGER NOT NULL,
    ClaseId INTEGER NOT NULL,
    ActividadId INTEGER NOT NULL,
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId),
    FOREIGN KEY (ActividadId) REFERENCES Actividad(ActividadId),
    FOREIGN KEY (ClaseId) REFERENCES Clase(ClaseId)
);

CREATE TABLE Periodo (
    PeriodoId INTEGER PRIMARY KEY AUTO_INCREMENT,
    NombrePeriodo VARCHAR(50) NOT NULL
);

CREATE TABLE Estado (
    EstadoId INTEGER PRIMARY KEY AUTO_INCREMENT,
    Clave VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Ciudad (
    CiudadId INTEGER PRIMARY KEY AUTO_INCREMENT,
    NombreCiudad VARCHAR(50) NOT NULL,
    Clave VARCHAR(50) NOT NULL,
    EstadoId INTEGER NOT NULL,
    FOREIGN KEY (EstadoId) REFERENCES Estado(EstadoId)
);

CREATE TABLE Domicilio (
    DomicilioId INTEGER PRIMARY KEY AUTO_INCREMENT,
    Direccion VARCHAR(50) NOT NULL,
    EstudianteId INTEGER NOT NULL,
    EstadoId INTEGER NOT NULL,
    CiudadId INTEGER NOT NULL,
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId),
    FOREIGN KEY (EstadoId) REFERENCES Estado(EstadoId),
    FOREIGN KEY (CiudadId) REFERENCES Ciudad(CiudadId)
);

CREATE TABLE EstudianteClase (
    EstudianteClaseId INTEGER PRIMARY KEY AUTO_INCREMENT,
    ClaseId INTEGER NOT NULL,
    EstudianteId INTEGER NOT NULL,
    FOREIGN KEY (ClaseId) REFERENCES Clase(ClaseId),
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId)
);
