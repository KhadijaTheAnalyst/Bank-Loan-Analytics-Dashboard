SELECT * 
FROM financial_loan


-- We are calculating the total loan applications for year 2021,

SELECT COUNT (id) AS Total_Loan_Applications
FROM financial_loan

--Calculating how many loan have been issued this month
SELECT COUNT (id) AS MTD_Total_Loan_Applications
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 -- the year statement is not necessary here as we only have data for the year 2021, but when we have multiple years

--Calculating how many loan applications has issued last month(assuming December is the current month)
SELECT COUNT (id) AS PMTD_Total_Loan_Applications --PMTD <- Previous Month to Date
FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 

--Calculating total funded loan amount for year 2021
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan

--Calculating total funded loan amount for December
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date) = 12 

--Calculating total funded loan amount for November
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date) = 11 

--Calculating Total Loan amount recieved for year 2021
SELECT SUM(total_payment) AS Total_Amount_Received
FROM financial_loan

--Calculating Total Loan amount recieved for December
SELECT SUM(total_payment) AS MTD_Total_Amount_Received
FROM financial_loan
WHERE MONTH(issue_date) =12

--Calculating Total Loan amount recieved for November
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received
FROM financial_loan
WHERE MONTH(issue_date) =11

--Calculating Average interest rate
SELECT AVG(int_rate)*100 AS AVG_Int_Rate
FROM financial_loan
 
 --Calculating Average interest rate for December
SELECT AVG(int_rate)*100 AS MTD_AVG_Int_Rate
FROM financial_loan
WHERE MONTH(issue_date) =12

--Calculating Average interest rate for November
SELECT AVG(int_rate)*100 AS PMTD_AVG_Int_Rate
FROM financial_loan
WHERE MONTH(issue_date) = 11

--Calculating Average DTI(Debt to income ratio) for year 2021
SELECT ROUND(AVG(dti)*100,4) AS Avg_DTI
FROM financial_loan

--Calculating Average DTI(Debt to income ratio) for December
SELECT ROUND(AVG(dti)*100,4) AS MTD_Avg_DTI
FROM financial_loan
WHERE MONTH(issue_date) = 12

--Calculating Average DTI(Debt to income ratio) for November
SELECT ROUND(AVG(dti)*100,4) AS PMTD_Avg_DTI
FROM financial_loan
WHERE MONTH(issue_date) = 11

/*
The Debt-to-Income (DTI) ratio is an important financial metric used to assess an individual's ability to manage monthly debt payments 
relative to their income. It is expressed as a percentage.
-- Good: Below 36%
-- Acceptable: 36% - 43%
-- High Risk: Above 43%
-- Very High Risk: Above 50%
*/

-- Calculating Number of Good Loans issued in 2021
SELECT COUNT(id) AS Good_Loans
FROM financial_loan 
WHERE loan_status IN ('Current','Fully Paid')

-- Calculating Percentage of Good Loans issued in 2021
SELECT (COUNT(CASE
				WHEN loan_status = 'Current' OR  loan_status = 'Fully Paid' THEN id
				END)*100)/COUNT(id)  AS Good_Loan_Per
FROM financial_loan

-- Calculating Good Loans Amount issued in 2021
SELECT SUM(loan_amount) AS Good_Loan_Amt
FROM financial_loan
WHERE loan_status IN ('Current','Fully Paid')

-- Calculating Good Loans Amount received in 2021
SELECT SUM(total_payment) AS Good_Loan_Amt_rec
FROM financial_loan
WHERE loan_status IN ('Current','Fully Paid')

-- Calculating Percentage of Bad Loans issued in 2021
SELECT (COUNT(CASE
				WHEN loan_status = 'Charged Off' THEN id
				END)*100)/COUNT(id)  AS Bad_Loan_Per
FROM financial_loan

-- Calculating Number of Good Loans issued in 2021
SELECT COUNT(id) AS Bad_Loans
FROM financial_loan 
WHERE loan_status IN ('Charged Off')

-- Calculating Bad Loans Amount issued in 2021
SELECT SUM(loan_amount) AS Bad_Loan_Amt
FROM financial_loan
WHERE loan_status = ('Charged Off')

-- Calculating Bad Loans Amount received in 2021
SELECT SUM(total_payment) AS Bad_Loan_Amt_rec
FROM financial_loan
WHERE loan_status = ('Charged Off')

--Calculating Loan status
SELECT loan_status,
		COUNT(id) AS Total_Loan_Applications,
		SUM(total_payment) AS Total_Amount_Received,
		SUM(loan_amount) AS Total_Funded_Amount,
		AVG(int_rate)*100 AS Ineterest_Rate,
		AVG(dti *100) AS DTI
FROM financial_loan
GROUP BY loan_status

--Calculating loan status MTD 
SELECT loan_status,
		SUM(total_payment) AS MTD_Total_Amount_Received,
		SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date) =12
GROUP BY loan_status

--Calculating the Metrics by Month
SELECT
	MONTH(issue_date) AS Month_No,
	DATENAME(MONTH, issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date),DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--Calculating the Metrics by Region
SELECT
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state

--Calculating the Metrics by Loan term
SELECT
	term AS Loan_Term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term

--Calculating the Metrics by Employee Length
SELECT
	emp_length AS Emp_Length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length

--Calculating the Metrics by Loan purpose
SELECT
	purpose AS Loan_Purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose

--Calculating How many loans are Home Loans
SELECT
	home_ownership AS Home_Loan,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership