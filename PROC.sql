--PROCEDURE
use PPPK_projekt
GO

----------VOZAC----------

CREATE PROC INSERT_VOZAC
	@ID int,
	@Ime nvarchar(25),
	@Prezime nvarchar(25),
	@BrojMobitela nvarchar(25),
	@BrojVozacke nvarchar(25)
AS
INSERT INTO Vozac (ID, Ime, Prezime, BrojMobitela,BrojVozacke)
VALUES (@ID, @Ime, @Prezime, @BrojMobitela, @BrojVozacke)
GO

CREATE PROC UPDATE_VOZAC
	@ID int,
	@Ime nvarchar(25),
	@Prezime nvarchar(25),
	@BrojMobitela nvarchar(25),
	@BrojVozacke nvarchar(25)
AS
UPDATE Vozac
SET Ime = @Ime, Prezime = @Prezime, BrojMobitela=@BrojMobitela, BrojVozacke=@BrojVozacke
WHERE ID=@ID;
GO

CREATE PROC VEIW_VOZAC
	@ID int
AS
select Ime,Prezime,BrojMobitela,BrojVozacke from Vozac WHERE ID=@ID;
GO

--Za delete prvo se briseju PUTNI NALOZI, DODJELA VOZILA VOZACU, pa vozaci
CREATE PROC DELETE_VOZAC
	@ID int
AS
select Ime,Prezime,BrojMobitela,BrojVozacke from Vozac WHERE ID=@ID
GO

----------PUTNI NALOG----------

CREATE PROC INSERT_PUTNI_NALOG
	@ID int,
	@VozacID int,
	@DatumPocetka date,
	@DatumZavrsetka date,
	@PrijedeniKilometri float,
	@PracenjePrijedeneRuteID int
AS
INSERT INTO PutniNalog(ID, VozacID, DatumPocetka, DatumZavrsetka,PrijedeniKilometri,PracenjePrijedeneRuteID)
VALUES (@ID, @VozacID, @DatumPocetka, @DatumZavrsetka, @PrijedeniKilometri, @PracenjePrijedeneRuteID)
GO

CREATE PROC UPDATE_PUTNI_NALOG
	@ID int,
	@VozacID int,
	@DatumPocetka date,
	@DatumZavrsetka date,
	@PrijedeniKilometri float,
	@PracenjePrijedeneRuteID int
AS
UPDATE PutniNalog
SET VozacID=@VozacID, DatumPocetka=@DatumPocetka, DatumZavrsetka=@DatumZavrsetka, PrijedeniKilometri=@PrijedeniKilometri, PracenjePrijedeneRuteID=@PracenjePrijedeneRuteID
WHERE ID=@ID;
GO

CREATE PROC VEIW_PUTNI_NALOG
	@ID int
AS
select Vozac.Ime, Vozac.Prezime, DatumPocetka, DatumZavrsetka, PrijedeniKilometri, PracenjePrijedeneRuteID from PutniNalog 
inner join Vozac on PutniNalog.VozacID=Vozac.ID
where PutniNalog.ID=@ID
GO


----------VOZILO---------
CREATE PROC INSERT_VOZILO
	@ID int,
	@TipID int,
	@MarkaID int,
	@GodinaProizvodnje int,
	@PocetniKilometri float
AS
INSERT INTO Vozilo(ID, TipID, MarkaID, GodinaPorizvodnje,PocetniKilometri)
VALUES (@ID, @TipID, @MarkaID, @GodinaProizvodnje, @PocetniKilometri)
GO