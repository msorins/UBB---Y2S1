ALTER PROCEDURE RunAllTests
AS
  BEGIN
	-- Delete already existing test data
	EXEC DeleteAllData

	-- Declare stuff
	DECLARE @TestName as NVARCHAR(50)
    DECLARE @Cursor as CURSOR

	SET @cursor = CURSOR FOR
		SELECT Tests.Name
		FROM Tests

	OPEN @Cursor

	-- Run all the computations
	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM @Cursor INTO @TestName
		print 'Running: ' + @TestName
		EXEC RunTest @TestName
	END
END
