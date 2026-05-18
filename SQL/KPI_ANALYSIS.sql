-- ============================================================
--                BANK LOAN REPORT | KPI ANALYSIS
-- ============================================================



-- ============================================================
--                     TOTAL LOAN APPLICATIONS
-- ============================================================

SELECT COUNT(id) AS total_applications
FROM bank_loan_data;


-- MTD LOAN APPLICATIONS

SELECT COUNT(id) AS mtd_loan_applications
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 12
AND EXTRACT(YEAR FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 2021;


-- PMTD LOAN APPLICATIONS

SELECT COUNT(id) AS pmtd_loan_applications
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 11;



-- ============================================================
--                     TOTAL FUNDED AMOUNT
-- ============================================================

SELECT SUM(loan_amount) AS total_funded_amount
FROM bank_loan_data;


-- MTD TOTAL FUNDED AMOUNT

SELECT SUM(loan_amount) AS mtd_total_funded_amount
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 12;


-- PMTD TOTAL FUNDED AMOUNT

SELECT SUM(loan_amount) AS pmtd_total_funded_amount
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 11;



-- ============================================================
--                     TOTAL AMOUNT RECEIVED
-- ============================================================

SELECT SUM(total_payment) AS total_amount_received
FROM bank_loan_data;


-- MTD TOTAL AMOUNT RECEIVED

SELECT SUM(total_payment) AS mtd_total_amount_received
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 12;


-- PMTD TOTAL AMOUNT RECEIVED

SELECT SUM(total_payment) AS pmtd_total_amount_received
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 11;



-- ============================================================
--                     AVERAGE INTEREST RATE
-- ============================================================

SELECT AVG(int_rate) * 100 AS avg_interest_rate
FROM bank_loan_data;


-- MTD AVERAGE INTEREST RATE

SELECT AVG(int_rate) * 100 AS mtd_avg_interest_rate
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 12;


-- PMTD AVERAGE INTEREST RATE

SELECT AVG(int_rate) * 100 AS pmtd_avg_interest_rate
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 11;



-- ============================================================
--                     AVERAGE DTI RATIO
-- ============================================================

SELECT AVG(dti) * 100 AS avg_dti
FROM bank_loan_data;


-- MTD AVERAGE DTI

SELECT AVG(dti) * 100 AS mtd_avg_dti
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 12;


-- PMTD AVERAGE DTI

SELECT AVG(dti) * 100 AS pmtd_avg_dti
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 11;



-- ============================================================
--                     GOOD LOAN ANALYSIS
-- ============================================================

-- GOOD LOAN PERCENTAGE

SELECT
(
    COUNT(
        CASE
            WHEN loan_status = 'Fully Paid'
            OR loan_status = 'Current'
            THEN id
        END
    ) * 100.0
) / COUNT(id) AS good_loan_percentage
FROM bank_loan_data;


-- GOOD LOAN APPLICATIONS

SELECT COUNT(id) AS good_loan_applications
FROM bank_loan_data
WHERE loan_status = 'Fully Paid'
OR loan_status = 'Current';


-- GOOD LOAN FUNDED AMOUNT

SELECT SUM(loan_amount) AS good_loan_funded_amount
FROM bank_loan_data
WHERE loan_status = 'Fully Paid'
OR loan_status = 'Current';


-- GOOD LOAN AMOUNT RECEIVED

SELECT SUM(total_payment) AS good_loan_amount_received
FROM bank_loan_data
WHERE loan_status = 'Fully Paid'
OR loan_status = 'Current';



-- ============================================================
--                     BAD LOAN ANALYSIS
-- ============================================================

-- BAD LOAN PERCENTAGE

SELECT
(
    COUNT(
        CASE
            WHEN loan_status = 'Charged Off'
            THEN id
        END
    ) * 100.0
) / COUNT(id) AS bad_loan_percentage
FROM bank_loan_data;


-- BAD LOAN APPLICATIONS

SELECT COUNT(id) AS bad_loan_applications
FROM bank_loan_data
WHERE loan_status = 'Charged Off';


-- BAD LOAN FUNDED AMOUNT

SELECT SUM(loan_amount) AS bad_loan_funded_amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';


-- BAD LOAN AMOUNT RECEIVED

SELECT SUM(total_payment) AS bad_loan_amount_received
FROM bank_loan_data
WHERE loan_status = 'Charged Off';



-- ============================================================
--                     LOAN STATUS ANALYSIS
-- ============================================================

SELECT
    loan_status,
    COUNT(id) AS loan_count,
    SUM(total_payment) AS total_amount_received,
    SUM(loan_amount) AS total_funded_amount,
    AVG(int_rate * 100) AS interest_rate,
    AVG(dti * 100) AS dti
FROM bank_loan_data
GROUP BY loan_status;


-- MTD LOAN STATUS ANALYSIS

SELECT
    loan_status,
    SUM(total_payment) AS mtd_total_amount_received,
    SUM(loan_amount) AS mtd_total_funded_amount
FROM bank_loan_data
WHERE EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) = 12
GROUP BY loan_status;
