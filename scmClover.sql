--Foranea1
CREATE TABLE foranea1(
    CreatedBy INTEGER PRIMARY KEY NOT NULL
);


--Tabla Client
CREATE TABLE Client (
    ClientId INTEGER NOT NULL PRIMARY KEY,
    CreatedBy INTEGER,
    UpdatedDate DATETIME ,
    Name VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Cell VARCHAR(10),
    Email VARCHAR(50) NOT NULL UNIQUE,
    Observations VARCHAR(300),
    Active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (CreatedBy) REFERENCES foranea1(CreatedBy)
);
--Foranea2
CREATE TABLE foranea2( 
UpdatedBy INTEGER NOT NULL PRIMARY KEY
);

--Tabla Raffle
CREATE TABLE Raffle (
    RaffleId INTEGER NOT NULL PRIMARY KEY,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Description VARCHAR(300) NOT NULL,
    StartDate DATETIME NOT NULL,
    RaffleDate DATETIME DEFAULT CURDATE(),
    Active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (CreatedBy) REFERENCES foranea1(CreatedBy),
    FOREIGN KEY (UpdatedBy) REFERENCES foranea2(UpdatedBy)
);

--Tabla Ticket
CREATE TABLE Ticket (
    TicketId INTEGER NOT NULL PRIMARY KEY,
    RaffleId INTEGER,
    ClientId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Active BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedDate DATETIME DEFAULT CURDATE(),
    UpdatedDate DATETIME DEFAULT CURDATE(),
    FOREIGN KEY (RaffleId) REFERENCES Raffle(RaffleId),
    FOREIGN KEY (ClientId) REFERENCES Client(ClientId),
    FOREIGN KEY (CreatedBy) REFERENCES foranea1(CreatedBy),
    FOREIGN KEY (UpdatedBy) REFERENCES foranea2(UpdatedBy)
);

--Tabla UserUC
CREATE TABLE UserUC (
    UserUCId INTEGER NOT NULL PRIMARY KEY,
    CreatedDate DATETIME  DEFAULT CURDATE(),
    UpdatedBy INTEGER,
    Username VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    LastAccess DATETIME  DEFAULT CURDATE(),
    Active BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedBy INTEGER,
    UpdatedDate DATETIME  DEFAULT CURDATE(),
    FOREIGN KEY (UpdatedBy) REFERENCES foranea2(UpdatedBy)
 );

--Tabla Prize
CREATE TABLE Prize(
    PrizeId INTEGER NOT NULL PRIMARY KEY,
    RaffleId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Producto VARCHAR(100),
    Active BOOLEAN DEFAULT TRUE,
    CreatedDate DATETIME DEFAULT CURDATE(),
    UpdatedDate DATETIME DEFAULT CURDATE(),
    FOREIGN KEY (RaffleId) REFERENCES Raffle(RaffleId),
    FOREIGN KEY (CreatedBy) REFERENCES foranea1(CreatedBy),
    FOREIGN KEY (UpdatedBy) REFERENCES foranea2(UpdatedBy)
 );

--Tabla Winner
CREATE TABLE Winner (
    WinnerId INTEGER NOT NULL PRIMARY KEY,
    TicketId INTEGER,
    PrizeId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Active BOOLEAN NOT NULL DEFAULT TRUE,
    CreatedDate DATETIME  DEFAULT CURDATE(),
    UpdatedDate DATETIME  DEFAULT CURDATE(),
    FOREIGN KEY (TicketId) REFERENCES Ticket(TicketId),
    FOREIGN KEY (PrizeId) REFERENCES Prize(PrizeId),
    FOREIGN KEY (CreatedBy) REFERENCES foranea1(CreatedBy),
    FOREIGN KEY (UpdatedBy) REFERENCES foranea2(UpdatedBy)
 );
    