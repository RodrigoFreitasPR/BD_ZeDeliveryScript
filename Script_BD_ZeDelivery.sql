--criando tabela usuário
CREATE TABLE [User]
(
[Id_User] INTEGER NOT NULL,
[LOGIN] VARCHAR(160) NOT NULL,
[PASSWORD] VARCHAR(160) NOT NULL,
[EMAIL] VARCHAR(160) NOT NULL,
[NAME] VARCHAR(160) NOT NULL,
[CPF] VARCHAR(160) NOT NULL,
[ADDRESS] VARCHAR(160) NOT NULL,
[PHONE] VARCHAR(160) NOT NULL,
CONSTRAINT [PK_USER] PRIMARY KEY ([Id_User])
);
CREATE UNIQUE INDEX [IPK_User] ON [User]([Id_User]);
--criando tabela produto
CREATE TABLE [Product]
(
[Id_Product] INTEGER NOT NULL,
[ProductCode] VARCHAR(160) NOT NULL,
[ProductName] VARCHAR(160) NOT NULL,
[ProductValue] DOUBLE(4,2) NOT NULL,
[STOCKAMMOUNT] INT(1000) NOT NULL,
CONSTRAINT [PK_Id_Product] PRIMARY KEY ([Id_Product])
);
CREATE UNIQUE INDEX [IPK_Product] ON [Product]([Id_Product]);
--criando tabela status 
CREATE TABLE [Status]
(
[Id_Status] INTEGER NOT NULL,
[ShoppingCartId] VARCHAR(160) NOT NULL,
[CurrentStatus] VARCHAR(160) NOT NULL,
CONSTRAINT [PK_Id_Status] PRIMARY KEY ([Id_Status])
);
CREATE UNIQUE INDEX [IPK_Status] ON [Status]([Id_Status]);
--criando tabela loja
CREATE TABLE [Store]
(
[Id_Store] INTEGER NOT NULL,
[StoreCode] VARCHAR(160) NOT NULL,
[StoreName] VARCHAR(160) NOT NULL,
[StoreAddress] VARCHAR(160) NOT NULL,
[StorePhone] VARCHAR(160) NOT NULL,
CONSTRAINT [PK_Id_Store] PRIMARY KEY ([Id_Store])
);
CREATE UNIQUE INDEX [IPK_Store] ON [Store]([Id_Store]);
-- criando tabela pedido
CREATE TABLE [Order]
(
[Id_Order] INTEGER NOT NULL,
[Id_User] VARCHAR(160) NOT NULL,
[Id_Product] VARCHAR(160) NOT NULL,
[ProductQuantity] INT(100) NOT NULL,
[OrderQueue] VARCHAR(160) NOT NULL,
[CreatedAt] DATETIME NOT NULL, 
[OrderTotalValue] DOUBLE(4,2) NOT NULL,
CONSTRAINT [PK_Id_Order] PRIMARY KEY ([Id_Order])
CONSTRAINT [FK_User] FOREIGN KEY ([Id_User]) REFERENCES User(Id_User),
CONSTRAINT [FK_Product] FOREIGN KEY ([Id_Product]) REFERENCES Product(Id_Product)
);
CREATE UNIQUE INDEX [IPK_Order] ON [Order]([Id_Order]);
--criando tabela fornecedor
CREATE TABLE [Supplier]
(
[Id_Supplier] INTEGER NOT NULL,
[Id_Product] VARCHAR(160) NOT NULL,
[Id_User] VARCHAR(160) NOT NULL,
[SupplierCode] VARCHAR(160) NOT NULL,
[SupplierStoreCode] VARCHAR(160) NOT NULL,
[SupplierName] VARCHAR (160) NOT NULL, 
CONSTRAINT [PK_Id_Supplier] PRIMARY KEY ([Id_Supplier])
CONSTRAINT [FK_Product] FOREIGN KEY ([Id_Product]) REFERENCES Product(Id_Product),
CONSTRAINT [FK_User] FOREIGN KEY ([Id_User]) REFERENCES User(Id_User)
);
CREATE UNIQUE INDEX [IPK_Supplier] ON [Supplier]([Id_Supplier]);
--criando tabela relatório
CREATE TABLE [Report]
(
    [Id_Report] INTEGER NOT NULL,
    [Id_Status] VARCHAR(160) NOT NULL,
    [Id_Store] VARCHAR(160) NOT NULL,
    [Id_Supplier] VARCHAR(160) NOT NULL,
    [Id_User] VARCHAR(160) NOT NULL,
    [TotalValueReport] DOUBLE(10, 2) NOT NULL,
    [ReportDate] DATETIME NOT NULL,
    CONSTRAINT [PK_Id_Report] PRIMARY KEY ([Id_Report]),
    CONSTRAINT [FK_Store] FOREIGN KEY ([Id_Store]) REFERENCES Store(Id_Store),
    CONSTRAINT [FK_Status] FOREIGN KEY ([Id_Status]) REFERENCES Status(Id_Status),
    CONSTRAINT [FK_Supplier] FOREIGN KEY ([Id_Supplier]) REFERENCES Supplier(Id_Supplier),
    CONSTRAINT [FK_User] FOREIGN KEY ([Id_User]) REFERENCES User(Id_User)
);

