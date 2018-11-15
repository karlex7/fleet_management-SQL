--TABLICE
create database PPPK_projekt
go

use PPPK_projekt
GO

CREATE TABLE Vozac(
	ID int NOT NULL PRIMARY KEY,
	Ime nvarchar(25) NOT NULL,
	Prezime nvarchar(25) NOT NULL,
	BrojMobitela nvarchar(25) NOT NULL,
	BrojVozacke nvarchar(25) NOT NULL
)
go

CREATE TABLE TipVozila(
	ID int NOT NULL PRIMARY KEY,
	Tip nvarchar(25)
)
go

CREATE TABLE MarkaVozila(
	ID int NOT NULL PRIMARY KEY,
	Marka nvarchar(25)
)

CREATE TABLE Vozilo(
	ID int NOT NULL PRIMARY KEY,
	TipID int,
	FOREIGN KEY(TipID) REFERENCES TipVozila(ID),
	MarkaID int,
	FOREIGN KEY(MarkaID) REFERENCES MarkaVozila(ID),
	GodinaPorizvodnje int,
	PocetniKilometri float
)
go

CREATE TABLE DodajelaVozilaVozacu(
	ID int NOT NULL PRIMARY KEY,
	VozacID int,
	FOREIGN KEY(VozacID) REFERENCES Vozac(ID),
	VoziloID int,
	FOREIGN KEY(VoziloID) REFERENCES Vozilo(ID)
)

CREATE TABLE TroskoviGoriva(
	ID int NOT NULL PRIMARY KEY,
	VozacID int,
	FOREIGN KEY(VozacID) REFERENCES Vozac(ID),
	DatumTroska date,
	MjestoKupovine nvarchar(50),
	KolicinaGoriva float,
	Cijena money
)
go

CREATE TABLE PracenjePrijedeneRute(
	ID int NOT NULL PRIMARY KEY,
	Vrijeme time,
	KoordinataA nvarchar(25),
	KoordinataB nvarchar(25),
	PrijedeniKilometri float,
	ProsjecnaBrzina float,
	PotrosenoGorivo float
)
go

CREATE TABLE PutniNalog(
	ID int NOT NULL PRIMARY KEY,
	VozacID int,
	FOREIGN KEY(VozacID) REFERENCES Vozac(ID),
	DatumPocetka date,
	DatumZavrsetka date,
	PrijedeniKilometri float,
	PracenjePrijedeneRuteID int,
	FOREIGN KEY(PracenjePrijedeneRuteID) REFERENCES PracenjePrijedeneRute(ID)
)
go

CREATE TABLE ServisniTroskovi(
	ID int NOT NULL PRIMARY KEY,
	VoziloID int,
	FOREIGN KEY(VoziloID) REFERENCES Vozilo(ID),
	Trosak money
)