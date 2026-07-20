-- 1. Общий баланс всех клиентов банка

SELECT
    SUM(balance) AS total_bank_balance
FROM accounts;



-- 2. Общий баланс каждого клиента

SELECT
    c.first_name,
    c.last_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY
    c.first_name,
    c.last_name
ORDER BY total_balance DESC;



-- 3. ТОП-3 клиента по количеству денег на счетах

SELECT
    c.first_name,
    c.last_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY
    c.first_name,
    c.last_name
ORDER BY total_balance DESC
LIMIT 3;



-- 4. Количество операций каждого клиента

SELECT
    c.first_name,
    c.last_name,
    COUNT(t.transaction_id) AS transactions_count
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN transactions t
ON a.account_id = t.account_id
GROUP BY
    c.first_name,
    c.last_name
ORDER BY transactions_count DESC;



-- 5. Общая сумма операций по типу

SELECT
    transaction_type,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type;



-- 6. Использование CASE для классификации клиентов

SELECT
    c.first_name,
    c.last_name,
    SUM(a.balance) AS balance,

    CASE
        WHEN SUM(a.balance) >= 10000
            THEN 'VIP Client'

        WHEN SUM(a.balance) >= 5000
            THEN 'Regular Client'

        ELSE 'Basic Client'
    END AS client_category

FROM customers c

JOIN accounts a
ON c.customer_id = a.customer_id

GROUP BY
    c.first_name,
    c.last_name;



-- 7. Количество активных кредитов

SELECT
    COUNT(*) AS active_loans
FROM loans
WHERE status = 'Active';



-- 8. Средняя сумма кредита по статусам

SELECT
    status,
    AVG(amount) AS average_amount
FROM loans
GROUP BY status;



-- 9. Рейтинг клиентов по балансу (оконная функция)

SELECT

    c.first_name,
    c.last_name,
    SUM(a.balance) AS balance,

    RANK() OVER(
        ORDER BY SUM(a.balance) DESC
    ) AS customer_rank

FROM customers c

JOIN accounts a
ON c.customer_id = a.customer_id

GROUP BY
    c.first_name,
    c.last_name;



-- 10. Накопительная сумма операций

SELECT

    account_id,
    transaction_date,
    amount,

    SUM(amount) OVER(
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS running_total

FROM transactions;