CREATE UNIQUE INDEX [IPK_Report] ON [Report]([Id_Report]);
--criando tabela carrinho de compras 
CREATE TABLE [ShoppingCart]
(
    [Id_ShoppingCart] INTEGER NOT NULL,
    [Id_Order] VARCHAR(160) NOT NULL,
    [TotalValue] DOUBLE(4,2) NOT NULL,
    CONSTRAINT [PK_Id_ShoppingCart] PRIMARY KEY ([Id_ShoppingCart]),
    CONSTRAINT [FK_Order] FOREIGN KEY ([Id_Order]) REFERENCES [Order]([Id_Order])
);

CREATE UNIQUE INDEX [IPK_ShoppingCart] ON [ShoppingCart]([Id_ShoppingCart]);
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- Inserindo um registro na tabela USUARIO
INSERT INTO User(Id_user,LOGIN,PASSWORD,EMAIL,NAME, CPF, ADDRESS, PHONE )
VALUES (1,'JenniferRF', 'Jennifer112','Jennifer123@gmail.com', 'Jennifer','11009922293', 'Rua LD 123','988932349' );
-- Inserindo um registro na tabela USUARIO
INSERT INTO User(Id_user,LOGIN,PASSWORD,EMAIL,NAME, CPF, ADDRESS, PHONE )
VALUES (2, 'JOYCEZINHA', 'Joyce332','Joycezinha123@gmail.com', 'Joyce', '12344554234','Rua DS 234', '998566542');
--Inserindo um registro na tabela USUARIO
INSERT INTO User(Id_user,LOGIN,PASSWORD,EMAIL,NAME, CPF, ADDRESS, PHONE )
VALUES (3, 'Pedrofr_2', 'PedroFreitas21', 'Pedrin22@gmail.com','Pedro','12336433967','Rua 4, 332', '9987553428' );
-- Inserindo um registro na tabela USUARIO
INSERT INTO User(Id_user,LOGIN,PASSWORD,EMAIL,NAME, CPF, ADDRESS, PHONE )
VALUES (4, 'Julinho123','Juliocasado120','Julinho1@gmail.com','Julio','34554368779','Rua tchurusbango 34','955438539' );
-------------------------------------------------------------------------
--Inserindo um registro na tabela PRODUTO
INSERT INTO Product(Id_Product,ProductCode,ProductName,ProductValue,STOCKAMMOUNT)
VALUES (1,'123', 'Skol Beats','11,50', '5000');
INSERT INTO Product(Id_Product,ProductCode,ProductName,ProductValue,STOCKAMMOUNT)
VALUES (2,'321', 'Orloff','45,70', '326');
INSERT INTO Product(Id_Product,ProductCode,ProductName,ProductValue,STOCKAMMOUNT)
VALUES (3,'223', 'Jack Daniels','150,00', '479');
INSERT INTO Product(Id_Product,ProductCode,ProductName,ProductValue,STOCKAMMOUNT)
VALUES (4,'432', 'Coca Cola','8,50', '2600');
---------------------------------------------------------------------------
--Inserindo um registro na tabela CARRINHO DE COMPRAS
INSERT INTO ShoppingCart (Id_ShoppingCart,Id_Order,TotalValue)
VALUES (1,'1',11.50);
INSERT INTO ShoppingCart (Id_ShoppingCart,Id_Order,TotalValue)
VALUES (2,'2',14.20);
INSERT INTO ShoppingCart (Id_ShoppingCart,Id_Order,TotalValue)
VALUES (3,'3',10);
INSERT INTO ShoppingCart (Id_ShoppingCart,Id_Order,TotalValue)
VALUES (4,'4',22.52);
---------------------------------------------------------------------------
--Inserindo um registro na tabela STATUS
INSERT INTO Status (Id_Status,ShoppingCartId,CurrentStatus)
VALUES (1,'1','Pedido aprovado');
INSERT INTO Status (Id_Status,ShoppingCartId,CurrentStatus)
VALUES (2,'2','Pedido aguardando pagamento');
INSERT INTO Status (Id_Status,ShoppingCartId,CurrentStatus)
VALUES (3,'1','Pedido entregue');
INSERT INTO Status (Id_Status,ShoppingCartId,CurrentStatus)
VALUES (4,'1','Pedido aprovado');
--------------------------------------------------------------------------
--Inserindo um registro na tabela LOJA
INSERT INTO Store (Id_Store,StoreCode,StoreName,StoreAddress,StorePhone)
VALUES (1,'1','Gelato Drinks', 'Rua Tchurusbago 21','933234585');
INSERT INTO Store (Id_Store,StoreCode,StoreName,StoreAddress,StorePhone)
VALUES (2,'2','Espresso Distribuidora', 'Rua Candelaria 223','243256558');
INSERT INTO Store (Id_Store,StoreCode,StoreName,StoreAddress,StorePhone)
VALUES (3,'3','Benericks', 'Rua Ceara 1950','987654321');
INSERT INTO Store (Id_Store,StoreCode,StoreName,StoreAddress,StorePhone)
VALUES (4,'4','Sobber Bebidas LTDA', 'Rua Aparecida do Norte 443','98675384');
-------------------------------------------------------------------------------
--Inserindo um registro na tabela PEDIDO
INSERT INTO 'Order' (Id_Order,Id_User,Id_Product,ProductQuantity,OrderQueue,CreatedAt,OrderTotalValue)
VALUES (1,'1','1', 15,'2','23/10/23',172.50);
INSERT INTO 'Order' (Id_Order,Id_User,Id_Product,ProductQuantity,OrderQueue,CreatedAt,OrderTotalValue)
VALUES (2,'2','1', 12,'2','02/07/23',100);
INSERT INTO 'Order' (Id_Order,Id_User,Id_Product,ProductQuantity,OrderQueue,CreatedAt,OrderTotalValue)
VALUES (3,'3','1', 3,'2','03/02/23',70);
INSERT INTO 'Order' (Id_Order,Id_User,Id_Product,ProductQuantity,OrderQueue,CreatedAt,OrderTotalValue)
VALUES (4,'4','1', 43,'2','12/09/23',292.80);
-------------------------------------------------------------------------------
--Inserindo um registro na tabela Fornecedor
INSERT INTO Supplier (Id_Supplier,Id_Product,Id_User,SupplierCode,SupplierStoreCode, SupplierName)
VALUES (1,'11','1',2334,'1','Pedro Correia');
INSERT INTO Supplier (Id_Supplier,Id_Product,Id_User,SupplierCode,SupplierStoreCode, SupplierName)
VALUES (2,'22','2',331,'2','Fabricio Oliveira');
INSERT INTO Supplier (Id_Supplier,Id_Product,Id_User,SupplierCode,SupplierStoreCode, SupplierName)
VALUES (3,'33','3',111,'3','Ricardo Dutra');
INSERT INTO Supplier (Id_Supplier,Id_Product,Id_User,SupplierCode,SupplierStoreCode, SupplierName)
VALUES (4,'44','4',432,'4','Cristiano Ronaldo');
------------------------------------------------------------------------------
--Inserindo um registro na tabela RELATÓRIO
INSERT INTO Report (Id_Report,Id_Status,Id_Store,Id_Supplier,Id_User, TotalValueReport, ReportDate)
VALUES (1,'23','1','2','3',43.25,'21/10/23');
INSERT INTO Report (Id_Report,Id_Status,Id_Store,Id_Supplier,Id_User, TotalValueReport, ReportDate)
VALUES (2,'12','2','2','2',22.15,'12/02/23');
INSERT INTO Report (Id_Report,Id_Status,Id_Store,Id_Supplier,Id_User, TotalValueReport, ReportDate)
VALUES (3,'9','3','2','5',15.50,'20/04/23');
INSERT INTO Report (Id_Report,Id_Status,Id_Store,Id_Supplier,Id_User, TotalValueReport, ReportDate)
VALUES (4,'42','4','2','8',12.70,'25/06/23');
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Select de uma informação da tabela USUARIO
SELECT * FROM User WHERE Id_User LIKE '1';
SELECT * FROM User WHERE Id_User LIKE '2';
SELECT * FROM User WHERE Id_User LIKE '3';
SELECT * FROM User WHERE Id_User LIKE '4';
------------------------------------------------------------------------------
--Select de uma informação da tabela PRODUTO

