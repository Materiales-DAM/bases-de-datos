---
cover: ../../../.gitbook/assets/sgdb.jpg
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

# SGDB centralizados

Es aquella estructura en la que el SGBD está implantado en una sola plataforma u ordenador desde donde se gestiona directamente, de modo centralizado, la totalidad de los recursos. Es la arquitectura de los centros de proceso de datos tradicionales. Se basa en tecnologías sencillas, muy experimentadas y de gran robustez.

**Las principales características de las bases de datos centralizadas son:**

* Se almacena completamente en una ubicación central, es decir, todos los componentes del sistema residen en un solo computador o sitio.
* No posee múltiples elementos de procesamiento ni mecanismos de intercomunicación como las bases de datos distribuidas.
* Los componentes de las bases de datos centralizadas son: los datos, el software de gestión de bases de datos y los dispositivos de almacenamiento secundario asociados.
* Son sistemas en los que su seguridad puede verse comprometida más fácilmente.

**En la siguiente tabla se representan las ventajas e inconvenientes destacables de esta arquitectura de bases de datos.**

<table data-full-width="true"><thead><tr><th>Ventajas</th><th>Inconvenientes</th></tr></thead><tbody><tr><td>Se evita la redundancia debido a la posibilidad de inconsistencias y al desperdicio de espacio.</td><td>Un mainframe en comparación de un sistema distribuido no tiene mayor poder de cómputo.</td></tr><tr><td>Se evita la inconsistencia. Ya que si un hecho específico se representa por una sola entrada, la no-concordancia de datos no puede ocurrir.</td><td>Cuando un sistema de bases de datos centralizado falla, se pierde toda disponibilidad de procesamiento y sobre todo de información confiada al sistema.</td></tr><tr><td>La seguridad se centraliza.</td><td>En caso de un desastre o catástrofe, la recuperación es difícil de sincronizar.</td></tr><tr><td>Puede conservarse la integridad.</td><td>Las cargas de trabajo no se pueden difundir entre varias computadoras, ya que los trabajos siempre se ejecutarán en la misma máquina.</td></tr><tr><td>El procesamiento de los datos ofrece un mejor rendimiento.</td><td>Los departamentos de sistemas retienen el control de toda la organización.</td></tr><tr><td>Mantenimiento más barato. Mejor uso de los recursos y menores recursos humanos.</td><td>Los sistemas centralizados requieren un mantenimiento central de datos.</td></tr></tbody></table>
