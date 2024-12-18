---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Soluciones UPDATE

Inserta los siguientes datos. MOdifica los script ddl

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
    ```

