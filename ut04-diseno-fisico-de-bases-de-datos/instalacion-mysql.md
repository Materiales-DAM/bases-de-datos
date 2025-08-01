---
cover: ../.gitbook/assets/mysqlpost.jpeg
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

# Instalación MySQL

## Ubuntu

#### Desinstalar Mysql

```bash
sudo apt remove mysql* mariadb* -y
sudo apt purge mysql* mariadb* -y
sudo apt autoremove -y
sudo apt autoclean -y
```

#### Instalación Docker

[Sigue estas instrucciones](https://fp-informatica.gitbook.io/development-tools/docker/instalacion-docker)

#### Crear el contenedor&#x20;

Vamos a  es posible crear un contenedor Docker con MySQL dentro simplemente ejecutando el siguiente script

{% tabs %}
{% tab title="Ubuntu" %}
```bash
PASSWORD=Sandia4you
CONTAINER=diurno-mysql
# Este comando lanza un contenedor con MySQL llamado diurno-mysql, la clave de root es Sandia4you
docker run --name $CONTAINER -e MYSQL_ROOT_PASSWORD=$PASSWORD -p 3306:3306 -d mysql:8.1 mysqld --default-authentication-plugin=mysql_native_password
```
{% endtab %}

{% tab title="Windows" %}
```bash
docker run --name diurno-mysql -e MYSQL_ROOT_PASSWORD=Sandia4you -p 3306:3306 -d mysql:8.1 mysqld --default-authentication-plugin=mysql_native_password
```
{% endtab %}
{% endtabs %}

{% file src="../.gitbook/assets/1. Instalación de MySQL.pptx.pdf" %}
