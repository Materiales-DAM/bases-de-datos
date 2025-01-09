---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Soluciones UPDATE

1.

    ```sql
    ALTER TABLE country 
    ADD CONSTRAINT fk_country_capital 
    FOREIGN KEY (capital) 
    REFERENCES city(id) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE;
    ```
2.

    ```sql
    UPDATE country 
    SET Name = 'Nuevo mundo'
    WHERE Code = 'USA';
    ```
3.

    ```sql
    UPDATE country
    SET population = 75000000
    WHERE population BETWEEN 50000000 AND 100000000; 
    ```
4.

    ```sql
    UPDATE country 
    SET Capital = 3
    WHERE Name LIKE '%o%';
    ```
5.

    ```sql
    UPDATE country
    SET Continent = 'Oceania' 
    WHERE Population > 200000000; 
    ```
6.

    ```sql
    UPDATE country 
    SET LifeExpectancy = 70 
    WHERE LifeExpectancy < 70 AND Continent != 'Europe'; 
    ```
7.

    ```sql
    UPDATE country
    SET IndepYear = 1800
    WHERE IndepYear < 1800;
    ```
8.

    ```sql
    UPDATE country
    SET Population = Population / 2
    WHERE Name LIKE 'B%';
    ```
9.

    ```sql
    UPDATE country
    SET Capital = 3
    WHERE Continent != 'Europe' AND Population > 100000000; 
    ```
10.

    ```sql
    UPDATE country 
    SET LifeExpectancy= 75
    WHERE Name LIKE '%land%'; 
    ```
11.

    ```sql
    ```
12.

    ```sql
    ```
13.

    ```sql
    ```
14.

    ```sql
    ```
15.

    ```sql
    ```
16.

    ```sql
    ```
17.

    ```sql
    ```
18.

    ```sql
    ```
19.

    ```sql
    ```
20.

    ```sql
    ```

