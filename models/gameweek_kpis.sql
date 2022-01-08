WITH fixtures AS (

    SELECT * FROM {{ ref('stg_fixtures') }}

),

final AS (
    SELECT 
        league_id
    ,   league_country
    ,   league_name
    ,   league_season
    ,   league_round
    ,   COUNT(DISTINCT fixture_id) AS fixture_count
    ,   SUM(goals_home) AS home_goals_count
    ,   SUM(goals_away) AS away_goals_count
    ,   SUM(goals_home + goals_away) AS total_goals_count
    ,   SUM(CASE WHEN goals_home > goals_away THEN 1 ELSE 0 END) AS home_win_count
    ,   SUM(CASE WHEN goals_home < goals_away THEN 1 ELSE 0 END) AS away_win_count
    ,   SUM(CASE WHEN goals_home = goals_away THEN 1 ELSE 0 END) AS draw_count
    ,   SUM(CASE WHEN goals_home > 0 AND goals_away > 0 THEN 1 ELSE 0 END) AS btts_count
    ,   SUM(CASE WHEN goals_home + goals_away > 2 THEN 1 ELSE 0 END) AS over_2_count
    FROM fixtures
    GROUP BY 1, 2, 3, 4, 5
    ORDER BY 1, 2, 3, 4, 5
)

SELECT * FROM final