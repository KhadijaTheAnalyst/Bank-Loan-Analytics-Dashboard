# Bank-Loan-Analytics-Dashboard

## Overview
This project involves analyzing a dataset containing information about bank loan applications. The analysis was conducted using SQL for data querying and preparation, followed by the creation of dashboards in Excel, Power BI, and Tableau to visualize the findings. The goal was to uncover trends, assess loan performance, and provide actionable insights into the bank's loan portfolio.

## Workflow
1. SQL Analysis:
The analysis began with SQL, where I queried the database to extract, clean, and prepare the data for further analysis.
Key SQL queries were written to calculate metrics such as total loan amounts, average interest rates, and the distribution of loan statuses.
The output of these queries was then exported to CSV files for use in Excel, Power BI, and Tableau.
2. Excel Dashboard:
Using the data exported from SQL, I created a comprehensive dashboard in Excel.
This dashboard provides a high-level overview of key metrics, including total loan applications, funded amounts, and average debt-to-income (DTI) ratio.
Excel's pivot tables and charts were utilized to summarize and visualize the data effectively.
3. Power BI Report:
The cleaned and processed data from SQL was imported into Power BI.
Interactive dashboards were created in Power BI, allowing users to explore data on total payments, interest rates, and loan status distributions.
The report includes filters and slicers for dynamic exploration of different loan categories, states, and purposes.
4. Tableau Visualizations:
Tableau was used to create advanced visualizations and perform trend analysis on the loan data.
Visualizations include month-over-month loan application trends, loan distribution by state, and a detailed breakdown of loan purposes.
The Tableau workbook provides an intuitive way to spot patterns and anomalies in the data.
Dataset
The dataset used in this project includes the following columns:

id: Unique identifier for each loan application.
address_state: The state of the borrower's address.
application_type: Indicates if the loan application is individual or joint.
emp_length: Length of the borrower's employment.
emp_title: The borrower's job title.
grade: Loan grade assigned based on creditworthiness.
home_ownership: Homeownership status of the borrower.
issue_date: The date the loan was issued.
last_credit_pull_date: The last date when the borrower's credit was pulled.
last_payment_date: The date of the last payment made on the loan.
loan_status: The current status of the loan (e.g., fully paid, charged off).
next_payment_date: The due date for the next payment.
member_id: A unique identifier for the borrower.
purpose: The purpose of the loan (e.g., debt consolidation, home improvement).
sub_grade: Sub-grade of the loan, providing more granularity than the main grade.
term: The term length of the loan (e.g., 36 months, 60 months).
verification_status: Indicates whether the borrower's income was verified.
annual_income: The annual income of the borrower.
dti: Debt-to-income ratio of the borrower.
installment: The monthly payment amount.
int_rate: Interest rate on the loan.
loan_amount: The total amount of the loan.
total_acc: The total number of credit accounts the borrower has.
total_payment: The total amount paid by the borrower over the life of the loan.
Key Analysis Performed
Total Loan Applications: The total number of loan applications processed.
Total Funded Amount: The cumulative amount of loans funded.
Total Amounts Received: The total payments received from borrowers.
Average Interest Rate: The average interest rate applied to the loans.
Average DTI (Debt-to-Income Ratio): The average DTI across all loan applications.
Good Loans vs. Bad Loans:
Good Loans: Loans that are either fully paid or in good standing.
Bad Loans: Loans that are charged off, in default, or otherwise non-performing.
Month-to-Date (MTD) Loan Applications: Loan applications received in the current month.
Month-Over-Month Loan Applications: Trend analysis of loan applications over time.
Loan Applications by State: Distribution of loan applications across different states.
Loan Purpose Analysis: The different purposes for which loans were issued (e.g., debt consolidation, home improvement).
How to Use the Project
SQL Scripts: The SQL queries used for data extraction and analysis are provided in the SQL/ folder.
Excel Dashboard: The Excel file in the Excel/ folder contains a dashboard summarizing the key metrics and trends identified in the dataset.
Power BI Report: The Power BI file in the PowerBI/ folder provides interactive visualizations, allowing you to explore the data in more depth.
Tableau Workbook: The Tableau workbook in the Tableau/ folder includes detailed visualizations and trend analysis. If you have Tableau Desktop installed, you can open the .twbx file to explore the visualizations.
Conclusion
This project provides a comprehensive analysis of the bank's loan portfolio, using SQL for data preparation and Excel, Power BI, and Tableau for visualization. The dashboards and reports created offer valuable insights into loan performance, helping to identify trends, risks, and opportunities within the loan data.
