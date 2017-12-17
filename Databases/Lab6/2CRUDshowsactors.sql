CREATE PROCEDURE CInsertShowsActors
@ShowsId INT,
@ActorsId INT
AS
	BEGIN
	   -- Check if indexes are valid
	    DECLARE @NrS INT
		DECLARE @NrA INT

	    SELECT @NrS = COUNT(*)
		FROM Shows
		WHERE Shows.ShowsId	= @ShowsId

		SELECT @NrA = COUNT(*)
		FROM Actors
		WHERE Actors.ActorsId = @ActorsId

		IF( @NrS != 0 AND @NrA != 0 )
		BEGIN
			INSERT INTO ShowsActors(ShowsId, ActorsID)
			VALUES(@ShowsId, @ActorsId)
		END
		ELSE
		BEGIN
			PRINT 'Wrong Indexes'
		END

	END


CREATE PROCEDURE CDeleteShowsActors
@ShowsId INT,
@ActorsId INT
AS
	BEGIN
	   -- Check if indexes are valid
	    DECLARE @NrS INT
		DECLARE @NrA INT

	    SELECT @NrS = COUNT(*)
		FROM Shows
		WHERE Shows.ShowsId	= @ShowsId

		SELECT @NrA = COUNT(*)
		FROM Actors
		WHERE Actors.ActorsId = @ActorsId

		IF( @NrS != 0 AND @NrA != 0 )
		BEGIN
			DELETE
			FROM ShowsActors
			WHERE ShowsActors.ActorsID = ShowsActors.ShowsId
		END
		ELSE
		BEGIN
			PRINT 'Wrong Indexes'
		END

	END
