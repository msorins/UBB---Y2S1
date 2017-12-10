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
	   ON Shows.ShowsId = Ratings.Rating
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
#	was chosen by a Director who directed more than 20 episodes in tv shows
#   that has: rating >= 9
#    		  category = Horror
#			  views >= 1.000.000
#

SELECT Distinct(Actors.name)
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
INNER JOIN Genres
		ON Genres.GenresId = Shows.GenresId
INNER JOIN Stats
		ON Stats.StatsId = Shows.ShowsId
WHERE  Directors.episodesDirected >= 20 and Ratings.value >= 9 and Stats.viewers >= 1000000
	   AND
	   Genres.gname like 'Horror'


#Show how many episodes does every tv show has in 1st season
SELECT Shows.Name,
	   (SELECT COUNT(*) EPS
		FROM Episodes
		WHERE Episodes.ShowsId = Shows.ShowsId
		GROUP BY Episodes.Season
		HAVING Episodes.Season = 1
		) AS EpsInS01
FROM Shows


#Show how many USA actors have played in Supernatural
SELECT COUNT(Actors.name) as ActorsWithGivenReq
FROM Shows
INNER JOIN ShowsActors
		ON ShowsActors.ShowsId = Shows.ShowsId
INNER JOIN Actors
	    ON Actors.ActorsId = ShowsActors.ActorsID
Where Shows.Name LIKE 'Supernatural'
GROUP BY Actors.country
HAVING Actors.country='USA'

#On how many channels is Supernatural aired
SELECT (
	Select COUNT(TvChannels.ShowsId)
	FROM TvChannels
	WHERE TvChannels.ShowsId = Shows.ShowsId
	) as NrChannels
FROM Shows
Where Shows.Name like 'Supernatural'

#How many views have in total all tv shows that are aired on HBO
SELECT TOP 1 SUM(Stats.viewers) OVER () as viewers
FROM TvChannels
JOIN Shows
  ON Shows.ShowsId = TvChannels.ShowsId
JOIN Stats
  ON Stats.StatsId = Shows.ShowsId
WHERE TvChannels.name='HBO'
GROUP BY Stats.viewers


SELECT SUM(Stats.viewers) as viewers
FROM TvChannels
JOIN Shows
  ON Shows.ShowsId = TvChannels.ShowsId
JOIN Stats
  ON Stats.StatsId = Shows.ShowsId
WHERE TvChannels.name='HBO'
