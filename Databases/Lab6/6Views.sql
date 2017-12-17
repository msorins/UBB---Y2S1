CREATE VIEW ViewActorCountries AS
SELECT Actors.country
FROM Shows
INNER JOIN ShowsActors
	ON ShowsActors.ShowsId = Shows.ShowsId
INNER JOIN Actors
	ON Actors.ActorsId = ShowsActors.ActorsID
GROUP BY Actors.country


CREATE VIEW ViewShowsRatings AS
SELECT Shows.Name,
	(
	SELECT AVG(Ratings.value)
	FROM Ratings
	WHERE Ratings.ShowsId = Shows.ShowsId
	) as Rating
FROM Shows
