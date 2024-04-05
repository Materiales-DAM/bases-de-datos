---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Soluciones

1\.

```sql
ALTER TABLE country ADD FOREIGN KEY fk_country_capital(Capital) REFERENCES city(Id);
```

2\.

```sql
UPDATE country SET Name = 'Nuevo Mundo' WHERE Code = 'USA';
```

3\.

```sql
UPDATE country SET Population = 75000000 WHERE Population BETWEEN 50000000 AND 100000000;
```

4\.

```sql
-- El Id de Herat es 3
UPDATE country SET Capital  = 3 WHERE Name LIKE '%o%';
```

5\.

```sql
UPDATE country SET Continent = 'OCeania' WHERE Population > 200000000; 
```

6\.

```sql
UPDATE country SET LifeExpectancy = 70 WHERE Continent != 'Europe' AND LifeExpectancy < 70;
```

7\.

```sql
UPDATE country SET IndepYear = 1800 WHERE IndepYear  < 1800;
```

8\.

```sql
UPDATE country SET Population  = Population / 2 WHERE Name LIKE 'B%';
```

9\.

```sql
UPDATE country SET Capital = 3 WHERE Continent != 'Europe' AND Population > 100000000;
```

10\.

```sql
UPDATE country SET LifeExpectancy = 75 WHERE Name LIKE '%land%';
```

11\.

```sql
UPDATE country SET IndepYear = 1900 WHERE IndepYear  > 1900;
```

12\.

```sql
UPDATE country SET Population  = 50000000 WHERE Continent != 'Asia' AND Population < 50000000;
```

13\.

```sql
UPDATE country  SET Continent  = 'Europe' WHERE Name LIKE '%Republic%';
```

14\.

```sql
UPDATE country SET LifeExpectancy = 75 WHERE LifeExpectancy > 75;
```

15\.

```sql
UPDATE country SET IndepYear = 2000 WHERE IndepYear % 100 = 0;
```

16\.

```sql
UPDATE country SET Population =80000000 WHERE Population > 80000000 AND Continent = 'Europe';
```

17\.

```sql
UPDATE country SET LifeExpectancy = 70 WHERE IndepYear < 1700;
```

18\.

```sql
UPDATE country SET IndepYear = 1950 WHERE IndepYear LIKE '%50';
```

19\.

```sql
UPDATE country SET Population =120000000 WHERE Population > 120000000 AND Continent != 'Africa';
```

20\.

```sql
UPDATE country SET Continent ='Oceania' WHERE Name LIKE '%island%';
```

