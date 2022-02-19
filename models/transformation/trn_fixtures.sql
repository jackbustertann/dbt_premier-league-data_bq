WITH stg_fixtures AS (

    SELECT * FROM {{ ref('stg_fixtures') }}

),


trn_fixtures AS (

SELECT
  league_id,
  league_country,
  league_name,
  league_season,
  league_round,
  fixture_id,
  team_home,
  team_away,
  goals_home,
  goals_away,
  goals_home + goals_away AS goals_total,
  CASE WHEN goals_home > goals_away THEN 1 ELSE 0 END AS home_win,
  CASE WHEN goals_home < goals_away THEN 1 ELSE 0 END AS away_win,
  CASE WHEN goals_home > goals_away THEN 1 ELSE 0 END AS draw,
  CASE WHEN goals_home > 0 AND goals_away > 0 THEN 1 ELSE 0 END AS btts,
  CASE WHEN goals_home + goals_away > 2 THEN 1 ELSE 0 END AS over_2_goals
FROM
  stg_fixtures

)


SELECT * FROM trn_fixtures