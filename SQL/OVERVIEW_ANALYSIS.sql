-- ============================================================
--              BANK LOAN REPORT | OVERVIEW ANALYSIS
-- ============================================================



-- ============================================================
--                  MONTHLY LOAN ANALYSIS
-- ============================================================

SELECT
    EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')) AS month_number,

    TO_CHAR(
        TO_DATE(issue_date, 'DD-MM-YYYY'),
        'Month'
    ) AS month_name,

    COUNT(id) AS total_loan_applications,

    SUM(loan_amount) AS total_funded_amount,

    SUM(total_payment) AS total_amount_received

FROM bank_loan_data

GROUP BY
    EXTRACT(MONTH FROM TO_DATE(issue_date, 'DD-MM-YYYY')),

    TO_CHAR(
        TO_DATE(issue_date, 'DD-MM-YYYY'),
        'Month'
    )

ORDER BY month_number;



-- ============================================================
--                  STATE-WISE LOAN ANALYSIS
-- ============================================================

SELECT
    address_state AS state,

    COUNT(id) AS total_loan_applications,

    SUM(loan_amount) AS total_funded_amount,

    SUM(total_payment) AS total_amount_received

FROM bank_loan_data

GROUP BY address_state

ORDER BY address_state;



-- ============================================================
--                     TERM ANALYSIS
-- ============================================================

SELECT
    term AS loan_term,

    COUNT(id) AS total_loan_applications,

    SUM(loan_amount) AS total_funded_amount,

    SUM(total_payment) AS total_amount_received

FROM bank_loan_data

GROUP BY term

ORDER BY term;



-- ============================================================
--                 EMPLOYEE LENGTH ANALYSIS
-- ============================================================

SELECT
    emp_length AS employee_length,

    COUNT(id) AS total_loan_applications,

    SUM(loan_amount) AS total_funded_amount,

    SUM(total_payment) AS total_amount_received

FROM bank_loan_data

GROUP BY emp_length

ORDER BY emp_length;



-- ============================================================
--                   LOAN PURPOSE ANALYSIS
-- ============================================================

SELECT
    purpose,

    COUNT(id) AS total_loan_applications,

    SUM(loan_amount) AS total_funded_amount,

    SUM(total_payment) AS total_amount_received

FROM bank_loan_data

GROUP BY purpose

ORDER BY purpose;



-- ============================================================
--                 HOME OWNERSHIP ANALYSIS
-- ============================================================

SELECT
    home_ownership,

    COUNT(id) AS total_loan_applications,

    SUM(loan_amount) AS total_funded_amount,

    SUM(total_payment) AS total_amount_received

FROM bank_loan_data

GROUP BY home_ownership

ORDER BY home_ownership;



-- ============================================================
--                GRADE A LOAN PURPOSE ANALYSIS
-- ============================================================

SELECT
    purpose,

    COUNT(id) AS total_loan_applications,

    SUM(loan_amount) AS total_funded_amount,

    SUM(total_payment) AS total_amount_received

FROM bank_loan_data

WHERE grade = 'A'

GROUP BY purpose

ORDER BY purpose;
