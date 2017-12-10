CREATE PROCEDURE DeleteAllData
AS
  BEGIN
    DELETE FROM TestRunTables;
    DELETE FROM TestRuns;
    DELETE FROM TestRunViews;
  END
