--1
select genre_id, count(*) from genre_executor ge2 
group by genre_id 
order by count(*) desc;

--2
select production_year, track_name from album
join track on track.track_id = album.album_id
where production_year between 2019 and 2020
group by production_year , track_name
order by count(*) desc;

--3
select avg(duration) from track

--4
select e.executor_name  from executor e
left join album_executor ae on e.executor_id = ae.executor_id 
left join album a on a.album_id = ae.album_id 
where not a.production_year = 2020
order by e.executor_name 

--5
select c.collection_name  from collection c 
left join track_collection tc on c.collection_id = tc.collection_id 
left join track t on t.track_id = tc.track_id 
left join album a on a.album_id = t.album_id 
left join album_executor ae on ae.album_id = a.album_id 
left join executor e on ae.executor_id = e.executor_id 
where e.executor_name like '%Olga%'
order by c.collection_name 

--6
select a.album_name from album a 
left join album_executor ae  on a.album_id = ae.album_id 
left join executor e on e.executor_id = ae.executor_id 
left join genre_executor ge on e.executor_id = ge.executor_id 
left join genre g on g.genre_id = ge.genre_id
group by a.album_name 
having count(distinct g.genre_name) > 1
order by a.album_name 

--7
select t.track_name from track t 
left join track_collection tc on t.track_id = tc.track_id 
where tc.track_id is null

--8
select e.executor_name, t.duration  from track t 
left join album a on a.album_id = t.album_id 
left join album_executor ae on ae.album_id = a.album_id 
left join executor e on e.executor_id = ae.executor_id 
group by e.executor_name, t.duration 
having t.duration = (select min(duration) from track)
order by e.executor_name 

--9
select a.album_name
from album as a
left join track as t on t.album_id = a.album_id
where t.album_id in (
    select album_id
    from track
    group by album_id
    having count(album_id) = (
        select count(album_id)
        from track
        group by album_id
        order by count
        limit 1
    )
)
order by a.album_name

