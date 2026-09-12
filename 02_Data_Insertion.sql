USE BankingDB;
GO

-- Insert Branches
INSERT INTO Branches(branch_code,branch_name,city)
VALUES
('BR001', 'Riyadh Branch', 'Riyadh'),
('BR002', 'Jeddah Branch', 'Jeddah'),
('BR003', 'Dammam Branch', 'Dammam');

SELECT * FROM Branches;


-- Insert Customers
INSERT INTO Customers(first_name,last_name,phone,email,status)
VALUES
('Lina', 'Mohammad', '0552307761', 'lina_m@gmail.com', 'Active'),
('Lulu', 'Saad', '0552345678', 'lulu.saad@gmail.com', 'Active'),
('Ibtisam', 'Ali', '0533456789', 'ibtisam.ali@gmail.com', 'Inactive');

SELECT * FROM Customers;

--Insert Accounts
INSERT INTO Accounts(account_number,customer_id,branch_id,account_type,balance,opened_date, status)
VALUES
('1000000001', 1, 1, 'Savings', 15000.00, '2026-01-15', 'Active'),
('1000000002', 2, 2, 'Current', 8500.00, '2026-02-10', 'Active'),
('1000000003', 3, 3, 'Savings', 12000.00, '2026-03-05', 'Inactive');

SELECT * FROM Accounts;

--Insert Emplooyes
INSERT INTO Employees
    (branch_id, first_name, last_name, job_title, salary, status)
VALUES
    (1, 'Faisal', 'Nasser', 'Branch Manager', 15000.00, 'Active'),
    (2, 'Dana', 'Khalid', 'Financial Analyst', 10000.00, 'Active'),
    (3, 'Yara', 'Ahmad', 'Customer Service', 8500.00, 'Active');

    SELECT * FROM Employees;


  --Insert Transactions
  INSERT INTO Transactions(account_id,transaction_type,amount, transaction_date,status,reference_number)
   VALUES
   (1, 'Deposit',     3000.00, '2026-09-10 09:30:00', 'Completed', 'TRN-001'),
   (1, 'Withdrawal',  1000.00, '2026-09-11 14:15:00', 'Completed', 'TRN-002'),
   (2, 'Deposit',     2500.00, '2026-09-10 11:00:00', 'Completed', 'TRN-003'),
   (2, 'Withdrawal',   500.00, '2026-09-12 16:45:00', 'Pending',   'TRN-004'),
   (3, 'Deposit',     1500.00, '2026-05-20 10:20:00', 'Failed',    'TRN-005');
   
   SELECT * FROM Transactions;

   --Insert Transfers
   INSERT INTO Transfers(from_account_id,to_account_id,amount,transfer_date,status,reference_number)
   VALUES
   (1, 2, 1200.00, '2026-09-10 12:30:00', 'Completed', 'TRF-001'),
   (2, 1,  750.00, '2026-09-11 15:45:00', 'Completed', 'TRF-002'),
   (3, 1,  600.00, '2026-05-15 11:20:00', 'Completed', 'TRF-003'),
   (1, 2,  500.00, '2026-09-12 10:20:00', 'Pending',   'TRF-004'),
   (2, 1,  300.00, '2026-09-12 17:00:00', 'Failed',    'TRF-005');

   SELECT * FROM Transfers;