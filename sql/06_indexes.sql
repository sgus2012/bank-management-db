-- Индекс для быстрого поиска клиентов по email

CREATE INDEX idx_customers_email
ON customers(email);



-- Индекс для ускорения поиска счетов клиента

CREATE INDEX idx_accounts_customer_id
ON accounts(customer_id);



-- Индекс для быстрого поиска операций по счету

CREATE INDEX idx_transactions_account_id
ON transactions(account_id);



-- Индекс для сортировки операций по дате

CREATE INDEX idx_transactions_date
ON transactions(transaction_date);



-- Индекс для поиска кредитов клиента

CREATE INDEX idx_loans_customer_id
ON loans(customer_id);



-- Индекс для поиска активных кредитов

CREATE INDEX idx_loans_status
ON loans(status);