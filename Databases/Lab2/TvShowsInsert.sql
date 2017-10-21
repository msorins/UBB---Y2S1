USE TvShows
INSERT INTO Genres(GenresId, gname)
VALUES(1, 'Horror')

INSERT INTO Genres(GenresId, gname)
VALUES(2, 'Action')

INSERT INTO Genres(GenresId, gname)
VALUES(3, 'Adventure')

INSERT INTO Genres(GenresId, gname)
VALUES(4, 'Comedy')

INSERT INTO Genres(GenresId, gname)
VALUES(5, 'Documentary')

INSERT INTO Genres(GenresId, gname)
VALUES(6, 'Drama')

INSERT INTO Genres(GenresId, gname)
VALUES(7, 'Drama')

INSERT INTO Genres(GenresId, gname)
VALUES(8, 'Animation')


INSERT INTO Shows(ShowsID, Name, Description, GenresId)
VALUES(1,
       'Supernatural', 
	   'Two brothers follow their fathers footsteps as "hunters" fighting evil supernatural beings of many kinds including monsters, demons, and gods that roam the earth.',
	   1)

INSERT INTO Shows(ShowsID, Name, Description, GenresId)
VALUES(2,
       'The Blacklist', 
	   'A new FBI profiler, Elizabeth Keen, has her entire life uprooted when a mysterious criminal, Raymond Reddington, who has eluded capture for decades, turns himself in and insists on speaking only to her.',
	   2)


INSERT INTO Shows(ShowsID, Name, Description, GenresId)
VALUES(3,
       'Family guy', 
	   'In a wacky Rhode Island town, a dysfunctional family strive to cope with everyday life as they are thrown from one crazy scenario to another.',
	   4)


INSERT INTO Shows(ShowsID, Name, Description, GenresId)
VALUES(4,
       'Modern Family', 
	   'Three different, but related families face trials and tribulations in their own uniquely comedic ways.',
	   4)

INSERT INTO Shows(ShowsID, Name, Description, GenresId)
VALUES(5,
       'Rick and Morty', 
	   'An animated series that follows the exploits of a super scientist and his not-so-bright grandson.',
	   8)

INSERT INTO Shows(ShowsID, Name, Description, GenresId)
VALUES(6,
       'Lucifer', 
	   'Lucifer Morningstar has decided hes had enough of being the dutiful servant in Hell and decides to spend some time on Earth to better understand humanity. He settles in Los Angeles - the City of Angels.',
	   3)

INSERT INTO Shows(ShowsID, Name, Description, GenresId)
VALUES(7,
       'Chicago Fire', 
	   'The story of firefighters in Chicago, both on a personal and professional level.',
	   6)

INSERT INTO TvChannels(TvChannelIsd, name, country, ShowsId)
VALUES(1,
	   'HBO',
	   'Romania',
	   1)

INSERT INTO TvChannels(TvChannelIsd, name, country, ShowsId)
VALUES(2,
	   'Hulu',
	   'USA',
	   1)

INSERT INTO TvChannels(TvChannelIsd, name, country, ShowsId)
VALUES(3,
	   'Netflix',
	   'EU',
	   2)
	   
INSERT INTO TvChannels(TvChannelIsd, name, country, ShowsId)
VALUES(4,
	   'Netflix',
	   'USA',
	   3)

INSERT INTO TvChannels(TvChannelIsd, name, country, ShowsId)
VALUES(5,
	   'HBO',
	   'EU',
	   3)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(1,
	   'Pilot',
	   'First episode',
	   1,
	   1,
	   1)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(2,
	   'Wendigo',
	   'Second episode',
	   1,
	   2,
	   1)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(3,
	   'Dead in the water',
	   'Third episode',
	   1,
	   3,
	   1)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(4,
	   'Phantom Traveler',
	   '4th episode',
	   1,
	   4,
	   1)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(5,
	   'Bloody Mary',
	   '5tg episode',
	   1,
	   5,
	   1)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(6,
	   'Phantom Traveler',
	   '4th episode',
	   1,
	   4,
	   1)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(7,
	   'The troll farmer',
	   '1st episode of 3rd season',
	   3,
	   1,
	   2)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(8,
	   'Esteban',
	   '1st episode of 4th seasons',
	   4,
	   1,
	   2)

INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(9,
	   'Pilot',
	   '1st episode of 1st season',
	   1,
	   1,
	   1)


INSERT INTO Episodes(EpisodesId, Name, Description, Season, Episode, ShowsId)
VALUES(10,
	   'Lord baltimore',
	   '1st episode of 2nd season',
	   2,
	   1,
	   1)

INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
Values(1,
	   'Jared Padalecki',
	   'Sam Winchester',
	   'USA',
	   'male'
)	



INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
Values(2,
	   'Jensen Ackles',
	   'Dean Winchester',
	   'USA',
	   'male'
)

INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
Values(3,
	   'Misha Collins',
	   'Castiel',
	   'USA',
	   'male'
)

INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
Values(4,
	   'Mark Sheppard',
	   'Crowley',
	   'USA',
	   'male'
)

INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
Values(5,
	   'Samantha Smith',
	   'Mary Winchester',
	   'Polonia',
	   'female'
)		

INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
Values(6,
	   'Megan Boone',
	   'Elizabeth Keen',
	   'Polonia',
	   'female'
)		

INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
Values(7,
	   'James Spader',
	   'Raymond Red Reddington',
	   'USA',
	   'male'
)		

INSERT INTO Actors(ActorsId, name, tvCharacter, country, genre)
Values(8,
	   'Diego Klattenhoff',
	   'Donald Ressler',
	   'Jamaica',
	   'male'
)	

INSERT INTO ShowsActors(ShowsId, ActorsId)
VALUES(1,
	   1)
	
INSERT INTO ShowsActors(ShowsId, ActorsId)
VALUES(1,
	   2)

INSERT INTO ShowsActors(ShowsId, ActorsId)
VALUES(1,
	   3)

INSERT INTO ShowsActors(ShowsId, ActorsId)
VALUES(1,
	   4)

INSERT INTO ShowsActors(ShowsId, ActorsId)
VALUES(1,
	   5)

INSERT INTO ShowsActors(ShowsId, ActorsId)
VALUES(2,
	   6)

INSERT INTO ShowsActors(ShowsId, ActorsId)
VALUES(2,
	   7)

INSERT INTO ShowsActors(ShowsId, ActorsId)
VALUES(2,
	   8)	   	   	   	   	


INSERT INTO Ratings(RatingId, value, ShowsId)
VALUES(1,
	   10,
	   1)

INSERT INTO Ratings(RatingId, value, ShowsId)
VALUES(2,
	   10,
	   2)

INSERT INTO Ratings(RatingId, value, ShowsId)
VALUES(6,
	   9,
	   2)

INSERT INTO Ratings(RatingId, value, ShowsId)
VALUES(3,
	   7,
	   3)

INSERT INTO Ratings(RatingId, value, ShowsId)
VALUES(4,
	   8,
	   4)


INSERT INTO Ratings(RatingId, value, ShowsId)
VALUES(5,
	   6,
	   6)

INSERT INTO Directors(DirectorsId, name, episodesDirected)
Values(1,
	   'Michael W. Watkins',
	   22
	   )

INSERT INTO Directors(DirectorsId, name, episodesDirected)
Values(2,
	   'Andrew McCarthy',
	   8
	   )

INSERT INTO Directors(DirectorsId, name, episodesDirected)
Values(3,
	   'Donald E. Thorin Jr',
	   7
	   )

INSERT INTO Directors(DirectorsId, name, episodesDirected)
Values(4,
	   'Robert Singer',
	   41
	   )

INSERT INTO Directors(DirectorsId, name, episodesDirected)
Values(5,
	   'Philip Sgriccia',
	   40
	   )

INSERT INTO Directors(DirectorsId, name, episodesDirected)
Values(6,
	   'John F. Showalter',
	   19
	   )

INSERT INTO DirectorsShows(DirectorsID, ShowsID)
Values(1, 2)

INSERT INTO DirectorsShows(DirectorsID, ShowsID)
Values(2, 2)

INSERT INTO DirectorsShows(DirectorsID, ShowsID)
Values(3, 2)

INSERT INTO DirectorsShows(DirectorsID, ShowsID)
Values(4, 1)

INSERT INTO DirectorsShows(DirectorsID, ShowsID)
Values(5, 1)

INSERT INTO DirectorsShows(DirectorsID, ShowsID)
Values(6, 1)