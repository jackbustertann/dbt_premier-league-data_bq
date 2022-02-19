SELECT
  league_id,
  league_country,
  league_name,
  league_season,
  CAST(REGEXP_EXTRACT(league_round, '[0-9]+') AS INT) AS league_round,
  fixture_id,
  teams_home_name AS team_home,
  teams_away_name AS team_away,
  goals_home,
  goals_away
FROM
  {% if target.name == 'prod' %}
    {{ source('pl_prod', 'src_fixtures') }}
  {% else %}
    {{ source('pl_dev', 'src_fixtures') }}
  {% endif %}
ORDER BY 
  1, 2, 3, 4, 5, 6