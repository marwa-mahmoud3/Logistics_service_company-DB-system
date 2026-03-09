USE [master]
GO
Create Database Logistics_service_company;
Go
use Logistics_service_company;

Create Table CUSTOMERS
(
Customer_ID int Primary Key Not Null IDENTITY(1,1),
First_Name varchar(20) Not Null,
Last_Name varchar(20) Not Null,
Customer_Phone_No varchar(15) Not Null,
Customer_address varchar(200) Not Null,
Postal_code varchar(10) Null
);

Create Table TRANSPORT_TYPE
(
ID int Primary Key Not Null IDENTITY(1,1),
transport_type varchar(15) Not Null,
number_of_train int Null,
number_of_trucks int Null,
);

Create Table TRANSPORT
(
Id_transfer int Primary Key Not Null IDENTITY(1,1),
status varchar(15) Not Null,
parking_stations varchar(50) Not Null,
transport_registration varchar(150) Not Null,
operation_name varchar(50) Not Null,
coordination_and_monitoring varchar(150) Not Null,
maintenance_and_inspection varchar(150) Not Null,
transport_type int,
CONSTRAINT FK_TRANSPORT_Type_TRANSPORT FOREIGN KEY (transport_type) REFERENCES TRANSPORT_TYPE(ID)
);

Create Table SHIPMENT_TYPE
(
ID int Primary Key Not Null IDENTITY(1,1),
shipment_Type varchar(50) Not Null,
shipment_location varchar(150) Not Null,
shipment_time time Not Null,
Delegate_Name varchar(50) Null,
Delegate_Number varchar(15) Null,
);

Create Table PRODUCT_CATEGORIES
(
ID int Primary Key Not Null IDENTITY(1,1),
Category_name varchar(20) Not Null,
);

Create Table PRODUCTS 
(
ID int Primary Key Not Null IDENTITY(1,1),
ProductName varchar(40) Not Null ,
Price float Not Null,
Category_ID int,
CONSTRAINT FK_PRODUCTS_PRODUCT_CATEGORIES FOREIGN KEY (Category_ID) REFERENCES PRODUCT_CATEGORIES(ID)
);

Create Table SHIPMENT
(
shipment_number int Primary Key Not Null IDENTITY(1,1),
Customer_ID int ,
Company_name varchar(30) Not Null,
shipment_date date Not Null,
delivery_date date Not Null,
shipment_weight float Not Null,
shipment_type int Not Null,
CONSTRAINT FK_SHIPMENT_CUSTOMERS FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS(Customer_ID),
CONSTRAINT FK_SHIPMENT_SHIPMENT_TYPE FOREIGN KEY (shipment_type) REFERENCES SHIPMENT_TYPE(ID)
);

Create Table PRODUCT_SHIPMENT
(
ID int Primary Key Not Null IDENTITY(1,1),
Product_ID  int Not Null,
Shipment_ID int Not Null,
CONSTRAINT FK_PRODUCTS_PRODUCT_SHIPMENT FOREIGN KEY (Product_ID) REFERENCES PRODUCTS(ID),
CONSTRAINT FK_PRODUCTS_SHIPMENT FOREIGN KEY (Shipment_ID) REFERENCES SHIPMENT(shipment_number)
);

Create Table PACKAGING_SHIPPING
(
shipping_ID int Primary Key Not Null,
shipping_date date Not Null,
CONSTRAINT FK_PACKAGINGSHIPPING_SHIPMENT FOREIGN KEY (shipping_ID) REFERENCES SHIPMENT(shipment_number)
);

Create Table CONTRACT_TYPE
(
ID int Primary Key Not Null IDENTITY(1,1),
contract_Type varchar(50) Not Null,
Company_address varchar(150) Null,
Owner_company_Name varchar(30) Null,
Delegate_Name varchar(30) Null,
Delegate_Number varchar(15) Null,
National_Identity varchar(14) Null,
Number_of_pieces int Null,
);

