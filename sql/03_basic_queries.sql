-- 1. Получить всех клиентов банка

SELECT *
FROM customers;


-- 2. Получить имя, фамилию и email клиентов

SELECT
    first_name,
    last_name,
    email
FROM customers;


-- 3. Найти клиентов, зарегистрированных после 2026 года

SELECT *
FROM customers
WHERE created_at >= '2026-01-01';


-- 4. Получить клиентов и их банковские счета

SELECT
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;


-- 5. Получить все счета с балансом больше 5000

SELECT
    account_number,
    balance
FROM accounts
WHERE balance > 5000
ORDER BY balance DESC;


-- 6. Найти активные кредиты клиентов

SELECT
    c.first_name,
    c.last_name,
    l.amount,
    l.status
FROM customers c
JOIN loans l
ON c.customer_id = l.customer_id
WHERE l.status = 'Active';


-- 7. Получить список операций по счетам

SELECT
    a.account_number,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM accounts a
JOIN transactions t
ON a.account_id = t.account_id
ORDER BY t.transaction_date DESC;


-- 8. Посчитать количество счетов у каждого клиента

SELECT
    c.first_name,
    c.last_name,
    COUNT(a.account_id) AS accounts_count
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY
    c.first_name,
    c.last_name;


-- 9. Найти средний размер кредита

SELECT
    AVG(amount) AS average_loan_amount
FROM loans;


-- 10. Найти максимальный кредит

SELECT
    MAX(amount) AS max_loan
FROM loans;