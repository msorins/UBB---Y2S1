ALTER PROCEDURE GetTableRows
@Table NVARCHAR(150),
@Nr INT OUT
AS
  BEGIN
	DECLARE @Query NVARCHAR(100)
	DECLARE @Params NVARCHAR(10)

	SET @QUERY = 'SELECT @Nr = COUNT(*) FROM ' + @Table

	EXEC sys.sp_executesql @QUERY, N'@Nr INT OUTPUT', @Nr OUT
  END


CREATE FUNCTION CheckGenre(@Genre VARCHAR(10))
RETURNS INT
AS
BEGIN
	if(@Genre = 'male' OR  @GENRE = 'female')
	BEGIN
		RETURN 1
	END
	RETURN 0
END

CREATE FUNCTION StartsWithBigLetter(@String VARCHAR(1000))
RETURNS INT
AS
BEGIN
	DECLARE @FirstLetter VARCHAR(1)
	SET @FirstLetter = SUBSTRING(@String, 1, 1)

	IF ( @FirstLetter = UPPER(@FirstLetter) Collate Latin1_General_CS_AI )
	BEGIN
		RETURN 1
	END

	RETURN 0
END