Create Table CONTRACT
(
Account_num int Primary Key Not Null,
shipping_time time Not Null,
Date_Expiry_Contract date Not Null,
cost float Not Null,
Sender_Phone_Number varchar(15) Not Null,
Sender_Name varchar(30) Not Null,
Contract_type int,
CONSTRAINT FK_CONTRACT_CONTRACT_TYPE FOREIGN KEY (Contract_type) REFERENCES CONTRACT_TYPE(ID)
);

Create Table STORAGE
(
ID int Primary Key Not Null IDENTITY(1,1),
Store_name varchar(30) Not Null,
StoreKeeper varchar(30) Not Null,
examination varchar(100) Not Null,
coding varchar(30) Not Null,
Product_Classification varchar(20) Not Null,
Customer_ID int,
delivery varchar(30) Not Null,
CONSTRAINT FK_STORAGE_CUSTOMERS FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS(Customer_ID),
);

/** INSERT Data In Product Categories Table **/
INSERT INTO PRODUCT_CATEGORIES(Category_name) VALUES ('Smart Phones');
INSERT INTO PRODUCT_CATEGORIES(Category_name) VALUES ('Labtops');
INSERT INTO PRODUCT_CATEGORIES(Category_name) VALUES ('Women Fashion');
INSERT INTO PRODUCT_CATEGORIES(Category_name) VALUES ('Kids Fashion');
INSERT INTO PRODUCT_CATEGORIES(Category_name) VALUES ('Skin Care');

/** INSERT Data In Products Table **/
INSERT INTO PRODUCTS(ProductName,Price,Category_ID) VALUES ('Numero IPhone', 2000 ,1);
INSERT INTO PRODUCTS(ProductName,Price,Category_ID) VALUES ('Jeans suit', 220 ,4);
INSERT INTO PRODUCTS(ProductName,Price,Category_ID) VALUES ('Cow Girl jacket', 800 ,3);
INSERT INTO PRODUCTS(ProductName,Price,Category_ID) VALUES ('ADARCI LONDON', 150 ,5);
INSERT INTO PRODUCTS(ProductName,Price,Category_ID) VALUES ('Apple MacBook Air 13-inch', 16500 ,2);

/** INSERT Data In Customers Table **/
INSERT INTO CUSTOMERS (First_Name,Last_Name,Customer_Phone_No,Customer_address,Postal_code) VALUES ('sara','mahmoud','01058655448','Alex','1715');
INSERT INTO CUSTOMERS (First_Name,Last_Name,Customer_Phone_No,Customer_address,Postal_code) VALUES ('aya','mahmoud','0105865548','Cario','1715');
INSERT INTO CUSTOMERS (First_Name,Last_Name,Customer_Phone_No,Customer_address,Postal_code) VALUES ('Mostafa','ahmed','0105865548','Cario','1715');
INSERT INTO CUSTOMERS (First_Name,Last_Name,Customer_Phone_No,Customer_address,Postal_code) VALUES ('mohamed','osama','0105865548','Sohag','1715');
INSERT INTO CUSTOMERS (First_Name,Last_Name,Customer_Phone_No,Customer_address,Postal_code) VALUES ('omar','ali','0105865548','Assuit','1715');

/** INSERT Data In Shipment Type Table **/
INSERT INTO SHIPMENT_TYPE(shipment_Type,shipment_location,shipment_time) VALUES ('Pick Up','cairo','13:30');
INSERT INTO SHIPMENT_TYPE(shipment_Type,shipment_location,shipment_time) VALUES ('Pick Up','Alex','01:15');
INSERT INTO SHIPMENT_TYPE(shipment_Type,shipment_location,shipment_time) VALUES ('Pick Up','Assuit','07:00');
INSERT INTO SHIPMENT_TYPE(shipment_Type,shipment_location,shipment_time,Delegate_Name,Delegate_Number) VALUES ('Delivery','Sohag','12:15','mahmoud Mostafa','01545454654');
INSERT INTO SHIPMENT_TYPE(shipment_Type,shipment_location,shipment_time,Delegate_Name,Delegate_Number) VALUES ('Delivery','Cairo','06:30','Mohamed Ahmed','01065464056');

