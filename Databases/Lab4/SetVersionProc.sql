CREATE PROCEDURE SetVersion
@Val INT
AS
  BEGIN
    UPDATE Vers
	SET VersNr = @Val;

	print 'SetVersion( '+ CONVERT(VARCHAR(5), @Val) +' ) called';
  END