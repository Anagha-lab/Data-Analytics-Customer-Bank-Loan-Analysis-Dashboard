use finance;
CREATE TABLE loan_data (
    id INT NOT NULL,
    member_id INT,
    loan_amnt INT,
    funded_amnt INT,
    funded_amnt_inv DECIMAL(15, 6),
    term VARCHAR(20),
    int_rate VARCHAR(10),
    installment DECIMAL(15, 2),
    grade VARCHAR(1),
    sub_grade VARCHAR(2),
    emp_title VARCHAR(255),
    emp_length VARCHAR(50),
    home_ownership VARCHAR(50),
    annual_inc DECIMAL(15, 2),
    verification_status VARCHAR(50),
    issue_d VARCHAR(20),
    loan_status VARCHAR(50),
    pymnt_plan VARCHAR(1),
    description TEXT,
    purpose VARCHAR(50),
    title VARCHAR(255),
    zip_code VARCHAR(10),
    addr_state VARCHAR(2),
    dti DECIMAL(15, 2),
    delinq_2yrs INT,
    earliest_cr_line VARCHAR(20),
    inq_last_6mths INT,
    mths_since_last_delinq INT,
    mths_since_last_record INT,
    open_acc INT,
    pub_rec INT,
    revol_bal INT,
    revol_util VARCHAR(10),
    total_acc INT,
    initial_list_status VARCHAR(1),
    out_prncp DECIMAL(15, 2),
    out_prncp_inv DECIMAL(15, 2),
    total_pymnt DECIMAL(15, 2),
    total_pymnt_inv DECIMAL(15, 2),
    total_rec_prncp DECIMAL(15, 2),
    total_rec_int DECIMAL(15, 2),
    total_rec_late_fee DECIMAL(15, 2),
    recoveries DECIMAL(15, 2),
    collection_recovery_fee DECIMAL(15, 2),
    last_pymnt_d VARCHAR(20),
    last_pymnt_amnt DECIMAL(15, 2),
    next_pymnt_d VARCHAR(20),
    last_credit_pull_d VARCHAR(20),
    PRIMARY KEY (id)
);