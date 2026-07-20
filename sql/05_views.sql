-- 1. Информация о клиентах и их счетах

CREATE VIEW customer_accounts_view AS

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    a.account_number,
    a.account_type,
    a.balance

FROM customers c

JOIN accounts a
ON c.customer_id = a.customer_id;



-- 2. Общий баланс каждого клиента

CREATE VIEW customer_balance_view AS

SELECT

    c.customer_id,
    c.first_name,
    c.last_name,

    SUM(a.balance) AS total_balance

FROM customers c

JOIN accounts a
ON c.customer_id = a.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;



-- 3. Активные кредиты клиентов

CREATE VIEW active_loans_view AS

SELECT

    c.first_name,
    c.last_name,

    l.amount,
    l.interest_rate,
    l.status

FROM customers c

JOIN loans l

ON c.customer_id = l.customer_id

WHERE l.status = 'Active';



-- 4. История операций клиентов

CREATE VIEW customer_transactions_view AS

SELECT

    c.first_name,
    c.last_name,

    a.account_number,

    t.transaction_type,
    t.amount,
    t.transaction_date


FROM customers c

JOIN accounts a

ON c.customer_id = a.customer_id


JOIN transactions t

ON a.account_id = t.account_id;