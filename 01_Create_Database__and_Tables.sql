-- Create the banking database

CREATE DATABASE BankingDB;

GO

USE BankingDB;
GO

-- Stores bank branch information

CREATE TABLE Branches(
branch_id INT IDENTITY (1,1) PRIMARY KEY,
branch_code VARCHAR(20) NOT NULL UNIQUE,
branch_name VARCHAR (100) NOT NULL,
city VARCHAR(50) NOT NULL
);
GO


-- Stores customer information
CREATE TABLE Customers(
customer_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,

 -- Restricts customer status to predefined values
status VARCHAR(20) NOT NULL CHECK (status IN('Active', 'Inactive'))
);
GO

-- Employees Table

CREATE TABLE Employees(
employee_id INT IDENTITY (1,1) PRIMARY KEY,
branch_id INT NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
job_title VARCHAR(50) NOT NULL,
salary DECIMAL (10,2) NOT NULL,

   -- Allows only Active or Inactive status
status VARCHAR(20) NOT NULL CHECK (status IN('Active', 'Inactive')),

  -- Links each employee to a branch
FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);
GO

-- Accounts Table
CREATE TABLE Accounts(
account_id INT IDENTITY (1,1) PRIMARY KEY,
account_number VARCHAR(20) NOT NULL UNIQUE,
customer_id INT NOT NULL,
branch_id INT NOT NULL,

 -- Allows only Savings or Current account types
account_type VARCHAR(20) NOT NULL CHECK (account_type IN('Savings','Current')),

  -- Prevents negative balances
balance DECIMAL(10,2) NOT NULL CHECK (balance >= 0),

opened_date date NOT NULL,

  -- Allows only Active or Inactive status
status VARCHAR(20) NOT NULL CHECK (status IN('Active', 'Inactive')),

  -- Links each account to a customer and a branch
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (branch_id) REFERENCES Branches(branch_id) 
);
GO


-- Transactions Table
CREATE TABLE Transactions (
transaction_id INT IDENTITY (1,1) PRIMARY KEY,
account_id INT NOT NULL,

 -- Allows only Deposit or Withdrawal transaction types
transaction_type VARCHAR(20) NOT NULL  CHECK (transaction_type IN ('Deposit', 'Withdrawal')),

 -- Ensures the transaction amount is greater than zero
amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),

transaction_date DATETIME NOT NULL,

  -- Allows only predefined transaction statuses
status VARCHAR(20) NOT NULL CHECK (status IN ('Completed', 'Pending', 'Failed')),

reference_number VARCHAR(20) NOT NULL UNIQUE,

  -- Links each transaction to an account
FOREIGN KEY (account_id) REFERENCES Accounts (account_id)
);
GO

-- Transfer Table
CREATE TABLE Transfers (
    transfer_id INT IDENTITY(1,1) PRIMARY KEY,
    from_account_id INT NOT NULL,
    to_account_id INT NOT NULL,

     -- Ensures the transfer amount is greater than zero
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),

    transfer_date DATETIME NOT NULL,

    -- Allows only Completed, Pending, or Failed status
    status VARCHAR(20) NOT NULL 
        CHECK (status IN ('Completed', 'Pending', 'Failed')),


    reference_number VARCHAR(20) NOT NULL UNIQUE,

      -- Links the transfer to the source and destination accounts
    FOREIGN KEY (from_account_id) REFERENCES Accounts(account_id),
    FOREIGN KEY (to_account_id) REFERENCES Accounts(account_id),

       -- Prevents transferring to the same account
    CHECK (from_account_id <> to_account_id)
);
GO
