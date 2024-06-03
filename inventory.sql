/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
Requirements:
- SQL Server 2022 is installed and running
- database 'Inventory' already exists.
Details:
- Sets the default database to 'Inventory'.
- Creates a 'categories' table and related 'products' table if they do not already exist.
- Remove all rows from the tables (in case they already existed).
- Populates the 'Categories' table with sample data.
- Populates the 'Products' table with sample data.
- Creates stored procedures to get all categories.
- Creates a stored procedure to get all products in a specific category.
- Creates a stored procudure to get all products in a specific price range sorted by price in ascending order.
Errors:
- if the database 'Inventory' does not exist, the script will print an error message and exit.
*/

USE Inventory;

-- Create the 'Categories' table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'Categories' AND type = 'U')
BEGIN
    CREATE TABLE Categories
    (
        CategoryID INT PRIMARY KEY,
        CategoryName NVARCHAR(50)
    );
END;

-- Create the 'Products' table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'Products' AND type = 'U')
BEGIN
    CREATE TABLE Products
    (
        ProductID INT PRIMARY KEY,
        ProductName NVARCHAR(50),
        CategoryID INT,
        Price DECIMAL(10, 2),
        -- Add a clumn for created date
        CreatedDate DATETIME,
        -- Add a column for updated date time
        UpdatedDate DATETIME,
        FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
    );
END;

-- Remove all rows from the 'products' and 'categories' tables
TRUNCATE TABLE Products;
TRUNCATE TABLE Categories;

-- Populate the 'Categories' table with sample data
INSERT INTO Categories (CategoryID, CategoryName) VALUES (1, 'Electronics');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (2, 'Clothing');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (3, 'Books');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (4, 'Toys');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (5, 'Furniture');

-- Populate the 'Products' table with sample data
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, CreatedDate, UpdatedDate) VALUES (1, 'Laptop', 1, 899.99, GETDATE(), GETDATE());
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, CreatedDate, UpdatedDate) VALUES (2, 'T-shirt', 2, 19.99, GETDATE(), GETDATE());
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, CreatedDate, UpdatedDate) VALUES (3, 'Book', 3, 9.99, GETDATE(), GETDATE());
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, CreatedDate, UpdatedDate) VALUES (4, 'Action Figure', 4, 14.99, GETDATE(), GETDATE());
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, CreatedDate, UpdatedDate) VALUES (5, 'Sofa', 5, 499.99, GETDATE(), GETDATE());

-- Create a stored procedure to get all categories
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'GetAllCategories' AND type = 'P')
BEGIN
    EXEC('CREATE PROCEDURE GetAllCategories AS SELECT * FROM Categories;');
END;

-- Create a stored procedure to get all products in a specific category
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'GetProductsByCategory' AND type = 'P')
BEGIN
    EXEC('CREATE PROCEDURE GetProductsByCategory @CategoryID INT AS SELECT * FROM Products WHERE CategoryID = @Category






