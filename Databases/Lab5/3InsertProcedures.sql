CREATE PROCEDURE Insert1
@NR INT
AS
	BEGIN
		DECLARE @CNR INT
		SET @CNR = 1

		DECLARE @OFFSET INT
		SET @OFFSET = 100

		WHILE @CNR <= @NR
		BEGIN
			INSERT INTO Stats(StatsId, viewers)
			VALUES (@CNR + @OFFSET,  @CNR + @OFFSET)

			INSERT INTO Shows(ShowsId, Name, Description, GenresId)
			VALUES (@CNR + @OFFSET,  'Show' + CONVERT(VARCHAR(5), @CNR), 'Descriereee', 1)

			SET @CNR = @CNR + 1
		END
	END

CREATE PROCEDURE Insert2
@NR INT
AS
	BEGIN
	DECLARE @CNR INT
	SET @CNR = 1

	DECLARE @OFFSET INT
	SET @OFFSET = 100

	WHILE @CNR <= @NR
		BEGIN
			INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
			VALUES (@CNR + @OFFSET,  'Episode' + CONVERT(VARCHAR(5), @CNR), 'Description', 5, 5, 1)

			SET @CNR = @CNR + 1
		END
	END

CREATE PROCEDURE Insert3
@NR INT
AS
	BEGIN
		DECLARE @CNR INT
		SET @CNR = 1

		DECLARE @OFFSET INT
		SET @OFFSET = 100

		WHILE @CNR <= @NR
		BEGIN
			-- Insert Shows
			INSERT INTO Stats(StatsId, viewers)
			VALUES (@CNR + @OFFSET,  @CNR + @OFFSET)

			INSERT INTO Shows(ShowsId, Name, Description, GenresId)
			VALUES (@CNR + @OFFSET,  'Show' + CONVERT(VARCHAR(5), @CNR), 'Descriereee', 1)

			-- Insert Actors
			INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
			VALUES (@CNR + @OFFSET,  'Actor' + CONVERT(VARCHAR(5), @CNR), 'Dean Winchester', 'USA', 'male')

			-- Insert Into ShowsActors
			INSERT INTO ShowsActors(ShowsId, ActorsID)
			VALUES (@CNR + @OFFSET, @CNR + @OFFSET)

			SET @CNR = @CNR + 1
		END
	END
