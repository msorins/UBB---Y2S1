CREATE PROCEDURE CInsertRatings
@Value INT,
@ShowsId INT
AS
	BEGIN
	   -- Get number of rows from Actors table
	   DECLARE @TableName NVARCHAR(150)
	   DECLARE @NrRows INT

	   SET @TableName = 'Ratings'
	   EXEC GetTableRows @Table = @TableName, @Nr = @NrRows OUT
	   SET @NrRows = @NrRows + 1

	   -- Validate data
       DECLARE @IsShow INT
       SELECT @IsShow = COUNT(*)
       FROM Shows
       WHERE Shows.ShowsId = @ShowsId

	   -- Insert data
	   IF( @IsShow != 0)
	   BEGIN
		 	 INSERT INTO Ratings(RatingId, value, ShowsId)
			 VALUES (@NrRows, @Value, @ShowsId)
	   END
	   ELSE
	   BEGIN
			PRINT 'No show found with the given id'
	   END

	END



CREATE PROCEDURE CUpdateRatings
@RatingId INT,
@NewValue INT
AS
	BEGIN

	   UPDATE Ratings
	   SET Ratings.value = @NewValue
	   WHERE Ratings.RatingId = @RatingId
	END


CREATE PROCEDURE CDeleteRatings
@RatingId INT
AS
  BEGIN
  	  DELETE
  	  FROM Ratings
  	  WHERE Ratings.RatingId = @RatingId
  END
