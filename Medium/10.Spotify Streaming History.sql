with t1 as (select user_id,song_id,count(song_id) as song_plays from songs_weekly
where date(listen_time)<='2022-08-04'
group by user_id,song_id
order by song_plays desc), t2 as (select * from t1   
union all
select user_id,song_id, song_plays from songs_history)
select user_id,song_id,sum(song_plays) as song_plays from t2
group by user_id,song_id
order by song_plays desc
