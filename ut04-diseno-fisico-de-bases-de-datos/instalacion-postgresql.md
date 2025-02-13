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

# Instalación PostgreSQL

## Instalación Docker

[Sigue estas instrucciones](https://gs0-2.gitbook.io/docker)

## Creación del contenedor PostgreSQL

Una vez instalado Docker, basta con ejecutar este comando

{% tabs %}
{% tab title="Ubuntu" %}
<pre class="language-bash"><code class="lang-bash"><strong>CONTAINER=diurno-postgres
</strong><strong>PASSWORD=Sandia4you
</strong><strong># Este comando lanza un contenedor con PostgreSQL llamado diurno-postgres, la clave de postgres es Sandia4you
</strong>docker run --name $CONTAINER -e POSTGRES_PASSWORD=$PASSWORD -p 5432:5432  -d postgres:14.0
</code></pre>
{% endtab %}

{% tab title="Windows" %}
```bash
docker run --name diurno-postgres -e POSTGRES_PASSWORD=Sandia4you -p 5432:5432  -d postgres:14.0
```
{% endtab %}
{% endtabs %}
