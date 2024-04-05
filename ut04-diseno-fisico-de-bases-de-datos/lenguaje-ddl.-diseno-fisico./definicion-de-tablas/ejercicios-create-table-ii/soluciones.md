# Soluciones

1\.

```sql
DROP DATABASE IF EXISTS Clases;

CREATE DATABASE Clases;

USE Clases;

CREATE TABLE Planta(
	Numero INT PRIMARY KEY
);

CREATE TABLE Clase(
	Curso INT NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Turno CHAR NOT NULL,
	Etapa CHAR NOT NULL,
	Superficie INT NOT NULL,
	NumeroPlanta INT NOT NULL,
	PRIMARY KEY(Curso, Titulo, Turno),
	CONSTRAINT fk_Clase_Planta 
	FOREIGN KEY (NumeroPlanta) 
	REFERENCES Planta(Numero)
);

CREATE TABLE Alumno(
	Dni CHAR(9) PRIMARY KEY,
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR(40) NOT NULL,
	TieneCarnet BOOL NOT NULL,
	Curso INT NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Turno CHAR NOT NULL,
	CONSTRAINT fk_Alumno_Clase
	FOREIGN KEY (Curso, Titulo, Turno)
	REFERENCES Clase(Curso, Titulo, Turno)
);

```

2\.

```sql
DROP DATABASE IF EXISTS Departamentos;

CREATE DATABASE Departamentos;

USE Departamentos;

CREATE TABLE Department(
	DepartmentCode CHAR(3) PRIMARY KEY,
	Budget NUMERIC(8,2) NOT NULL,
	Room VARCHAR(4) NOT NULL
);

CREATE TABLE Profesor(
	Dni CHAR(9),
	Name VARCHAR(30) NOT NULL,
	Category VARCHAR(3) NOT NULL,
	Seniority INT,
	DepartmentCode CHAR(3) NOT NULL,
	PRIMARY KEY(Dni),
	INDEX idx_Name(Name),
	CHECK (Seniority < 100 && Seniority >= 0),
	CONSTRAINT fk_Profesor_Department
	FOREIGN KEY (DepartmentCode)
	REFERENCES Department(DepartmentCode)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

CREATE TABLE Computer(
	ComputerId INT PRIMARY KEY AUTO_INCREMENT COMMENT 'Id autogenerado por MySQL',
	Memory INT DEFAULT 16 COMMENT 'En GB' NOT NULL,
	Processor VARCHAR(20)  NOT NULL,
	DepartmentCode CHAR(3) NOT NULL,
	CONSTRAINT fk_Computer_Department
	FOREIGN KEY (DepartmentCode)
	REFERENCES Department(DepartmentCode)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

```

3\.

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
	Phone VARCHAR(10) NOT NULL,
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

```

4\.

```sql
DROP DATABASE IF EXISTS Proyectos;

CREATE DATABASE Proyectos;

USE Proyectos;

CREATE TABLE Employee(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Surname VARCHAR(60) NOT NULL,
	Role VARCHAR(5) NOT NULL
);

CREATE TABLE Project(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(20) NOT NULL
);

CREATE TABLE Task(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	EmployeeId INT NOT NULL,
	ProjectId INT NOT NULL,
	CONSTRAINT fk_Task_Employee
	FOREIGN KEY (EmployeeId)
	REFERENCES Employee(Id)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	CONSTRAINT fk_Task_Project
	FOREIGN KEY (ProjectId)
	REFERENCES Project(Id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)
```
