CREATE PROCEDURE CInsertGenres
@GenreName VARCHAR(50)
AS
	BEGIN
	   -- Get number of rows from Actors table
	   DECLARE @TableName NVARCHAR(150)
	   DECLARE @NrRows INT

	   SET @TableName = 'Genres'
	   EXEC GetTableRows @Table = @TableName, @Nr = @NrRows OUT
	   SET @NrRows = @NrRows + 1

	   -- Validate data
	   DECLARE @IsGenreNameOk INT
	   SELECT @IsGenreNameOk = dbo.StartsWithBigLetter(@GenreName)

	   -- Insert data
	   IF( @IsGenreNameOk = 1)
	   BEGIN
			INSERT INTO Genres(GenresId, gname)
			VALUES (@NrRows, @GenreName)
	   END
	   ELSE
	   BEGIN
			PRINT 'Data is not properly formatted'
	   END

	END


CREATE PROCEDURE CUpdateGenres
@GenreId INT,
@NewGenreName TEXT
AS
	BEGIN

	   UPDATE Genres
	   SET Genres.gname = @NewGenreName
	   WHERE Genres.GenresId = @GenreId
	END


  CREATE PROCEDURE CDeleteGenres
  @GenreId INT
  AS
  	BEGIN

  	   DELETE
  	   FROM Genres
  	   WHERE Genres.GenresId = @GenreId
  	END
