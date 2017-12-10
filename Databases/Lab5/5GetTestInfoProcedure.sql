CREATE PROCEDURE GetTestInfo
@TestNameIn NVARCHAR(50),
@TableIdOut INT OUT,
@ViewIdOut INT OUT,
@NoOfRowsOut INT OUT
AS
  BEGIN
    SELECT TOP 1 @TableIdOut = Tables.TableID, @ViewiDOut = Views.ViewID, @NoOfRowsOut = TestTables.NoOfRows
    FROM Tests
    INNER JOIN TestTables
    	ON TestTables.TestID = Tests.TestID
    INNER JOIN Tables
    	ON Tables.TableID = TestTables.TableID
    INNER JOIN TestViews
    	ON TestViews.TestID = Tests.TestID
    INNER JOIN Views
    	ON Views.ViewID = TestViews.ViewID
    WHERE Tests.Name = @TestNameIn
  END
