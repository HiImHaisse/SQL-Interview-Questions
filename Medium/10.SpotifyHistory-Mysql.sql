SELECT 
  user_id,
  song_id,
  SUM(song_plays) AS total_plays
FROM (
  /* Conteo semanal hasta el 4-ago */
  SELECT 
    user_id,
    song_id,
    COUNT(*) AS song_plays
  FROM songs_weekly
  WHERE DATE(listen_time) <= '2022-08-04'
  GROUP BY user_id, song_id

  UNION ALL

  /* Históricos */
  SELECT 
    user_id,
    song_id,
    song_plays
  FROM songs_history
) AS combined
GROUP BY user_id, song_id
ORDER BY total_plays DESC;