/** INSERT Data In Shipment Table **/
INSERT INTO SHIPMENT(Customer_ID,Company_name,shipment_date,delivery_date,shipment_weight,shipment_type) VALUES (1,'Logistics Compnay','2022-12-12','2022-12-15','20.5',1);
INSERT INTO SHIPMENT(Customer_ID,Company_name,shipment_date,delivery_date,shipment_weight,shipment_type) VALUES (2,'Logistics Compnay','2022-12-12','2022-12-15','40.5',2);
INSERT INTO SHIPMENT(Customer_ID,Company_name,shipment_date,delivery_date,shipment_weight,shipment_type) VALUES (2,'Logistics Compnay','2022-12-12','2022-12-15','80.5',4);
INSERT INTO SHIPMENT(Customer_ID,Company_name,shipment_date,delivery_date,shipment_weight,shipment_type) VALUES (3,'Logistics Compnay','2022-12-12','2022-12-15','25.5',5);
INSERT INTO SHIPMENT(Customer_ID,Company_name,shipment_date,delivery_date,shipment_weight,shipment_type) VALUES (5,'Logistics Compnay','2022-12-12','2022-12-15','50',3);

/** INSERT Data In Product Shipment Table **/
INSERT INTO PRODUCT_SHIPMENT(Product_ID,Shipment_ID) VALUES (1,1);
INSERT INTO PRODUCT_SHIPMENT(Product_ID,Shipment_ID) VALUES (5,1);
INSERT INTO PRODUCT_SHIPMENT(Product_ID,Shipment_ID) VALUES (1,2);
INSERT INTO PRODUCT_SHIPMENT(Product_ID,Shipment_ID) VALUES (3,2);
INSERT INTO PRODUCT_SHIPMENT(Product_ID,Shipment_ID) VALUES (5,2);
INSERT INTO PRODUCT_SHIPMENT(Product_ID,Shipment_ID) VALUES (1,3);
INSERT INTO PRODUCT_SHIPMENT(Product_ID,Shipment_ID) VALUES (2,4);
INSERT INTO PRODUCT_SHIPMENT(Product_ID,Shipment_ID) VALUES (5,5);

/** INSERT Data In Transport Type Table **/
INSERT INTO TRANSPORT_TYPE(transport_type,number_of_train,number_of_trucks) VALUES ('WILD',5,5);
INSERT INTO TRANSPORT_TYPE(transport_type,number_of_train,number_of_trucks) VALUES ('WILD',2,10);
INSERT INTO TRANSPORT_TYPE(transport_type) VALUES ('MARINE');
INSERT INTO TRANSPORT_TYPE(transport_type) VALUES ('MARINE');
INSERT INTO TRANSPORT_TYPE(transport_type) VALUES ('AERIAL');

/** INSERT Data In Transport Table **/
INSERT INTO TRANSPORT(status,parking_stations,transport_registration,operation_name,coordination_and_monitoring,maintenance_and_inspection,transport_type) 
VALUES ('Delivered','5','done','transport operation', 'Pass' ,'pass',1);
INSERT INTO TRANSPORT(status,parking_stations,transport_registration,operation_name,coordination_and_monitoring,maintenance_and_inspection,transport_type) 
VALUES ('Delivered','5','done','transport operation', 'unPass' ,'pass',2);
INSERT INTO TRANSPORT(status,parking_stations,transport_registration,operation_name,coordination_and_monitoring,maintenance_and_inspection,transport_type) 
VALUES ('Delivered','5','done','transport operation', 'Pass' ,'pass',5);
INSERT INTO TRANSPORT(status,parking_stations,transport_registration,operation_name,coordination_and_monitoring,maintenance_and_inspection,transport_type) 
VALUES ('unDelivered','9','done','transport operation', 'Pass' ,'unpass',4);
INSERT INTO TRANSPORT(status,parking_stations,transport_registration,operation_name,coordination_and_monitoring,maintenance_and_inspection,transport_type) 
VALUES ('unDelivered','10','done','transport operation', 'Pass' ,'unpass',3);

