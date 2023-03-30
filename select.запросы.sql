--1
SELECT count(ge.genre_id), g.genre_name FROM genre_executor ge 
JOIN genre g ON ge.genre_id = g.genre_id
GROUP BY g.genre_name;
--2
SELECT count(t.track_name) FROM track t 
JOIN album a ON t.album_id = a.album_id
WHERE a.production_year BETWEEN 2019 AND 2020;

--3
SELECT a.production_year , AVG(t.duration)  FROM track t
JOIN album a ON t.album_id = a.album_id
GROUP BY a.production_year;

--4
SELECT e.executor_name FROM executor e  
WHERE e.executor_name NOT IN (
	SELECT e2.executor_name FROM executor e2 
	JOIN album_executor ae ON e2.executor_id = ae.executor_id 
	JOIN album a3 ON ae.album_id = a3.album_id
	WHERE a3.production_year = 2020
);

--5
select c.collection_name  from collection c 
left join track_collection tc on c.collection_id = tc.collection_id 
left join track t on t.track_id = tc.track_id 
left join album a on a.album_id = t.album_id 
left join album_executor ae on ae.album_id = a.album_id 
left join executor e on ae.executor_id = e.executor_id 
where e.executor_name like '%Olga%'

--6
SELECT DISTINCT a.album_name AS album FROM genre_executor ge
JOIN executor e  ON ge.executor_id  = e.executor_id
JOIN album_executor ae  ON e.executor_id = ae.executor_id
JOIN album a ON ae.album_id = a.album_id
GROUP BY album_name, ge.executor_id 
having count(ge.genre_id) > 1;


--7
SELECT t.track_name FROM track t 
LEFT JOIN track_collection tc ON t.track_id = tc.tracK_id 
WHERE tc.track_id IS NULL;
--8
SELECT t.duration, e.executor_name  FROM track t 
JOIN album a ON t.album_id = a.album_id 
JOIN album_executor ae  ON a.album_id = ae.album_id 
JOIN executor e  ON ae.album_id = e.executor_id
WHERE duration = (SELECT MIN(duration) FROM track);
--9

select a.album_name from album as a
left join track as t on t.album_id = a.album_id
group by a.album_name
having count(track_id) = (
	select count(track_id) from track
	group by album_id 
	order by 1
	limit 1
);



