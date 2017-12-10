CREATE PROCEDURE GetVersion
@Res INT OUT
AS
  BEGIN
  	SELECT TOP 1 @Res = VersNr
  	FROM Vers;

  	print 'Get Version called';
  END
