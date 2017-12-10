CREATE PROCEDURE Delete1
@NR INT
AS
	BEGIN
		DECLARE @CNR INT
		SET @CNR = 1

		DECLARE @OFFSET INT
		SET @OFFSET = 100

		WHILE @CNR <= @NR
		BEGIN
      DELETE FROM Shows
      WHERE Shows.ShowsID = @CNR + @OFFSET

      DELETE FROM Stats
      WHERE Stats.StatsId = @CNR + @OFFSET

			SET @CNR = @CNR + 1
		END
	END


CREATE PROCEDURE Delete2
	@NR INT
	AS
		BEGIN
			DECLARE @CNR INT
			SET @CNR = 1

			DECLARE @OFFSET INT
			SET @OFFSET = 100

			WHILE @CNR <= @NR
			BEGIN
	      DELETE FROM Episodes
	      WHERE Episodes.EpisodesId = @CNR + @OFFSET

				SET @CNR = @CNR + 1
			END
		END

CREATE PROCEDURE Delete3
		@NR INT
		AS
			BEGIN
				DECLARE @CNR INT
				SET @CNR = 1

				DECLARE @OFFSET INT
				SET @OFFSET = 100

				WHILE @CNR <= @NR
				BEGIN

				-- Delete ShowsActors
				DELETE FROM ShowsActors
				WHERE ShowsActors.ShowsId = @CNR + @OFFSET AND ShowsActors.ActorsID =  @CNR + @OFFSET

			  -- Delete Shows
		    DELETE FROM Shows
		    WHERE Shows.ShowsID = @CNR + @OFFSET

		    DELETE FROM Stats
		    WHERE Stats.StatsId = @CNR + @OFFSET

			  -- Delete Actors
		    DELETE FROM Actors
		    WHERE Actors.ActorsId = @CNR + @OFFSET


			  SET @CNR = @CNR + 1
			END
		END
