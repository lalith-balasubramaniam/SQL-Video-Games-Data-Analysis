-- SQL Query from notebook cell
postgresql:///games

-- Retrieve the top ten best-selling video games from the game_sales table
-- Order the results by games_sold in descending order to show the highest sellers first

SELECT * 
FROM game_sales 
ORDER BY games_sold DESC 
LIMIT 10;

-- SQL Query from notebook cell
-- Join game_sales and reviews tables to include all games from game_sales, even if they lack review data
-- Select a count of games where both critic_score and user_score are NULL, to identify games missing reviews

SELECT COUNT(gs.game) AS count
FROM game_sales AS gs
LEFT JOIN reviews AS r ON gs.game = r.game
WHERE r.critic_score IS NULL AND r.user_score IS NULL;

-- SQL Query from notebook cell
-- Find the top ten years with the highest average critic score
-- Join game_sales and reviews tables, including only games present in both tables
-- Group by release year and calculate the average critic_score, rounded to two decimal places
-- Include only years with more than four reviewed games, then order by avg_critic_score descending

SELECT gs.year, 
       ROUND(AVG(r.critic_score), 2) AS avg_critic_score
FROM game_sales AS gs
INNER JOIN reviews AS r ON gs.game = r.game
GROUP BY gs.year
ORDER BY avg_critic_score DESC
LIMIT 10;

-- SQL Query from notebook cell
-- Find the top ten years with the highest average critic score, ensuring the years have more than four reviewed games
-- Include the count of games released each year as num_games, to assess data validity for each year

SELECT gs.year, 
       ROUND(AVG(r.critic_score), 2) AS avg_critic_score,
       COUNT(gs.game) AS num_games
FROM game_sales AS gs
INNER JOIN reviews AS r ON gs.game = r.game
GROUP BY gs.year
HAVING COUNT(gs.game) > 4
ORDER BY avg_critic_score DESC
LIMIT 10;

-- SQL Query from notebook cell
-- Identify years that were on the initial critics' favorite list but not on the refined list with more than four games
-- Select the year and avg_critic_score for these years, ordering by avg_critic_score descending

SELECT year, avg_critic_score
FROM top_critic_years
WHERE year NOT IN (SELECT year FROM top_critic_years_more_than_four_games)
ORDER BY avg_critic_score DESC;

-- SQL Query from notebook cell
-- Find the top ten years with the highest average user score
-- Join game_sales and reviews tables, grouping by year and calculating average user_score
-- Filter to include only years with more than four reviewed games and order by avg_user_score descending

SELECT gs.year, 
       ROUND(AVG(r.user_score), 2) AS avg_user_score,
       COUNT(gs.game) AS num_games
FROM game_sales AS gs
INNER JOIN reviews AS r ON gs.game = r.game
GROUP BY gs.year
HAVING COUNT(gs.game) > 4
ORDER BY avg_user_score DESC
LIMIT 10;

-- SQL Query from notebook cell
-- Identify years that appear in both top_critic_years_more_than_four_games and top_user_years_more_than_four_games tables
-- Use INTERSECT to select only years present in both tables

SELECT year
FROM top_critic_years_more_than_four_games
INTERSECT
SELECT year
FROM top_user_years_more_than_four_games;

-- SQL Query from notebook cell
-- Calculate total games sold for years that both players and critics loved
-- Use the previous query as a subquery to filter for years in both top critic and top user tables
-- Group by year and order by total_games_sold in descending order

SELECT gs.year, 
       SUM(gs.games_sold) AS total_games_sold
FROM game_sales AS gs
WHERE gs.year IN (
    SELECT year
    FROM top_critic_years_more_than_four_games
    INTERSECT
    SELECT year
    FROM top_user_years_more_than_four_games
)
GROUP BY gs.year
ORDER BY total_games_sold DESC;

