WITH trn_fixtures AS (

    SELECT * FROM {{ ref('trn_fixtures') }}

),


gameweek_kpis AS (

SELECT
  league_id,
  league_country,
  league_name,
  league_season,
  league_round,
  COUNT(DISTINCT fixture_id) AS fixture_count,
  SUM(goals_home) AS home_goals_count,
  SUM(goals_away) AS away_goals_count,
  SUM(goals_total) AS total_goals_count,
  SUM(home_win) AS home_win_count,
  SUM(away_win) AS away_win_count,
  SUM(draw) AS draw_count,
  SUM(btts) AS btts_count,
  SUM(over_2_goals) AS over_2_goals_count
FROM
  trn_fixtures
GROUP BY
  1, 2, 3, 4, 5
ORDER BY
  1, 2, 3, 4, 5

)


SELECT * FROM gameweek_kpis