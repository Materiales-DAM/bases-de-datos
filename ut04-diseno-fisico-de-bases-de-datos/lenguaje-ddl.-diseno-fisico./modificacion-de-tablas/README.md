---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
layout:
  cover:
    visible: true
    size: hero
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# Modificación de tablas

En ocasiones, vamos a necesitar modificar una tabla de una base de datos ya creada. Para ellos contamos con la sentencia ALTER TABLE, que nos permite:

* Añadir / modificar / eliminar columnas
* Añadir / modificar / eliminar contraints a nivel de columna y tabla

La sentencia `ALTER TABLE` permite modificar una tabla ya existente.

<pre class="language-sql"><code class="lang-sql"><strong>ALTER TABLE TableName
</strong>    [alter_option [, alter_option] ...]
    

alter_option: {
  | ADD COLUMN col_name column_definition
        [FIRST | AFTER col_name]
  | ADD INDEX [index_name]
        [index_type] (key_part,...) [index_option] ...
  | ADD [CONSTRAINT [symbol]] PRIMARY KEY
        [index_type] (key_part,...)
        [index_option] ...
  | ADD [CONSTRAINT [symbol]] UNIQUE KEY
        [index_name] [index_type] (key_part,...)
        [index_option] ...
  | ADD CONSTRAINT FOREIGN KEY
        [index_name] (col_name,...)
        reference_definition
  | ADD [CONSTRAINT [symbol]] CHECK (expr) [[NOT] ENFORCED]
  | DROP {CHECK | CONSTRAINT} symbol
  | ALTER [COLUMN] col_name {
        SET DEFAULT {literal | (expr)}
      | SET {VISIBLE | INVISIBLE}
      | DROP DEFAULT
    }
  | CHANGE [COLUMN] old_col_name new_col_name column_definition
        [FIRST | AFTER col_name]
  | DROP COLUMN col_name
  | DROP INDEX index_name
  | DROP PRIMARY KEY
  | DROP FOREIGN KEY fk_symbol
  | FORCE
  | MODIFY [COLUMN] col_name column_definition
        [FIRST | AFTER col_name]
  | ORDER BY col_name [, col_name] ...
  | RENAME COLUMN old_col_name TO new_col_name
  | RENAME [TO | AS] new_tbl_name
  | {WITHOUT | WITH} VALIDATION
}

key_part: {col_name [(length)] | (expr)} [ASC | DESC]

index_type:
    USING {BTREE | HASH}

index_option: {
    KEY_BLOCK_SIZE [=] value
  | index_type
  | WITH PARSER parser_name
  | COMMENT 'string'
  | {VISIBLE | INVISIBLE}
}

</code></pre>

### [Documentación oficial](https://dev.mysql.com/doc/refman/8.0/en/alter-table.html)

## Renombrar tabla

<pre class="language-sql"><code class="lang-sql"><strong>ALTER TABLE Persona RENAME TO Empleado;
</strong></code></pre>

## Añadir columna

<pre class="language-sql"><code class="lang-sql"><strong>ALTER TABLE Persona ADD COLUMN Direccion VARCHAR(30) NOT NULL AFTER Apellidos;
</strong></code></pre>

## Eliminar columna

<pre class="language-sql"><code class="lang-sql"><strong>ALTER TABLE Persona DROP COLUMN Direccion;
</strong></code></pre>

## Renombrar columna

<pre class="language-sql"><code class="lang-sql"><strong>ALTER TABLE Persona RENAME COLUMN Dni TO Nif;
</strong></code></pre>

## Añadir índice

<pre class="language-sql"><code class="lang-sql"><strong>ALTER TABLE Persona ADD [UNIQUE] INDEX idx_Persona_Nombre(Nombre);
</strong></code></pre>

## Eliminar índice

<pre class="language-sql"><code class="lang-sql"><strong>ALTER TABLE Persona DROP INDEX idx_Persona_Nombre;
</strong></code></pre>

## Añadir clave foránea

<figure><img src="../../../.gitbook/assets/image (138).png" alt=""><figcaption></figcaption></figure>

<pre class="language-sql"><code class="lang-sql"><strong>ALTER TABLE Persona ADD FOREIGN KEY fk_Persona_Departamento(CodigoDepartamento) REFERENCES Departmento(Codigo);
</strong></code></pre>

## Eliminar clave foránea

<pre class="language-sql"><code class="lang-sql"><strong># Primero eliminamos la foreign key
</strong><strong>ALTER TABLE Persona DROP FOREIGN KEY fk_Persona_Departamento;
</strong><strong># Después eliminamos el índice de la foreign key
</strong>ALTER TABLE Persona DROP INDEX fk_Persona_Departamento;
</code></pre>
