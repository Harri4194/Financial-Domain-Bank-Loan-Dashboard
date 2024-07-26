-- A. BANK LOAN REPORT (SUMMARY)

select * from Bank_Loan_Data

--Total Loan Applications
select count(id) as Total_Loan_Applications from Bank_Loan_Data

select count(id) as MTD_Total_Loan_Applications from Bank_Loan_Data
where month(issue_date) = 12 and year(issue_date) = 2021

select count(id) as PMTD_Total_Loan_Applications from Bank_Loan_Data
where month(issue_date) = 11 and year(issue_date) = 2021


--Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount from Bank_Loan_Data

select sum(loan_amount) as MTD_Total_Funded_Amount from Bank_Loan_Data
where month(issue_date) = 12 and year(issue_date) = 2021

select sum(loan_amount) as PMTD_Total_Funded_Amount from Bank_Loan_Data
where month(issue_date) = 11 and year(issue_date) = 2021


--Total Amount Received
select sum(total_payment) as Total_Amount_Collected from Bank_Loan_Data

select sum(total_payment) as MTD_Total_Amount_Collected from Bank_Loan_Data
where month(issue_date) = 12 and year(issue_date) = 2021

select sum(total_payment) as PMTD_Total_Amount_Collected from Bank_Loan_Data
where month(issue_date) = 11 and year(issue_date) = 2021

--Average Interest Rate
select avg(int_rate)*100 as Avg_Int_Rate from Bank_Loan_Data

select avg(int_rate)*100 as MTD_Avg_Int_Rate from Bank_Loan_Data
where month(issue_date) = 12

select avg(int_rate)*100 as PMTD_Avg_Int_Rate from Bank_Loan_Data
where month(issue_date) = 11


--Avg Debt To Income

select avg(dti)*100 as Avg_DTI from Bank_Loan_Data

select avg(dti)*100 as MTD_Avg_DTI from Bank_Loan_Data
where month(issue_date) = 12

select avg(dti)*100 as PMTD_Avg_DTI from Bank_Loan_Data
where month(issue_date) = 11



--GOOD LOAN ISSUED
--Good Loan Percentage
select 
(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) * 100)
/
count(id) as Good_loan_percentage
from Bank_Loan_Data

--Good Loan Applications
select count(id) as Good_Loan_Application from Bank_Loan_Data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Good Loan Funded Amount
select sum(loan_amount) as Good_Loan_Amount from Bank_Loan_Data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Good Loan Amount Received
select sum(total_payment) as Good_Loan_amount_received from Bank_Loan_Data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


--BAD LOAN ISSUED
--BAD Loan Percentage
select 
(count(case when loan_status = 'Charged Off' then id end) * 100)
/
count(id) as Bad_loan_percentage
from Bank_Loan_Data

--Bad Loan Applications
select count(id) as Bad_Loan_Application from Bank_Loan_Data
where loan_status = 'Charged Off'

--Bad Loan Funded Amount
select sum(loan_amount) as Bad_Loan_Amount from Bank_Loan_Data
where loan_status = 'Charged Off'

--Bad Loan Amount Received
select sum(total_payment) as Bad_Loan_amount_received from Bank_Loan_Data
where loan_status = 'Charged Off'

--Loan status 
select loan_status from Bank_Loan_Data

select
        loan_status,
        count(id) as Loan_Count,
        sum(total_payment) as Total_Amount_Received,
        sum(loan_amount) AS Total_Funded_Amount,
        avg(int_rate * 100) AS Interest_Rate,
        avg(dti * 100) AS DTI
    from
        Bank_Loan_Data
    group by
        loan_status

select 
	loan_status, 
	sum(total_payment) as MTD_Total_Amount_Received, 
	sum(loan_amount) as MTD_Total_Funded_Amount 
from Bank_Loan_Data
where month(issue_date) = 12 
group by loan_status

