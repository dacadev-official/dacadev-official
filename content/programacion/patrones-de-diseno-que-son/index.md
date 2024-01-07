---
title: "Patrones de diseño: Qué son?"
description: "Descubre los patrones de diseño en programación: soluciones clave para retos de software, categorías principales y principios para desarrolladores"
keywords:
  - Patrones de Diseño
  - Programación
  - Soluciones de Software
  - Patrones Creacionales
  - Patrones Estructurales
  - Patrones de Comportamiento
  - Desarrollo de Software
  - Principios de Diseño de Software
  - Mejores Prácticas en Programación
  - Guía de Patrones de Diseño
date: 2023-12-27T00:29:10.984Z
author: David A. Casas
banner: img/banner.png
draft: false
type: blog
etiquetas:
  - teoria
categorias:
  - programacion
---

Los patrones de diseño, en general, se pueden definir como soluciones estandarizadas a problemas comunes en el diseño de software. No son fragmentos de código específicos, sino más bien guías o plantillas que se pueden aplicar en diversos contextos de programación.

Estos patrones son especialmente útiles porque permiten reutilizar conocimientos y enfoques que han sido probados y perfeccionados a lo largo de los años, y proporcionan un punto de partida para tus proyectos de software.

{{<callout>}}
Los patrones de diseño son guías que pueden ser adaptadas para cada propósito específico según se requiera.
{{</callout>}}

Los patrones de diseño se dividen en tres categorías principales:

- **Patrones Creacionales:** Estos patrones se relacionan con los procesos de creación de objetos. Su objetivo es abstraer los detalles de la instanciación de clases, haciendo los sistemas más independientes de cómo sus objetos son creados y representados. Dentro de esta categoría encontramos los patrones:
  - Singleton
  - Factory Method
  - Abstract Factory
  - Builder
  - Prototype.
- **Patrones Estructurales:** Estos patrones se enfocan en cómo las clases y objetos se componen para formar estructuras más grandes. Los patrones estructurales facilitan el diseño al identificar formas sencillas de realizar relaciones entre entidades. Dentro de esta categoría encontramos los patrones:
  - Adapter
  - Bridge
  - Composite
  - Decorator
  - Facade
  - Flyweight
  - Proxy.
- **Patrones de Comportamiento:** Estos patrones se centran en la comunicación entre objetos. Son útiles para definir patrones de comunicación entre clases y objetos, haciéndolos más flexibles y eficientes. Encontraremos patrones como:
  - Observer
  - Mediator
  - Iterator
  - Strategy [[**más info**](/blog/patrones-de-diseño-estrategia)]
  - Command
  - State
  - Visitor.

Cada patrón tiene su propio conjunto de reglas y contextos donde es más adecuado. Lo importante es entender que no existe un patrón que sea mejor que los otros en todas las situaciones.

## Principios de diseño

Antes de adentrarte en los patrones de diseño, es buena idea tener unas bases y conceptos iniciales que te ayudarán al momento de estudiar cada uno de los patrones. Estos principios son:

- Identifica los aspectos de tu aplicación que pueden cambiar y sepáralos de aquellos que probablemente seguirán igual.
- Programa para una interfaz, no para una implementación. Programar para interfaces significa programar para supertipos.
- Prefiere la composición sobre la herencia en OO. Es decir, si debes escoger entre una u otra, es más flexible y fácil implementar la composición, ya que esta se define a través de interfaces.
- Esfuérzate por lograr diseños con acoplamientos débiles entre objetos que interactúan. Es decir, disminuye al máximo la dependencia entre los objetos de tu aplicación.
- Las clases deben ser abiertas a código nuevo y cerradas a la modificación del mismo. Es decir, se debe evitar modificar lo existente siempre que sea posible.
- Depende de abstracciones, no de clases concretas. Es decir, no utilices una clase como dependencia de otra; en su lugar, usa una clase abstracta o una interfaz

## Qué No Hacer al Usar Patrones de Diseño

Al momento de estudiar y trabajar con los patrones de diseño, es importante tener en cuenta los siguientes puntos:

- Conocer las bases de Orientación a Objetos (OO) no te hace un buen diseñador de OO.
- Un buen diseño de OO es reutilizable, extensible y mantenible a lo largo del tiempo.
- Los patrones te muestran cómo construir buenos sistemas usando cualidades de OO.
- Los patrones son experiencias probadas orientadas a objetos.
- Los patrones no te dan código; ellos te dan una solución general a problemas de diseño. Tu objetivo como programador e ingeniero de Software es aplicarlos y adaptarlos a tus casos específicos.
- Los patrones no son inventados, son descubiertos. Tú podrías encontrar otro a lo largo de tu carrera. 😉
- La mayoría de los patrones y principios son capaces de manejar el constante cambio en el
