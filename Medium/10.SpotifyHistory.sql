with t1 as 
(select user_id,song_id, count(song_id) as acumulado from songs_weekly
where listen_time <='2022-08-04'
group by user_id,song_id
order by acumulado desc)
SELECT COALESCE(t2.user_id,t1.user_id) as user_id
,COALESCE(t2.song_id,t1.song_id) as song_id
,COALESCE(t2.song_plays,0)+COALESCE(t1.acumulado,0) as song_plays
from songs_history as t2
left join t1 on t2.song_id=t1.song_id and t2.user_id=t1.user_id
order by song_plays DESC
