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
SELECT CASE WHEN year IN ('FR', 'SO') THEN 'underclass'
            WHEN year IN ('JR', 'SR') THEN 'upperclass'
            ELSE NULL END AS class_groups,
       SUM(weight) AS combined_group_weight
  FROM benn.college_football_players
  WHERE state = 'CA'
  GROUP BY 1


15) Write a query that displays the number of players in each state, with FR, SO, JR, and SR players in separate columns and another column for the total number of players. Order results such that states with the most players come first.
SELECT state,
       COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count,
       COUNT(1) AS total_players
  FROM benn.college_football_players
  GROUP BY state
  ORDER BY total_players DESC


16) Write a query that shows the number of players at schools with names that start with A through M, and the number at schools with names starting with N - Z.
SELECT CASE WHEN school_name < 'n' THEN 'A-M'
            WHEN school_name >= 'n' THEN 'N-Z'
            ELSE NULL END AS school_group_name,
        COUNT(1) AS players
  FROM benn.college_football_players
  GROUP BY 1


17) Write a query that returns the unique values in the year column, in chronological order.
SELECT DISTINCT year
  FROM tutorial.aapl_historical_stock_price
  ORDER BY year


18) Write a query that counts the number of unique values in the month column for each year.
SELECT year, 
      COUNT(DISTINCT month) AS unique_count
  FROM tutorial.aapl_historical_stock_price
  GROUP by year
  ORDER BY year


19) Write a query that separately counts the number of unique values in the month column and the number of unique values in the `year` column.
SELECT COUNT(DISTINCT year) AS year_count, 
      COUNT(DISTINCT month) AS month_count
  FROM tutorial.aapl_historical_stock_price


20) Write a query that selects the school name, player name, position, and weight for every player in Georgia, ordered by weight (heaviest to lightest). Be sure to make an alias for the table, and to reference all column names in relation to the alias.
SELECT players.school_name,
       players.player_name,
       players.position,
       players.weight
    FROM benn.college_football_players players
  WHERE players.state = 'GA'
  ORDER BY players.weight DESC


21) Write a query that displays player names, school names and conferences for schools in the "FBS (Division I-A Teams)" division.
SELECT players.player_name,
       teams.school_name,
       teams.conference
    FROM benn.college_football_players players
    JOIN benn.college_football_teams teams
      ON teams.school_name = players.school_name
      WHERE teams.division = 'FBS (Division I-A Teams)'


22) Write a query that performs an inner join between the tutorial.crunchbase_acquisitions table and the tutorial.crunchbase_companies table, but instead of listing individual rows, count the number of non-null rows in each table.
SELECT COUNT(companies.permalink) AS companies_count,
       COUNT(acquisitions.company_permalink) AS acquisitions_count
  FROM tutorial.crunchbase_companies companies
  JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink


23) Modify the query above to be a LEFT JOIN. Note the difference in results.
SELECT COUNT(companies.permalink) AS companies_count,
       COUNT(acquisitions.company_permalink) AS acquisitions_count
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink


24) Count the number of unique companies (don't double-count companies) and unique acquired companies by state. Do not include results for which there is no state data, and order by the number of acquired companies from highest to lowest.
SELECT companies.state_code,
       COUNT(DISTINCT companies.permalink) AS companies_count,
       COUNT(DISTINCT acquisitions.company_permalink) AS acquisitions_count
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
  WHERE companies.state_code IS NOT NULL
  GROUP BY 1
  ORDER BY 3 DESC


25) Rewrite the previous practice query in which you counted total and acquired companies by state, but with a RIGHT JOIN instead of a LEFT JOIN. The goal is to produce the exact same results.
SELECT COUNT(companies.permalink) AS companies_count,
       COUNT(acquisitions.company_permalink) AS acquisitions_count
  FROM tutorial.crunchbase_companies companies
  RIGHT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink


26) Write a query that shows a company's name, "status" (found in the Companies table), and the number of unique investors in that company. Order by the number of investors from most to fewest. Limit to only companies in the state of New York.
SELECT companies.name AS company_name,
       companies.status,
       COUNT(DISTINCT investments.investor_name) AS unique_investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments investments
    ON companies.permalink = investments.company_permalink
  WHERE companies.state_code = 'NY'
  GROUP BY 1, 2
  ORDER BY 3 DESC


27) Write a query that lists investors based on the number of companies in which they are invested. Include a row for companies with no investor, and order from most companies to least.
SELECT CASE WHEN investments.investor_name IS NULL THEN 'No Investors'
            ELSE investments.investor_name END AS investor,
       COUNT(DISTINCT companies.permalink) AS companies_invested_in
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments investments
    ON companies.permalink = investments.company_permalink
 GROUP BY 1
 ORDER BY 2 DESC


28) Write a query that joins tutorial.crunchbase_companies and tutorial.crunchbase_investments_part1 using a FULL JOIN. Count up the number of rows that are matched/unmatched as in the example above.
SELECT COUNT(CASE WHEN companies.permalink IS NOT NULL AND investments1.company_permalink ISNULL
                  THEN companies.permalink ELSE NULL END) AS companies_only,
       COUNT(CASE WHEN companies.permalink IS NOT NULL AND investments1.company_permalink IS NOT NULL
                  THEN companies.permalink ELSE NULL END) AS both_tables,
       COUNT(CASE WHEN companies.permalink ISNULL AND investments1.company_permalink IS NOT NULL
                  THEN investments1.company_permalink ELSE NULL END) AS investments1_only
  FROM tutorial.crunchbase_companies companies
  FULL JOIN tutorial.crunchbase_investments_part1 investments1
    ON companies.permalink = investments1.company_permalink


29) Write a query that appends the two crunchbase_investments datasets above (including duplicate values). Filter the first dataset to only companies with names that start with the letter "T", and filter the second to companies with names starting with "M" (both not case-sensitive). Only include the company_permalink, company_name, and investor_name columns.
SELECT company_permalink,
       company_name,
       investor_name
  FROM tutorial.crunchbase_investments_part1
  WHERE company_name ILIKE 'T%'
  
UNION ALL

SELECT company_permalink,
       company_name,
       investor_name
  FROM tutorial.crunchbase_investments_part2
  WHERE company_name ILIKE 'M%'


30) Write a query that shows 3 columns. The first indicates which dataset (part 1 or 2) the data comes from, the second shows company status, and the third is a count of the number of investors.
Hint: you will have to use the tutorial.crunchbase_companies table as well as the investments tables. And you'll want to group by status and dataset.
SELECT 'investments1' AS dataset_name,
       companies.status,
       COUNT(DISTINCT investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part1 investments
  ON companies.permalink = investments.company_permalink
  GROUP BY 1,2
  
UNION ALL

SELECT 'investments2' AS dataset_name,
       companies.status,
       COUNT(DISTINCT investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part2 investments
  ON companies.permalink = investments.company_permalink
  GROUP BY 1,2































