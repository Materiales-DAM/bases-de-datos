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

# SGDB distribuidos

**Sistema de bases de datos distribuida** **(SBDD):** es un sistema en el cual múltiples sitios de bases de datos están ligados por un sistema de comunicaciones, de tal forma que, un usuario en cualquier sitio puede acceder los datos en cualquier parte de la red exactamente como si los datos estuvieran almacenados en su sitio propio.

**Sistema gestor de bases de datos distribuida (SGBDD):** es aquel que se encarga del manejo de la BDD y proporciona un mecanismo de acceso que hace que la distribución sea transparente a los usuarios. El término transparente significa que la aplicación trabajaría, desde un punto de vista lógico, como si un solo SGBD ejecutado en una sola máquina, administrara esos datos.

<table data-full-width="true"><thead><tr><th>Ventajas</th><th>Inconvenientes</th></tr></thead><tbody><tr><td>El acceso y procesamiento de los datos es más rápido ya que varios nodos comparten carga de trabajo.</td><td>La probabilidad de violaciones de seguridad es creciente si no se toman las precauciones debidas.</td></tr><tr><td>Desde una ubicación puede accederse a información alojada en diferentes lugares.</td><td>Existe una complejidad añadida que es necesaria para garantizar la coordinación apropiada entre los nodos.</td></tr><tr><td>Los costes son inferiores a los de las bases centralizadas.</td><td>La inversión inicial es menor, pero el mantenimiento y control puede resultar costoso.</td></tr><tr><td>Existe cierta tolerancia a fallos. Mediante la <a href="https://aulavirtual35.educa.madrid.org/aulas/pluginfile.php/23011/mod_resource/mod/glossary/showentry.php?displayformat=dictionary&#x26;concept=Replicaci%C3%B3n%20%28DAM_BD01%29">replicación</a>, si un nodo deja de funcionar el sistema completo no deja de funcionar.</td><td>Dado que los datos pueden estar replicados, el control de concurrencia y los mecanismos de recuperación son mucho más complejos que en un sistema centralizado.</td></tr><tr><td>El enfoque distribuido de las bases de datos se adapta más naturalmente a la estructura de las organizaciones. Permiten la incorporación de nodos de forma flexible y fácil.</td><td>El intercambio de mensajes y el cómputo adicional necesario para conseguir la coordinación entre los distintos nodos constituyen una forma de sobrecarga que no surge en los sistemas centralizados.</td></tr><tr><td>Aunque los nodos están interconectados, tienen independencia local.</td><td>Dada la complejidad del procesamiento entre nodos es difícil asegurar la corrección de los algoritmos, el funcionamiento correcto durante un fallo o la recuperación</td></tr></tbody></table>
