# Soluciones PostgreSQL

1\.

```sql
```

2\.

```sql
DROP SCHEMA IF EXISTS Productos CASCADE;

CREATE SCHEMA Productos;

CREATE TABLE Productos.Product(
	Name VARCHAR(30) PRIMARY KEY,
	Calories INT NOT NULL,
	Price NUMERIC(8, 2) NOT NULL,
	BagType CHAR(3) NOT NULL
);

CREATE TABLE Productos.Province(
	Code VARCHAR(3) PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	Distance INT NOT NULL
);

CREATE TABLE Productos.Provider(
	Name VARCHAR(30) PRIMARY KEY,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(10) NOT NULL UNIQUE,
	ProvinceCode VARCHAR(3) NOT NULL,
	CONSTRAINT fk_Provider_Province
	FOREIGN KEY (ProvinceCode)
	REFERENCES Productos.Province(Code)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Productos.Ingredient(
	Code VARCHAR(10) PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	Price Numeric(8,2) NOT NULL,
	ProviderName VARCHAR(30) NOT NULL,
	CONSTRAINT fk_Ingredient_Provider
	FOREIGN KEY (ProviderName)
	REFERENCES Productos.Provider(Name)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Productos.ProductContains(
	ProductName VARCHAR(30) NOT NULL,
	IngredientCode VARCHAR(10) NOT NULL,
	PRIMARY KEY (ProductName, IngredientCode),
	CONSTRAINT fk_PC_Product
	FOREIGN KEY(ProductName)
	REFERENCES Productos.Product(Name)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_PC_Ingredient
	FOREIGN KEY (IngredientCode)
	REFERENCES Productos.Ingredient(Code)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);


INSERT INTO Productos.Province(Code, Name, Distance) VALUES ('MAD', 'Madrid', 100);
INSERT INTO Productos.Province(Code, Name, Distance) VALUES ('GUA', 'Guadalajara', 50);

INSERT INTO Productos.Provider(Name, Address, Phone, ProvinceCode) VALUES
	('Carrefour', 'Calle Falsa 3', '600635636', 'MAD'),
	('Almacenes Guadalajara', 'Calle Otra', '65656353', 'GUA');

INSERT INTO Productos.Ingredient(Code, Name, Price, ProviderName) VALUES('I001', 'Arroz largo', 2, 'Carrefour');
INSERT INTO Productos.Ingredient(Code, Name, Price, ProviderName) VALUES('I002', 'Arroz bomba', 3, 'Carrefour');
INSERT INTO Productos.Ingredient(Code, Name, Price, ProviderName) VALUES('I003', 'Conejo', 6, 'Almacenes Guadalajara');
INSERT INTO Productos.Ingredient(Code, Name, Price, ProviderName) VALUES('I004', 'Verduras', 4, 'Almacenes Guadalajara');

INSERT INTO Productos.Product(Name, Calories, Price, BagType) VALUES('Paella', 100, 20, 'GRA');
INSERT INTO Productos.ProductContains(ProductName, IngredientCode) VALUES('Paella', 'I002');
INSERT INTO Productos.ProductContains(ProductName, IngredientCode) VALUES('Paella', 'I003');
INSERT INTO Productos.ProductContains(ProductName, IngredientCode) VALUES('Paella', 'I004');

INSERT INTO Productos.Product(Name, Calories, Price, BagType) VALUES('Arroz con verduras', 50, 10, 'PEQ');
INSERT INTO Productos.ProductContains(ProductName, IngredientCode) VALUES('Arroz con verduras', 'I001');
INSERT INTO Productos.ProductContains(ProductName, IngredientCode) VALUES('Arroz con verduras', 'I004');

```
