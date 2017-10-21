#Show all Shows that have rating above 8
SELECT Shows.ShowsId, Ratings.value
FROM Shows
INNER JOIN Ratings
	   ON Shows.ShowsId = Ratings.RatingId
WHERE Ratings.value >= 8         

#Show how many shows have a certain rating
SELECT Ratings.value as rating, COUNT(Ratings.value) as count
FROM Shows
INNER JOIN Ratings
	   ON Shows.ShowsId = Ratings.RatingId
WHERE Ratings.value >= 8
GROUP BY Ratings.value
ORDER BY Ratings.value DESC   

#How many shows have actors that are from USA
SELECT Shows.Name, Actors.name, Actors.country
FROM Shows
INNER JOIN ShowsActors
		ON ShowsActors.ShowsId = Shows.ShowsId
INNER JOIN Actors
		ON Actors.ActorsId = ShowsActors.ActorsId
WHERE Actors.country ='USA'

#Tv Shows that have directors who directed more than 20 ep and the tv shows
#have rating 10
SELECT Shows.Name, Ratings.value as TvShowRating, Directors.name as DirectorName, Directors.episodesDirected
FROM Shows
INNER JOIN DirectorsShows
		ON DirectorsShows.ShowsId = Shows.ShowsId
INNER JOIN Directors
		ON DirectorsShows.DirectorsId = Directors.DirectorsId
INNER JOIN Ratings
		ON Ratings.ShowsId = Shows.ShowsId
WHERE Directors.episodesDirected >= 20 AND Ratings.value = 10

#How many TV shows have directors that directed more than 20 episodes and 
#the TV show has rating 10
SELECT COUNT(DISTINCT(Shows.Name)) as NrOfShows
FROM Shows
INNER JOIN DirectorsShows
		ON DirectorsShows.ShowsId = Shows.ShowsId
INNER JOIN Directors
		ON DirectorsShows.DirectorsId = Directors.DirectorsId
INNER JOIN Ratings
		ON Ratings.ShowsId = Shows.ShowsId
WHERE Directors.episodesDirected >= 20 AND Ratings.value = 10

#Find actors that can be nominated to EMMY (horror category)
#An actor can be nominated to an EMMY if:
#	was chosen by a Director who directed more than 20 episodes in tv shows with rating >= 9
#   played on more than 40 episodes in tv shows with rating = 10,
#													 category = Horror
#													  views >= 1.000.000

#Find actors that can be nominated to EMMY

SELECT *
FROM Shows
INNER JOIN ShowsActors
	    ON  Shows.ShowsId = ShowsActors.ShowsId
INNER JOIN Actors
		ON Actors.ActorsId = ShowsActors.ActorsID
INNER JOIN DirectorsShows
		ON Shows.ShowsId = DirectorsShows.ShowsId
INNER JOIN Directors
		ON Directors.DirectorsId = DirectorsShows.DirectorsId
INNER JOIN Ratings
		ON Ratings.ShowsId = Shows.ShowsId
WHERE Ratings.value = 10,
	  Genre IN (SELECT Genres.gname
				FROM Genres
				WHERE Genres.GenresId = Shows.GenresId
				) like 'Horror'
