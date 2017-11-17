CREATE PROCEDURE ExecuteVersion
@ProcName VARCHAR(50),
@ProcNr int
AS
  BEGIN
    DECLARE @ToExec VARCHAR(100);
	SET @ToExec = @ProcName + CONVERT(VARCHAR(5), @ProcNr) ;
	EXECUTE @ToExec;
  END