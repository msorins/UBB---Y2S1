(CREATE PROCEDURE CInsertActor
@ActorName VARCHAR(50),
@ActorTvCharacter VARCHAR(50),
@ActorCountry NVARCHAR(50),
@ActorGenre VARCHAR(10)
AS
	BEGIN
	   -- Get number of rows from Actors table
	   DECLARE @TableName NVARCHAR(150)
	   DECLARE @NrRows INT

	   SET @TableName = 'Actors'
	   EXEC GetTableRows @Table = @TableName, @Nr = @NrRows OUT
	   SET @NrRows = @NrRows + 1

	   -- Validate data
	   DECLARE @IsGenreOk INT
	   SELECT @IsGenreOk = dbo.CheckGenre(@ActorGenre)

	   DECLARE @IsFirstLetterNameOk INT
	   SELECT @IsFirstLetterNameOk = dbo.StartsWithBigLetter(@ActorName)

	   DECLARE @IsFirstLetterTvCharacterOk INT
	   SELECT @IsFirstLetterTvCharacterOk = dbo.StartsWithBigLetter(@ActorTvCharacter)


	   -- Insert data
	   IF( @IsGenreOk = 1 AND @IsFirstLetterNameOk = 1 AND @IsFirstLetterTvCharacterOk = 1)
	   BEGIN
			INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
			VALUES (@NrRows, @ActorName, @ActorTvCharacter, @ActorCountry, @ActorGenre)
	   END
	   ELSE
	   BEGIN
			PRINT 'Data is not properly formatted'
	   END

	END

)



CREATE PROCEDURE CUpdateActorTvCharacterOne
@ActorsId INT,
@ActorNewTvCharacter VARCHAR(50)
AS
	BEGIN
	   -- Validate data
	   DECLARE @IsFirstLetterTvCharacterOk INT
	   SELECT @IsFirstLetterTvCharacterOk = dbo.StartsWithBigLetter(@ActorNewTvCharacter)


	   -- Insert data
	   IF( @IsFirstLetterTvCharacterOk = 1)
	   BEGIN
			UPDATE Actors
			SET Actors.tvCharacter = @ActorNewTvCharacter
			WHERE Actors.ActorsId = @ActorsId
	   END
	   ELSE
	   BEGIN
			PRINT 'Data is not properly formatted'
	   END

	END


CREATE PROCEDURE CDeleteActor
@ActorsId INT
AS
	BEGIN
	   -- Delete data
		DELETE
		FROM Actors
		WHERE Actors.ActorsId = @ActorsId
	END
