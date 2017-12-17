CREATE PROCEDURE CInsertShows
@ShowsName VARCHAR(100),
@ShowsDescription TEXT,
@GenreName VARCHAR(50)
AS
	BEGIN
	   -- Get number of rows from Actors table
	   DECLARE @TableName NVARCHAR(150)
	   DECLARE @NrRows INT

	   SET @TableName = 'Shows'
	   EXEC GetTableRows @Table = @TableName, @Nr = @NrRows OUT
	   SET @NrRows = @NrRows + 1

	   -- Validate data
	   DECLARE @IsShowsNameOk INT
	   SELECT @IsShowsNameOk = dbo.StartsWithBigLetter(@ShowsName)

	   DECLARE @IsGenre INT
	   SELECT @IsGenre = COUNT(*)
	   FROM Genres
	   WHERE Genres.gname = @GenreName


	   -- Insert data
	   IF( @IsShowsNameOk  = 1 AND @IsGenre != 0)
	   BEGIN
			DECLARE @GenreID INT

		    SELECT @GenreID =  Genres.GenresId
		    FROM Genres
		    WHERE Genres.gname = @GenreName

			INSERT INTO Shows(ShowsId, Name, Description, GenresId)
			VALUES (@NrRows, @ShowsName, @ShowsDescription, @GenreID)
	   END
	   ELSE
	   BEGIN
			PRINT 'Data is not properly formatted'
	   END

	END



CREATE PROCEDURE CUpdateShowsDescription
@ShowsId INT,
@ShowsNewDescription TEXT
AS
	BEGIN

	   UPDATE Shows
	   SET Shows.Description = @ShowsNewDescription
	   WHERE Shows.ShowsId = @ShowsId

	END


CREATE PROCEDURE CUpdateShowsGenre
@ShowsId INT,
@ShowsNewGenre VARCHAR(50)
AS
	BEGIN

	   -- Validate data
	   DECLARE @IsGenre INT
	   SELECT @IsGenre = COUNT(*)
	   FROM Genres
	   WHERE Genres.gname = @ShowsNewGenre

	   -- Update data
	   IF(@IsGenre != 0)
	   BEGIN
			DECLARE @GenreID INT

			SELECT @GenreID =  Genres.GenresId
		    FROM Genres
		    WHERE Genres.gname = @ShowsNewGenre

			UPDATE Shows
			SET Shows.GenresId = @GenreID
			WHERE Shows.ShowsId = @ShowsId
	   END


	END


CREATE PROCEDURE CDeleteShows
@ShowsId INT
AS
	BEGIN
	   -- Delete data
		DELETE
		FROM Shows
		WHERE Shows.ShowsId = @ShowsId
	END
