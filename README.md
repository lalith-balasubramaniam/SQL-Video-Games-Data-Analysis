# 🎮 Data Analysis Using SQL: When Was the Golden Age of Video Games?

## Project Overview
This project explores data from the top 400 best-selling video games released between 1977 and 2020. By analyzing sales data alongside critic and user reviews, this project seeks to identify trends in the gaming industry and determine if a "Golden Age" of video games exists. The analysis covers critic favorites, player favorites, and overall sales trends, using SQL to reveal valuable insights from the data.

## Dataset
- **Source**: [Kaggle - Video Game Sales and Reviews Dataset](https://www.kaggle.com/holmjason2/videogamedata)
- **Tables**: 
  - `game_sales`: Contains game names, platforms, publishers, developers, release years, and total copies sold.
  - `reviews`: Includes critic and user review scores for each game.
- **Dataset Limitation**: For this project, each table is limited to 400 rows to focus on high-level analysis.

## Project Objectives
Using SQL techniques such as joins, subqueries, and set operations, this project seeks to:
1. Identify the best-selling video games.
2. Analyze the impact of missing review data.
3. Discover the years that critics and players each considered the best.
4. Find consensus "favorite" years between critics and players.
5. Determine if highly rated years also had strong sales.

## Tasks
1. **Top 10 Best-Selling Video Games**: Retrieve the top ten games based on sales.
2. **Missing Review Scores**: Identify games missing both critic and user scores.
3. **Critic Favorites by Year**: Find the years with the highest average critic scores.
4. **User Favorites by Year**: Determine the years with the highest average user scores.
5. **Consensus Favorites**: Identify years loved by both critics and players.
6. **Sales Analysis in Top Years**: Examine total sales in years that both groups favored.

## Files Included
- `project_queries.sql`: SQL file containing all queries used in the analysis.
- `Videogames.md`: Detailed project documentation with a breakdown of each task and findings.
- `README.md`: Project overview, dataset description, and instructions for running the analysis.

## Getting Started
To run this analysis:
1. Load the dataset into a SQL database (e.g., PostgreSQL).
2. Create tables `game_sales` and `reviews` in your SQL environment, using the provided dataset.
3. Run each query in `project_queries.sql` sequentially to replicate the analysis and insights.

## Conclusion
This project highlights SQL's power to analyze trends in data and provide a comprehensive view of the video game industry's history. While we've identified potential "golden years" based on critic and user scores, further data could refine these findings and validate trends across more years and games.
  
## License
This project is for educational purposes and is based on a dataset provided on Kaggle.