SELECT * FROM Product WHERE Id_Product LIKE '1';
SELECT * FROM Product WHERE Id_Product LIKE '2';
SELECT * FROM Product WHERE Id_Product LIKE '3';
SELECT * FROM Product WHERE Id_Product LIKE '4';
-----------------------------------------------------------------------------
--Select de uma informação da tabela CARRINHO DE COMPRAS
SELECT * FROM ShoppingCart WHERE Id_ShoppingCart LIKE '1';
SELECT * FROM ShoppingCart WHERE Id_ShoppingCart LIKE '2';
SELECT * FROM ShoppingCart WHERE Id_ShoppingCart LIKE '3';
SELECT * FROM ShoppingCart WHERE Id_ShoppingCart LIKE '4';
------------------------------------------------------------------------------
--Select de uma informação da tabela STATUS
SELECT * FROM Status WHERE Id_Status LIKE '1';
SELECT * FROM Status WHERE Id_Status LIKE '2';
SELECT * FROM Status WHERE Id_Status LIKE '3';
SELECT * FROM Status WHERE Id_Status LIKE '4';
-------------------------------------------------------------------------------
--Select de uma informação da tabela LOJA
SELECT * FROM Store WHERE Id_Store LIKE '1';
SELECT * FROM Store WHERE Id_Store LIKE '2';
SELECT * FROM Store WHERE Id_Store LIKE '3';
SELECT * FROM Store WHERE Id_Store LIKE '4';
-------------------------------------------------------------------------------
--Select de uma informação da tabela PEDIDO

