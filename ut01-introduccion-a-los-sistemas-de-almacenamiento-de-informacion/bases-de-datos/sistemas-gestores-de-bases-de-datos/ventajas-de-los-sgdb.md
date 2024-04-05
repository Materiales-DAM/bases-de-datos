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

# Ventajas de los SGDB

* **Separación entre los datos y los programas**. Esto permite modificar los datos sin modificar el código de las aplicaciones y viceversa.
* **Menor redundancia**. Este modelo no requiere que los datos se repitan para cada aplicación que los requiera, en su lugar se diseñan los datos de forma independiente a las aplicaciones. Los programadores de aplicaciones deberán conocer la estructura creada para los datos y la forma en la que deben acceder a ellos.
* **Centralización de los datos**. Al estar centralizados, es más difícil que haya datos inconsistentes. Es decir, que una aplicación muestre información distinta al resto de aplicaciones, ya que los datos son los mismos para todas.
* **Integridad de los datos**. Proveen de mecanismos que evitan que se produzcan incoherencias dentro de la base de datos.
* Mayor **seguridad en los datos**. El SGBD es el encargado de la seguridad y se puede centrar en ella de forma independiente a las aplicaciones. Como las aplicaciones deben atravesar la capa del SGBD para llegar a los datos, no se podrán saltar la seguridad.
* **Acceso eficiente**. Esta forma de organizar los datos produce un resultado más óptimo en rendimiento ya que los sistemas gestores centralizan el acceso pudiendo ejecutar políticas diferentes en función de la demanda.
* **Menor espacio de almacenamiento**: gracias a la reducción de datos duplicados y a las optimizaciones que realiza en el almacenamiento.
* **Acceso simultáneo** a los datos. Nuevamente el SGBD tiene más capacidad de conseguir esto. Cuando hay varias aplicaciones que intentan acceder a los datos en los sistemas orientados a los ficheros, compiten por los datos y es fácil el bloqueo mutuo. En el caso de los sistemas orientados a bases de datos, toda petición pasa la capa del SGBD y esto permite evitar los bloqueos.
* Incorporan mecanismos de copias de seguridad y recuperación para restablecer la información en caso de fallos en el sistema.
