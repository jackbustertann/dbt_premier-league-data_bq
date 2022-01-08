SELECT 

    league_id
,   league_country
,   league_name
,   league_season
,   CAST(REGEXP_EXTRACT(league_round, '[0-9]+') AS INT) AS league_round
,   fixture_id
,   goals_home
,   goals_away

FROM `premier-league-data-337116.pl_test.src_fixtures` 