SELECT * FROM 'Order' WHERE Id_Order LIKE '1';
SELECT * FROM 'Order' WHERE Id_Order LIKE '2';
SELECT * FROM 'Order' WHERE Id_Order LIKE '3';
SELECT * FROM 'Order' WHERE Id_Order LIKE '4';
--------------------------------------------------------------------------------
--Select de uma informação da tabela FORNECEDOR
SELECT * FROM Supplier WHERE Id_Supplier LIKE '1';
SELECT * FROM Supplier WHERE Id_Supplier LIKE '2';
SELECT * FROM Supplier WHERE Id_Supplier LIKE '3';
SELECT * FROM Supplier WHERE Id_Supplier LIKE '4';
--------------------------------------------------------------------------------
--Select de uma informação da tabela RELATÓRIO
SELECT * FROM Report WHERE Id_Report LIKE '1';
SELECT * FROM Report WHERE Id_Report LIKE '2';
SELECT * FROM Report WHERE Id_Report LIKE '3';
SELECT * FROM Report WHERE Id_Report LIKE '4';
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--Update de uma informação da tabela USUÁRIO
UPDATE User SET NAME = 'Jennifer' WHERE Id_User = 1;
UPDATE User SET NAME = 'Joyce' WHERE Id_User = 2;
UPDATE User SET NAME = 'Pedro' WHERE Id_User = 3;
UPDATE User SET NAME = 'Julio' WHERE Id_User = 4;
------------------------------------------------------------------------------
--Update de uma informação da tabela PRODUTO
UPDATE Product SET ProductName = 'Skol Beats' WHERE Id_Product  = 1;
UPDATE Product SET ProductName = 'Orloff' WHERE Id_Product  = 2;
UPDATE Product SET ProductName = 'Jack Daniels' WHERE Id_Product  = 3;
UPDATE Product SET ProductName = 'Coca Cola' WHERE Id_Product  = 4;
------------------------------------------------------------------------------
--Update de uma informação da tabela CARRINHO DE COMPRAS
UPDATE ShoppingCart  SET Id_Order = '1' WHERE Id_ShoppingCart  = 1;
UPDATE ShoppingCart  SET Id_Order = '2' WHERE Id_ShoppingCart  = 2;
UPDATE ShoppingCart  SET Id_Order = '3' WHERE Id_ShoppingCart  = 3;
UPDATE ShoppingCart  SET Id_Order = '4' WHERE Id_ShoppingCart  = 4;
------------------------------------------------------------------------------
--Update de uma informação da tabela STATUS
UPDATE Status  SET Id_Status = '1' WHERE CurrentStatus  = 'Pedido Aprovado';
UPDATE Status  SET Id_Status = '2' WHERE CurrentStatus  = 'Pedido aguardando pagamento';
UPDATE Status  SET Id_Status = '3' WHERE CurrentStatus  = 'Pedido entregue';
UPDATE Status  SET Id_Status = '4' WHERE CurrentStatus  = 'Pedido Aprovado';
-----------------------------------------------------------------------------
--Update de uma informação da tabela LOJA
UPDATE Store  SET Id_Store = '1' WHERE StoreCode  = '1';
UPDATE Store  SET Id_Store = '2' WHERE StoreCode  = '2';
UPDATE Store  SET Id_Store = '3' WHERE StoreCode  = '3';
UPDATE Store  SET Id_Store = '4' WHERE StoreCode  = '4';
----------------------------------------------------------------------------
--Update de uma informação da tabela PEDIDO
UPDATE 'Order'  SET Id_Order = '1' WHERE Id_User  = '1';
UPDATE 'Order'  SET Id_Order = '2' WHERE Id_User  = '2';
UPDATE 'Order'  SET Id_Order = '3' WHERE Id_User  = '3';
UPDATE 'Order'  SET Id_Order = '4' WHERE Id_User  = '4';
--------------------------------------------------------------------------
--Update de uma informação da tabela FORNECEDOR
UPDATE Supplier  SET Id_Supplier = '1' WHERE Id_Product  = '1';
UPDATE Supplier  SET Id_Supplier = '2' WHERE Id_Product  = '2';
UPDATE Supplier  SET Id_Supplier = '3' WHERE Id_Product  = '3';
UPDATE Supplier  SET Id_Supplier = '4' WHERE Id_Product  = '4';
--------------------------------------------------------------------------
--Update de uma informação da tabela RELATÓRIO
UPDATE Report  SET Id_Report = '1' WHERE Id_Store  = '1';
UPDATE Report  SET Id_Report = '2' WHERE Id_Store  = '2';
UPDATE Report  SET Id_Report = '3' WHERE Id_Store  = '3';
UPDATE Report  SET Id_Report = '4' WHERE Id_Store  = '4';
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--Delete de uma informação da tabela USUÁRIO
DELETE  FROM User WHERE Id_User LIKE '1';
DELETE  FROM User WHERE Id_User LIKE '2';
DELETE  FROM User WHERE Id_User LIKE '3';
DELETE  FROM User WHERE Id_User LIKE '4';
-------------------------------------------------------------------------
--Delete de uma informação da tabela PRODUTO
DELETE  FROM Product WHERE Id_Product LIKE '1';
DELETE  FROM Product WHERE Id_Product LIKE '2';
DELETE  FROM Product WHERE Id_Product LIKE '3';
DELETE  FROM Product WHERE Id_Product LIKE '4';]
-------------------------------------------------------------------------
--Delete de uma informação da tabela CARRINHO DE COMPRAS
DELETE  FROM ShoppingCart WHERE Id_ShoppingCart LIKE '1';
DELETE  FROM ShoppingCart WHERE Id_ShoppingCart LIKE '2';
DELETE  FROM ShoppingCart WHERE Id_ShoppingCart LIKE '3';
DELETE  FROM ShoppingCart WHERE Id_ShoppingCart LIKE '4';
--------------------------------------------------------------------------
--Delete de uma informação da tabela STATUS
DELETE  FROM Status WHERE Id_Status LIKE '1';
DELETE  FROM Status WHERE Id_Status LIKE '2';
DELETE  FROM Status WHERE Id_Status LIKE '3';
DELETE  FROM Status WHERE Id_Status LIKE '4';
--------------------------------------------------------------------------
--Delete de uma informação da tabela LOJA
DELETE  FROM Store WHERE Id_Store LIKE '1';
DELETE  FROM Store WHERE Id_Store LIKE '2';
DELETE  FROM Store WHERE Id_Store LIKE '3';
DELETE  FROM Store WHERE Id_Store LIKE '4';
--------------------------------------------------------------------------
--Delete de uma informação da tabela PEDIDO
DELETE  FROM 'Order' WHERE Id_Order LIKE '1';
DELETE  FROM 'Order' WHERE Id_Order LIKE '2';
DELETE  FROM 'Order' WHERE Id_Order LIKE '3';
DELETE  FROM 'Order' WHERE Id_Order LIKE '4';
--------------------------------------------------------------------------
--Delete de uma informação da tabela FORNECEDOR
 DELETE  FROM Supplier WHERE Id_Supplier LIKE '1';
