ALTER PROCEDURE RunTest
@TestName NVARCHAR(50)
AS
	BEGIN
	  -- GET ALL NEEDED TEST INFORMATION
		DECLARE @TIO INT
		DECLARE @VIO INT
		DECLARE @NRO INT
		EXEC GetTestInfo @TestNameIn = @TestName, @TableIdOut = @TIO OUTPUT, @ViewIdOut = @VIO OUTPUT, @NoOfRowsOut = @NRO OUTPUT

		-- DECLARE ALL TIME VARIABLES
		DECLARE @TestStart DATETIME
		DECLARE @TestEnd DATETIME
		DECLARE @TestViewStart DATETIME
		DECLARE @TestViewEnd DATETIME
		DECLARE @TestCRUDStart DATETIME
		DECLARE @TestCRUDEnd DATETIME

		SET @TestStart = SYSDATETIME()

		-- Do the execution for all three cases separately
		IF @TIO = 1
		BEGIN
			EXEC Insert1 @NRO

			SET @TestViewStart = SYSDATETIME()
			SELECT *
			FROM
			View1
			SET @TestViewEnd = SYSDATETIME()

			EXEC Delete1 @NRO
		END

		IF @TIO = 2
		BEGIN
			EXEC Insert2 @NRO

			SET @TestViewStart = SYSDATETIME()
			SELECT *
			FROM
			View2
			SET @TestViewEnd = SYSDATETIME()

			EXEC Delete2 @NRO
		END

		IF @TIO = 3
		BEGIN
			EXEC Insert3 @NRO

			SET @TestViewStart = SYSDATETIME()
			SELECT *
			FROM
			View3
			SET @TestViewEnd = SYSDATETIME()

			EXEC Delete3 @NRO
		END


		SET @TestEnd = SYSDATETIME()

		SET @TestCRUDStart = @TestStart
		SET @TestCRUDEnd = DATEADD(ms, - DATEDIFF(MILLISECOND, @TestViewStart, @TestViewEnd), @TestEnd)


		-- Insert all the measured data into Tables
		DECLARE @CrtIndex int
		EXEC GetTestRunsRows @CrtIndex OUT
		SET @CrtIndex = @CrtIndex + 1

		SET IDENTITY_INSERT TestRuns ON
		INSERT INTO TestRuns(TestRunID, Description, StartAt, EndAt)
		VALUES (@CrtIndex, 'Test: ' + @TestName, @TestStart, @TestEnd)

		INSERT INTO TestRunTables(TestRunID, TableID, StartAt, EndAt)
		VALUES (@CrtIndex, @TIO, @TestCRUDStart, @TestCRUDEnd)

		INSERT INTO TestRunViews(TestRunID, ViewID, StartAt, EndAt)
		VALUES (@CrtIndex, @VIO, @TestViewStart, @TestViewEnd)


		PRINT (CONVERT( VARCHAR(24), @TestStart, 121))
		PRINT (CONVERT( VARCHAR(24), @TestEnd, 121))

		PRINT (CONVERT( VARCHAR(24), @TestViewStart, 121))
		PRINT (CONVERT( VARCHAR(24), @TestViewEnd, 121))

		PRINT (CONVERT( VARCHAR(24), @TestCRUDStart, 121))
		PRINT (CONVERT( VARCHAR(24), @TestCRUDEnd, 121))

	END