/** INSERT Data In Packaging shipping Table **/
INSERT INTO PACKAGING_SHIPPING(shipping_ID,shipping_date) VALUES (1,'2022-12-12');
INSERT INTO PACKAGING_SHIPPING(shipping_ID,shipping_date) VALUES (2,'2022-12-12');
INSERT INTO PACKAGING_SHIPPING(shipping_ID,shipping_date) VALUES (3,'2022-12-12');
INSERT INTO PACKAGING_SHIPPING(shipping_ID,shipping_date) VALUES (4,'2022-12-17');
INSERT INTO PACKAGING_SHIPPING(shipping_ID,shipping_date) VALUES (5,'2022-12-17');

/** INSERT Data In Contract Type Table **/
INSERT INTO CONTRACT_TYPE(contract_Type,Company_address,Owner_company_Name,Delegate_Name,Delegate_Number) VALUES ('COMPANIES','Cairo','Mohamed Ahmed','Mohamed Osama','010656564');
INSERT INTO CONTRACT_TYPE(contract_Type,Company_address,Owner_company_Name,Delegate_Name,Delegate_Number) VALUES ('COMPANIES','Alex','Mohamed Osama','Mostafa Mahmoud','010656564');
INSERT INTO CONTRACT_TYPE(contract_Type,National_Identity,Number_of_pieces) VALUES ('INDIVIDUAL','22588886868686',10);
INSERT INTO CONTRACT_TYPE(contract_Type,National_Identity,Number_of_pieces) VALUES ('INDIVIDUAL','22588886868686',1);
INSERT INTO CONTRACT_TYPE(contract_Type,National_Identity,Number_of_pieces) VALUES ('INDIVIDUAL','22588886868686',8);

/** INSERT Data In Contract Table **/
INSERT INTO CONTRACT(Account_num,shipping_time,Date_Expiry_Contract,cost,Sender_Phone_Number,Sender_Name,Contract_type) 
VALUES (1,'05:30','2023-1-1',50,'0105054948','Ahmed Ali',1);
INSERT INTO CONTRACT(Account_num,shipping_time,Date_Expiry_Contract,cost,Sender_Phone_Number,Sender_Name,Contract_type) 
VALUES (2,'06:30','2023-1-1',50,'0105054948','salma Ahmed',4);
INSERT INTO CONTRACT(Account_num,shipping_time,Date_Expiry_Contract,cost,Sender_Phone_Number,Sender_Name,Contract_type) 
VALUES (3,'05:00','2023-1-1',50,'0105054948','Osama Ahmed',2);
INSERT INTO CONTRACT(Account_num,shipping_time,Date_Expiry_Contract,cost,Sender_Phone_Number,Sender_Name,Contract_type) 
VALUES (4,'04:00','2023-1-1',50,'0105054948','Ali Mohamed',5);
INSERT INTO CONTRACT(Account_num,shipping_time,Date_Expiry_Contract,cost,Sender_Phone_Number,Sender_Name,Contract_type) 
VALUES (5,'12:00','2023-1-1',50,'0105054948','Mostafa Ahmed',3);

/** INSERT Data In Storage Table **/
INSERT INTO STORAGE(Store_name,StoreKeeper,examination,coding,Product_Classification,Customer_ID,delivery) 
VALUES ('Noon','Mostafa Ali','pass','done','Toys',1,'delivered');
INSERT INTO STORAGE(Store_name,StoreKeeper,examination,coding,Product_Classification,Customer_ID,delivery) 
VALUES ('Noon','Mostafa Ali','pass','done','Toys',5,'delivered');
INSERT INTO STORAGE(Store_name,StoreKeeper,examination,coding,Product_Classification,Customer_ID,delivery) 
VALUES ('Noon','Mostafa Ali','pass','done','Toys',4,'delivered');
INSERT INTO STORAGE(Store_name,StoreKeeper,examination,coding,Product_Classification,Customer_ID,delivery) 
VALUES ('Noon','Mostafa Ali','unpass','done','Toys',3,'delivered');
INSERT INTO STORAGE(Store_name,StoreKeeper,examination,coding,Product_Classification,Customer_ID,delivery) 
VALUES ('Noon','Mostafa Ali','unpass','done','Toys',2,'delivered');