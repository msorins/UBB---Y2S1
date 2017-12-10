CREATE VIEW View1 AS
SELECT Name, Description
FROM Shows

CREATE VIEW View2 AS
SELECT Shows.Name as ShowName, Episodes.Name as EpisodeName, Shows.Description as ShowDescription, Episodes.Description as EpisodeDescription
FROM Shows
INNER JOIN Episodes
	ON Episodes.ShowsId = Shows.ShowsId

CREATE VIEW View3 AS
SELECT Actors.country
FROM Shows
INNER JOIN ShowsActors
	ON ShowsActors.ShowsId = Shows.ShowsId
INNER JOIN Actors
	ON Actors.ActorsId = ShowsActors.ActorsID
GROUP BY Actors.country
