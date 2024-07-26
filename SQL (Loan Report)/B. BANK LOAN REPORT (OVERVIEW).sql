-- B. BANK LOAN REPORT (OVERVIEW)

--MONTH
select 
	month(issue_date) as Month_Munber, 
	datename(month, issue_date) as Month_name, 
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from bank_loan_data
group by month(issue_date), datename(month, issue_date)
order by month(issue_date)

--STATE
select 
	address_state as State, 
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from Bank_Loan_Data
group by address_state
order by address_state

--TERM
select 
	term as Term, 
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) AS Total_Amount_Received
from Bank_Loan_Data
GROUP BY term
ORDER BY term

--EMPLOYEE LENGTH
select 
	emp_length as Employee_Length, 
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from Bank_Loan_Data
group by emp_length
order by emp_length

--PURPOSE
select 
	purpose as PURPOSE, 
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from Bank_Loan_Data
group by purpose
order by purpose

--HOME OWNERSHIP
select 
	home_ownership as Home_Ownership, 
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from Bank_Loan_Data
group by home_ownership
order by home_ownership


select 
	purpose as PURPOSE, 
	count(id) as Total_Loan_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Amount_Received
from Bank_Loan_Data
where grade = 'A'
group by purpose
order by purpose
