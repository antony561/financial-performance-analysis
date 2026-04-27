-- ================================================
-- Financial Performance Analysis — 2024
-- Tool: SQLite | Author: Data Analytics Team
-- ================================================


-- Query 1: City Budget vs Actual
SELECT city,
  ROUND(SUM(budgeted_expense), 2) AS total_budget,
  ROUND(SUM(actual_expense), 2) AS total_actual,
  ROUND(SUM(actual_expense) - SUM(budgeted_expense), 2) AS variance,
  CASE
    WHEN SUM(actual_expense) > SUM(budgeted_expense) THEN 'Over Budget'
    WHEN SUM(actual_expense) < SUM(budgeted_expense) THEN 'Under Budget'
    ELSE 'On Budget'
  END AS budget_status
FROM expenses
GROUP BY city
ORDER BY variance DESC;


-- Query 2: Quarterly Expenses
SELECT
  CASE
    WHEN month IN ('January', 'February', 'March') THEN 'Q1'
    WHEN month IN ('April', 'May', 'June') THEN 'Q2'
    WHEN month IN ('July', 'August', 'September') THEN 'Q3'
    WHEN month IN ('October', 'November', 'December') THEN 'Q4'
  END AS Quarter,
  ROUND(SUM(budgeted_expense), 2) AS total_budget,
  ROUND(SUM(actual_expense), 2) AS total_actual
FROM expenses
GROUP BY Quarter
ORDER BY total_actual DESC;


-- Query 3: Category Analysis
SELECT category,
  ROUND(SUM(actual_expense), 2) AS total_actual
FROM expenses
GROUP BY category
ORDER BY total_actual DESC;


-- Query 4: Monthly Trend
SELECT month,
  ROUND(SUM(actual_expense), 2) AS total_actual
FROM expenses
GROUP BY month
ORDER BY
  CASE month
    WHEN 'January' THEN 1
    WHEN 'February' THEN 2
    WHEN 'March' THEN 3
    WHEN 'April' THEN 4
    WHEN 'May' THEN 5
    WHEN 'June' THEN 6
    WHEN 'July' THEN 7
    WHEN 'August' THEN 8
    WHEN 'September' THEN 9
    WHEN 'October' THEN 10
    WHEN 'November' THEN 11
    WHEN 'December' THEN 12
  END;
