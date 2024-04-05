# Soluciones MySQL

1\.

```sql
DROP DATABASE IF EXISTS Departamentos;

CREATE DATABASE Departamentos;

USE Departamentos;

CREATE TABLE Departamento(
	Codigo VARCHAR(5) PRIMARY KEY,
	Presupuesto NUMERIC(10, 2) NOT NULL,
	Habitacion VARCHAR(3) NOT NULL 
);

CREATE TABLE Ordenador(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Memoria INT  NOT NULL,
	Procesador VARCHAR(20) NOT NULL,
	CodigoDepartamento VARCHAR(5) NOT NULL,
	CONSTRAINT fk_Ordenador_Departamento
	FOREIGN KEY (CodigoDepartamento)
	REFERENCES Departamento(Codigo)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE Profesor(
	Dni CHAR(9) PRIMARY KEY,
	Nombre VARCHAR(29) NOT NULL,
	Categoria CHAR(2) NOT NULL,
	Antiguedad INT NOT NULL,
	CodigoDepartamento VARCHAR(5) NOT NULL,
	CONSTRAINT fk_Profesor_Departamento
	FOREIGN KEY (CodigoDepartamento)
	REFERENCES Departamento(Codigo)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
	
);

INSERT INTO Departamento(Codigo, Presupuesto, Habitacion) VALUES('INF', 20000, '100');
INSERT INTO Departamento(Codigo, Presupuesto, Habitacion) VALUES('MKT', 25000, '101');

INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) VALUES ('00000000X', 'Bob Esponja', 'JD', 10, 'INF');
INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) VALUES ('00000001X', 'Pocoyo', 'PS', 15, 'INF');
INSERT INTO Profesor (Dni, Nombre, Categoria, Antiguedad, CodigoDepartamento) VALUES ('00000002X', 'Peppa Pig', 'JD', 20, 'MKT');

INSERT INTO Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(16, 'I7', 'INF');
INSERT INTO Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(16, 'I7', 'INF');

INSERT INTO Ordenador (Memoria, Procesador, CodigoDepartamento) VALUES(8, 'I3', 'MKT');

```

2\.

```sql
DROP DATABASE IF EXISTS Productos;

CREATE DATABASE Productos;

USE Productos;

CREATE TABLE Product(
	Name VARCHAR(30) PRIMARY KEY,
	Calories INT NOT NULL,
	Price NUMERIC(8, 2) NOT NULL,
	BagType CHAR(3) NOT NULL
);

CREATE TABLE Province(
	Code VARCHAR(3) PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	Distance INT NOT NULL
);

CREATE TABLE Provider(
	Name VARCHAR(30) PRIMARY KEY,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(10) NOT NULL UNIQUE,
	ProvinceCode VARCHAR(3) NOT NULL,
	CONSTRAINT fk_Provider_Province
	FOREIGN KEY (ProvinceCode)
	REFERENCES Province(Code)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Ingredient(
	Code VARCHAR(10) PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	Price Numeric(8,2) NOT NULL,
	ProviderName VARCHAR(30) NOT NULL,
	CONSTRAINT fk_Ingredient_Provider
	FOREIGN KEY (ProviderName)
	REFERENCES Provider(Name)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE ProductContains(
	ProductName VARCHAR(30) NOT NULL,
	IngredientCode VARCHAR(10) NOT NULL,
	PRIMARY KEY (ProductName, IngredientCode),
	CONSTRAINT fk_PC_Product
	FOREIGN KEY(ProductName)
	REFERENCES Product(Name)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_PC_Ingredient
	FOREIGN KEY (IngredientCode)
	REFERENCES Ingredient(Code)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);


INSERT INTO Province(Code, Name, Distance) VALUES ('MAD', 'Madrid', 100);
INSERT INTO Province(Code, Name, Distance) VALUES ('GUA', 'Guadalajara', 50);

INSERT INTO Provider(Name, Address, Phone, ProvinceCode) VALUES
	('Carrefour', 'Calle Falsa 3', '600635636', 'MAD'),
	('Almacenes Guadalajara', 'Calle Otra', '65656353', 'GUA');

INSERT INTO Ingredient(Code, Name, Price, ProviderName) VALUES('I001', 'Arroz largo', 2, 'Carrefour');
INSERT INTO Ingredient(Code, Name, Price, ProviderName) VALUES('I002', 'Arroz bomba', 3, 'Carrefour');
INSERT INTO Ingredient(Code, Name, Price, ProviderName) VALUES('I003', 'Conejo', 6, 'Almacenes Guadalajara');
INSERT INTO Ingredient(Code, Name, Price, ProviderName) VALUES('I004', 'Verduras', 4, 'Almacenes Guadalajara');

# Insertamos la paella con sus ingredientes
INSERT INTO Product(Name, Calories, Price, BagType) VALUES('Paella', 100, 20, 'GRA');
INSERT INTO ProductContains(ProductName, IngredientCode) VALUES('Paella', 'I002');
INSERT INTO ProductContains(ProductName, IngredientCode) VALUES('Paella', 'I003');
INSERT INTO ProductContains(ProductName, IngredientCode) VALUES('Paella', 'I004');

# Insertamos el arroz con verduras con sus ingredientes
INSERT INTO Product(Name, Calories, Price, BagType) VALUES('Arroz con verduras', 50, 10, 'PEQ');
INSERT INTO ProductContains(ProductName, IngredientCode) VALUES('Arroz con verduras', 'I001');
INSERT INTO ProductContains(ProductName, IngredientCode) VALUES('Arroz con verduras', 'I004');
```