DELETE  FROM Supplier WHERE Id_Supplier LIKE '2';
DELETE  FROM Supplier WHERE Id_Supplier LIKE '3';
DELETE  FROM Supplier WHERE Id_Supplier LIKE '4';
---------------------------------------------------------------------------
--Delete de uma informação da tabela RELATÓRIO
DELETE  FROM Report WHERE Id_Report LIKE '1';
DELETE  FROM Report WHERE Id_Report LIKE '2';
DELETE  FROM Report WHERE Id_Report LIKE '3';
DELETE  FROM Report WHERE Id_Report LIKE '4';
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
--Inner Join juntando FORNECEDOR ao USUÁRIO
SELECT User.Id_User,
       User.NAME,
       User.ADDRESS,
       User.EMAIL,
       Supplier.Id_Supplier,
       Supplier.SupplierName,
       Supplier.SupplierStoreCode,
       Supplier.SupplierCode
FROM User  
INNER JOIN Supplier ON User.Id_User = Supplier.Id_User;
--Inner Join juntando PEDIDO ao USUÁRIO
SELECT User.Id_User,
       User.NAME,
       User.ADDRESS,
       User.EMAIL,
       'Order'.Id_Order,
       'Order'.Id_Product,
       'Order'.CreatedAt,
       'Order'.ProductQuantity
FROM User  
INNER JOIN 'Order' ON User.Id_User = 'Order'.Id_User;
--Inner Join juntando PEDIDO ao CARRINHO DE COMPRAS
SELECT 'Order'.Id_Order,
       'Order'.ProductQuantity,
       'Order'.OrderTotalValue,
       'Order'.CreatedAt,
       ShoppingCart.Id_ShoppingCart,
       ShoppingCart.Id_Order,
       ShoppingCart.TotalValue
FROM 'Order' 
INNER JOIN ShoppingCart ON 'Order'.Id_Order = ShoppingCart.Id_Order;
--Inner Join juntando o RELATÓRIO a LOJA
SELECT Report.Id_Report,
       Report.Id_Status,
       Report.Id_Supplier,
       Report.TotalValueReport,
       Store.Id_Store,
       Store.StoreName,
       Store.StoreAddress
FROM Report 
INNER JOIN Store ON Report.Id_Store = Store.Id_Store;
