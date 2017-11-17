CREATE PROCEDURE ChangeVersion
@NewVersion INT
AS
  BEGIN
    Declare @CrtVersion INT
    EXEC GetVersion @res = @CrtVersion OUTPUT
	
	IF @CrtVersion < @NewVersion
		BEGIN
			WHILE @CrtVersion < @NewVersion
			BEGIN
				SET @CrtVersion = @CrtVersion + 1
				EXEC ExecuteVersion 'up', @CrtVersion;
				EXEC SetVersion @CrtVersion
			END
		END
	ELSE
		BEGIN
			WHILE @CrtVersion > @NewVersion
			BEGIN
				EXEC ExecuteVersion 'down', @CrtVersion;
				EXEC SetVersion @CrtVersion
				SET @CrtVersion = @CrtVersion - 1
			END
			EXEC SetVersion @CrtVersion
		END		
  END