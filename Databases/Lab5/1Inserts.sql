USE TvShows

INSERT INTO Tables(Name)
VALUES  ('Shows'),
		('Episodes'),
		('ShowsActors')

INSERT INTO Tests(Name)
VALUES ('T1_10'),
	   ('T1_100'),
		('T1_1000'),
		('T1_10000'),
		('T2_10'),
		('T2_100'),
		('T2_1000'),
		('T2_10000'),
		('T3_10'),
		('T3_100'),
		('T3_1000'),
		('T3_10000')


INSERT INTO TestTables(TestID, TableID, NoOfRows, Position)
VALUES  (1, 1, 10, 1),
		(2, 1, 100, 1),
		(3, 1, 1000, 1),
		(4, 1, 10000, 1),
		(5, 2, 10, 2),
		(6, 2, 100, 2),
		(7, 2, 1000, 2),
		(8, 2, 10000, 2),
		(9, 3, 10, 3),
		(10, 3, 100, 3),
		(11, 3, 1000, 3),
		(12, 3, 10000, 3)

INSERT INTO Views(Name)
VALUES ('View1'),
	   ('View2'),
	   ('View3')

INSERT INTO TestViews(TestID, ViewId)
VALUES (1, 1),
	   (2, 1),
	   (3, 1),
	   (4, 1),
	   (5, 2),
	   (6, 2),
	   (7, 2),
	   (8, 2),
	   (9, 3),
	   (10, 3),
	   (11, 3),
	   (12, 3)
