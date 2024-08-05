SELECT
*
FROM Genre;

SELECT * FROM Artist ORDER BY ArtistName;

SELECT s.Title, a.ArtistName FROM Song s LEFT JOIN Artist a ON s.ArtistId = a.Id;

--SELECT a.ArtistName
--FROM Artist a
--LEFT JOIN Album al ON a.Id = al.ArtistId
--LEFT JOIN Genre g ON al.GenreId = g.Id
--WHERE g.Name = 'Pop';
-- *Does not print anything*

SELECT a.ArtistName FROM Artist a LEFT JOIN Album al ON a.ID = al.ArtistId 
								  LEFT JOIN Genre g ON al.GenreId = g.Id
								  WHERE g.Name = 'Jazz' OR g.Name = 'Rock';

--SELECT al.Title FROM Album al LEFT JOIN Song s ON al.Id = s.AlbumId WHERE al.Song = Null;

--7
INSERT INTO Artist (ArtistName, YearEstablished) VALUES	 ('Sleep Token', 2016);

--8
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Take Me Back to Eden', '05/23/2023', 63, 'Spinefarm', 28, 5);

--9
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Granite', 60, '05/23/2023', 5, 28, 23);

--10
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

--11
SELECT al.Title AS AlbumTitle, COUNT(s.Id) AS NumberOfSongs
FROM Album al
JOIN Song s ON al.Id = s.AlbumId
GROUP BY al.Title;

--12
SELECT a.ArtistName, COUNT(s.Id) AS NumberOfSongs
FROM Artist a
JOIN Song s ON a.Id = s.ArtistId
GROUP BY a.ArtistName;

--13
SELECT g.Name AS GenreName, COUNT(s.Id) AS NumberOfSongs
FROM Genre g
JOIN Song s ON g.Id = s.GenreId
GROUP BY g.Name;

--14
SELECT a.ArtistName
FROM Artist a
JOIN Album al ON a.Id = al.ArtistId
GROUP BY a.ArtistName
HAVING COUNT(DISTINCT al.Label) > 1;

--15
SELECT Title, AlbumLength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album);

--16
SELECT Title, SongLength
FROM Song
WHERE SongLength = (SELECT MAX(SongLength) FROM Song);

--17
SELECT s.Title AS SongTitle, s.SongLength, al.Title AS AlbumTitle
FROM Song s
JOIN Album al ON s.AlbumId = al.Id
WHERE s.SongLength = (SELECT MAX(SongLength) FROM Song);