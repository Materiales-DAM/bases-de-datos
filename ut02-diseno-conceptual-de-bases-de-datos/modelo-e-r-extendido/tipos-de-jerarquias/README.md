---
cover: ../../../.gitbook/assets/entidad-relacion.png
coverY: -17.90631743899708
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

# Tipos de jerarquías

Una jerarquía de entidades se conforma por una entidad padre (supertipo) y varias entidades hijas (subtipos). En cada jerarquía podemos especificar algunas características especiales que van a definir la relación entre la entidad padre y las hijas.

## Parcialidad

La primera característica que debemos definir es si por cada fila en la entidad padre va a haber alguna fila en alguna entidad hija:

* Una jerarquía es total si para toda fila en la entidad padre hay una fila en al menos una entidad hija

<figure><img src="https://lh5.googleusercontent.com/w16WnVmGA6HpV4O-J-JBaQ9wPaUVU2bvxL3cy3w2702y5lvbFC9oKFGe3T_XwugEbNFOfyPV6ZKUrfhWy-mAQ0G9t2_r4BEZomHZUSYnSrjnIHo9-QQ-BWfSy_UiCMM6xzkl-qtRt3i8xGzQKlTcJQ=s2048" alt=""><figcaption></figcaption></figure>

* Una jerarquía es parcial si hay filas en la entidad padre que no tienen ninguna fila relacionada en ninguna entidad hija

<figure><img src="https://lh5.googleusercontent.com/TFfSrwA237OOpqFFm9MI4jCIjfan8HaFW3t-ER2a0o2Rfz8mQfPvbKOZFhjchMRmD8UCQhMli_eefHtu8mzq_XUp7B6NBUPTaTBpH3SquGPfC4HLyWC-foBEEXJW6pl9QzlxPL00TIo78m6pQWp8SQ=s2048" alt=""><figcaption></figcaption></figure>

## Exclusividad

Por otro lado, otra características que debemos definir es si es posible que una fila en la entidad padre tenga una fila relacionada en más de una entidad hija.

* Una jerarquía es exclusiva cuando una fila en la entidad padre solo puede tener una fila relacionada en UNA de las entidades hijas

<figure><img src="https://lh5.googleusercontent.com/ZS2eSUIqOk4kzLZ0quvp3wFXpdT1uYQfY9p4SOMWxb9XsCrhhDE9PA_3DCTaS-3BfkH8KASygWqa6UX5wfzEZ5RS5cqbOuNmKLk7Kp4Lz37tjqjbXYIYK-f6pOzUWsru9yf4NaAjrt3A-ClxJ1FJ-w=s2048" alt=""><figcaption></figcaption></figure>

* Una jerarquía es solapado o inclusivo cuando para una fila en la entidad padre, puede haber filas relacionadas en varias entidades hijas.

<figure><img src="https://lh6.googleusercontent.com/iW7GMFrQFh-hoZ1Eu0sTWjAsu7o62vEYjtD4ZqNxLx84DQMkQtOJkkGhzyNRleTl06TE1A9UfhjdYnI2qWzmPs_vFdxsD00tH9zUuLeFn8bLJ2PRIoWtexgAQ_KwvH-kGxObNDjiMzoxuxyQhYZLYA=s2048" alt=""><figcaption></figcaption></figure>
