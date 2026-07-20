-- Клиенты

INSERT INTO customers 
(first_name, last_name, birth_date, phone, email)
VALUES
('Sergey', 'Guselnikov', '1995-04-15', '+358401111111', 'sergey@mail.com'),
('Alex', 'Petrov', '1990-08-20', '+358402222222', 'alex@mail.com'),
('Maria', 'Ivanova', '1988-12-10', '+358403333333', 'maria@mail.com'),
('John', 'Smith', '1992-03-25', '+358404444444', 'john@mail.com'),
('Anna', 'Brown', '1997-07-05', '+358405555555', 'anna@mail.com');


-- Отделения банка

INSERT INTO branches
(branch_name, address)
VALUES
('Central Bank', 'Helsinki Center'),
('North Branch', 'Espoo Street'),
('South Branch', 'Vantaa Avenue');


-- Сотрудники

INSERT INTO employees
(branch_id, first_name, last_name, position)
VALUES
(1, 'Michael', 'Johnson', 'Manager'),
(1, 'Kate', 'Wilson', 'Consultant'),
(2, 'David', 'Taylor', 'Manager'),
(3, 'Emma', 'Davis', 'Consultant');


-- Счета клиентов

INSERT INTO accounts
(customer_id, account_number, account_type, balance)
VALUES
(1, 'FI100001', 'Checking', 5000.00),
(1, 'FI100002', 'Savings', 12000.00),
(2, 'FI100003', 'Checking', 3000.00),
(3, 'FI100004', 'Savings', 15000.00),
(4, 'FI100005', 'Checking', 7000.00),
(5, 'FI100006', 'Savings', 9000.00);


-- Банковские карты

INSERT INTO cards
(account_id, card_number, card_type, expiration_date)
VALUES
(1, '4444333322221111', 'Debit', '2028-12-31'),
(2, '5555444433332222', 'Debit', '2029-06-30'),
(3, '6666555544443333', 'Credit', '2027-11-30'),
(4, '7777666655554444', 'Debit', '2028-05-31');


-- Транзакции

INSERT INTO transactions
(account_id, transaction_type, amount)
VALUES
(1, 'Deposit', 2000.00),
(1, 'Payment', -500.00),
(2, 'Deposit', 5000.00),
(3, 'Payment', -300.00),
(4, 'Deposit', 7000.00),
(5, 'Payment', -1000.00);


-- Кредиты

INSERT INTO loans
(customer_id, amount, interest_rate, status)
VALUES
(2, 20000.00, 5.5, 'Active'),
(3, 15000.00, 4.8, 'Active'),
(5, 10000.00, 6.2, 'Closed');


-- Платежи по кредитам

INSERT INTO loan_payments
(loan_id, payment_date, amount)
VALUES
(1, '2026-01-15', 500.00),
(1, '2026-02-15', 500.00),
(2, '2026-01-20', 400.00),
(3, '2025-12-20', 1000.00);