-- Modify the type of column Name in table Shows
CREATE PROCEDURE up1
AS
  BEGIN
    ALTER TABLE Shows
    ALTER COLUMN Name VARCHAR(100) NOT NULL;
    print 'up1: Column Name from table Shows modified (VARCHAR 100 NOT NULL)';
  END

GO
CREATE PROCEDURE down1
AS
  BEGIN
    ALTER TABLE Shows
    ALTER COLUMN Name VARCHAR(50);
    print 'down1: Modification on column Name from table Shows reverted (VARCHAR 50 )';
  END


-- Add a default constraint on column Name in table Shows
GO
CREATE PROCEDURE up2
AS
  BEGIN
    ALTER TABLE Shows
    ADD CONSTRAINT df_Shows DEFAULT 'UnnamedShow' for NAME;
    print 'up2: Added default constraint on column Name in table Shows (Def value UnnamedShow)';
  END

GO
CREATE PROCEDURE down2
AS
  BEGIN
    ALTER TABLE Shows
    DROP CONSTRAINT df_Shows;
    print 'down2: Remove default constraint on column Name in table Shows (Def value UnnamedShow)';
  END


-- Create a new table (AiringStatus)
GO
CREATE PROCEDURE up3
AS
  BEGIN
    CREATE TABLE AiringStatus
    (AiringStatusId int PRIMARY KEY);
   print 'up3: Create table AiringStatus';
  END

GO
CREATE PROCEDURE down3
AS
  BEGIN
    DROP TABLE AiringStatus
    print 'down3: Drop table AiringStatus';
  END


-- Create a new table (ShowsAiringStatus)
GO
CREATE PROCEDURE up4
AS
  BEGIN
    CREATE TABLE ShowsAiringStatus
    (ShowsId int NOT NULL,
     AiringStatusId int NOT NULL
   );

    ALTER TABLE ShowsAiringStatus
    ADD CONSTRAINT pk_ShowsAiringStatus PRIMARY KEY (ShowsId, AiringStatusId);
    print 'up4: Create table ShowsAiringStatus & Add Constraint to set primary key tuple (ShowsId, AiringStatusId)';
  END

GO
CREATE PROCEDURE down4
AS
  BEGIN
    DROP TABLE ShowsAiringStatus;
    print 'down4: Drop table ShowsAiringStatus';
  END


-- Create COLUMN
GO
CREATE PROCEDURE up5
AS
  BEGIN
    ALTER TABLE AiringStatus
    ADD AiringStatusValue VARCHAR(50);
    print 'up5: Add column AiringStatusValue in table AiringStatus';
  END

GO
CREATE PROCEDURE down5
AS
  BEGIN
    ALTER TABLE AiringStatus
    DROP COLUMN AiringStatusValue;
    print 'down5: Drop column AiringStatusValue from table AiringStatus'
  END


-- Create foreign keys
GO
CREATE PROCEDURE up6
AS
  BEGIN
    ALTER TABLE ShowsAiringStatus
    ADD CONSTRAINT fk_ShowsAiring1 FOREIGN KEY (ShowsId) REFERENCES Shows(ShowsId);

    ALTER TABLE ShowsAiringStatus
    ADD CONSTRAINT fk_ShowsAiring2 FOREIGN KEY (AiringStatusId) REFERENCES AiringStatus(AiringStatusId);

    print 'up6: Add constraints on table ShowsAiringStatus';
  END

GO
CREATE PROCEDURE down6
AS
  BEGIN
    ALTER TABLE ShowsAiringStatus
    DROP CONSTRAINT fk_ShowsAiring1;

    ALTER TABLE ShowsAiringStatus
    DROP CONSTRAINT fk_ShowsAiring2;

    print 'down6: Remove constraints on table ShowsAiringStatus';
  END
