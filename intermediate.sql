Casey Muhs
Intermediate SQL
Yippee

1) Write a query to count the number of non-null rows in the low column.
SELECT COUNT(low)
  FROM tutorial.aapl_historical_stock_price
You're calling count so it can count all the non-null values in the low column.

2) Write a query that determines counts of every single column. Which column has the most null values? 
SELECT COUNT(year) AS year,
       COUNT(month) AS month,
       COUNT(open) AS open,
       COUNT(high) AS high,
       COUNT(low) AS low,
       COUNT(close) AS close,
       COUNT(volume) AS volume
  FROM tutorial.aapl_historical_stock_price
Each time count is called, it has a column to count in it's parameters. As it turns out, high has the most null values.

3) Write a query to calculate the average opening price (hint: you will need to use both COUNT and SUM, as well as some simple arithmetic.).
SELECT SUM(open) / COUNT(open) AS avg_open
  FROM tutorial.aapl_historical_stock_price
To get the average of something you take the sum and divide it by the count. Which is exactly what we did. Called sum of open and then applied simple arithmetic, divide, and called count of open. While also naming said result column

4)What was Apple's lowest stock price (at the time of this data collection)?
SELECT MIN(low)
  FROM tutorial.aapl_historical_stock_price
Using min to find the lowest stock price in the whole column of low

5) What was the highest single-day increase in Apple's share value?
SELECT MAX(close - open)
  FROM tutorial.aapl_historical_stock_price
In the parameters, we're using arithmetic to find the largest result and then pulling it with max.

6) Write a query that calculates the average daily trade volume for Apple stock.
SELECT AVG(volume)
  FROM tutorial.aapl_historical_stock_price
Calling average of the volume column

7) Calculate the total number of shares traded each month. Order your results chronologically.
SELECT year,
       month,
       SUM(volume) AS sum_volume
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  ORDER BY year, month
Calling year, month, and sum of volume. Grouping by year and then month

8) Write a query to calculate the average daily price change in Apple stock, grouped by year.
SELECT year,
       AVG(close - open) AS avg_daily_change
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year
Calling

9) Write a query that calculates the lowest and highest prices that Apple stock achieved each month.
SELECT year,
       month,
       MAX(high) AS highest_price,
       MIN(low) AS lowest_price
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  ORDER BY year, month


10) Write a query that includes a column that is flagged "yes" when a player is from California, and sort the results with those players first.
SELECT player_name,
       state,
       CASE WHEN state = 'CA' THEN 'yes'
            ELSE NULL END AS from_cali
  FROM benn.college_football_players
  ORDER BY 3


11) Write a query that includes players' names and a column that classifies them into four categories based on height. Keep in mind that the answer we provide is only one of many possible answers, since you could divide players' heights in many ways.
SELECT player_name,
       height,
       CASE WHEN height > 79 THEN 'over 79'
            WHEN height > 75 AND height <= 79 THEN '76-79'
            WHEN height > 71 AND height <= 75 THEN '72-75'
            ELSE '71 and under' END AS height_group
  FROM benn.college_football_players

12) Write a query that selects all columns from benn.college_football_players and adds an additional column that displays the player's name if that player is a junior or senior.
SELECT *,
       CASE WHEN year = 'JR' OR year = 'SR' THEN player_name
            ELSE NULL END AS jr_or_sr
  FROM benn.college_football_players


13) Write a query that counts the number of 300lb+ players for each of the following regions: West Coast (CA, OR, WA), Texas, and Other (Everywhere else).
SELECT CASE WHEN weight >= 300 AND state IN ('CA', 'OR', 'WA') THEN 'West Coast'
            WHEN weight >= 300 AND state = 'TX' THEN 'Texas'
            WHEN weight >= 300 AND state NOT IN ('CA', 'OR', 'WA', 'TX') THEN 'Other'
            ELSE 'Does Not Compute' END AS regions,
            COUNT(1) AS count
  FROM benn.college_football_players
  GROUP BY CASE WHEN weight >= 300 AND state IN ('CA', 'OR', 'WA') THEN 'West Coast'
            WHEN weight >= 300 AND state = 'TX' THEN 'Texas'
            WHEN weight >= 300 AND state NOT IN ('CA', 'OR', 'WA', 'TX') THEN 'Other'
            ELSE 'Does Not Compute' END
**CORRECT CODE BELOW**
SELECT CASE WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
            WHEN state = 'TX' THEN 'Texas'
            ELSE 'Other' END AS regions,
            COUNT(1) AS players
  FROM benn.college_football_players
  WHERE weight >= 300
  GROUP BY 1


14) Write a query that calculates the combined weight of all underclass players (FR/SO) in California as well as the combined weight of all upperclass players (JR/SR) in California.


















