use finance;
SELECT * FROM finance.loan_data;

SET GLOBAL local_infile=1;
SHOW VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'F:/Harshali Singh/DA and DS/Data Analyst/DA Project/Project 2 - Finance (4 PM - 5 PM)/Finance Final.csv'
INTO TABLE loan_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, member_id, loan_amnt, funded_amnt, funded_amnt_inv, term, int_rate, installment, grade, sub_grade, emp_title, emp_length, home_ownership, annual_inc, verification_status, issue_d, loan_status, pymnt_plan, description, purpose, title, zip_code, addr_state, dti, delinq_2yrs, earliest_cr_line, inq_last_6mths, @mths_since_last_delinq, @mths_since_last_record, open_acc, pub_rec, revol_bal, revol_util, total_acc, initial_list_status, out_prncp, out_prncp_inv, total_pymnt, total_pymnt_inv, total_rec_prncp, total_rec_int, total_rec_late_fee, recoveries, collection_recovery_fee, last_pymnt_d, last_pymnt_amnt, next_pymnt_d, last_credit_pull_d)
SET mths_since_last_delinq = NULLIF(@mths_since_last_delinq, 'NA'),
    mths_since_last_record = NULLIF(@mths_since_last_record, 'NA');
    
LOAD DATA INFILE 'F:/Harshali Singh/DA and DS/Data Analyst/DA Project/Project 2 - Finance (4 PM - 5 PM)/Finance Final.csv'
INTO TABLE loan_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id, member_id, loan_amnt, funded_amnt, funded_amnt_inv, term, int_rate, installment, grade, sub_grade, emp_title, emp_length, home_ownership, annual_inc, verification_status, issue_d, loan_status, pymnt_plan, description, purpose, title, zip_code, addr_state, dti, delinq_2yrs, earliest_cr_line, inq_last_6mths, @mths_since_last_delinq, @mths_since_last_record, open_acc, pub_rec, revol_bal, revol_util, total_acc, initial_list_status, out_prncp, out_prncp_inv, total_pymnt, total_pymnt_inv, total_rec_prncp, total_rec_int, total_rec_late_fee, recoveries, collection_recovery_fee, last_pymnt_d, last_pymnt_amnt, next_pymnt_d, last_credit_pull_d)
SET mths_since_last_delinq = NULLIF(@mths_since_last_delinq, 'NA');

SELECT * FROM finance.loan_data;

-- 1) Year wise loan amount Stats

SELECT
    YEAR(issue_d) AS loan_year,
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_loan_amount,
    AVG(loan_amnt) AS average_loan_amount,
    MIN(loan_amnt) AS min_loan_amount,
    MAX(loan_amnt) AS max_loan_amount
FROM loan_data GROUP BY loan_year ORDER BY loan_year;

-- 2) Grade and sub grade wise revol_bal

SELECT
    grade,
    sub_grade,
    COUNT(*) AS total_loans,
    AVG(revol_bal) AS average_revol_bal,
    MIN(revol_bal) AS min_revol_bal,
    MAX(revol_bal) AS max_revol_bal
FROM loan_data GROUP BY grade, sub_grade ORDER By grade, sub_grade;

-- 3) Total Payment for Verified Status Vs Total Payment for Non Verified Status

SELECT
    verification_status,
    SUM(total_pymnt) AS total_payment
FROM loan_data GROUP BY verification_status;

-- 4)State wise and last_credit_pull_d wise loan status

SELECT
    addr_state,
    last_credit_pull_d,
    loan_status
FROM  loan_data GROUP BY  addr_state, last_credit_pull_d, loan_status;

-- 5) Home ownership Vs last payment date stats

SELECT
    home_ownership,
    COUNT(*) AS total_loans,
    MAX(last_pymnt_d) AS last_payment_date,
    MIN(last_pymnt_d) AS earliest_payment_date
FROM loan_data GROUP BY home_ownership;

