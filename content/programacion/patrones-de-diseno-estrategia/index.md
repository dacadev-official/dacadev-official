---
title: "Patrones de Diseño: Estrategía"
description: Descubre cómo implementar el Patrón Estrategia en Python con un enfoque práctico en clases de aves, optimizando comportamientos flexibles en tiempo de ejecución
keywords:
  - Patrón Estrategia
  - Desarrollo de Software
  - Python
  - Clases de Aves
  - Comportamiento en Tiempo de Ejecución
date: 2023-12-28T01:25:17.853Z
author: David A. Casas
banner: "img/banner.png"
draft: false
type: blog
etiquetas:
  - teoria
categorias:
  - programacion
---
Este patrón consiste en definir/identificar un conjunto de comportamientos comunes de un objeto y encapsular dichos comportamientos como una familia de algoritmos que, por definición, serán comunes entre ellos. De esta manera, si un objeto hace uso de dichos comportamientos, cada uno de ellos sería reemplazable por alguno de la misma familia.

Apliquemos el concepto agnóstico y posteriormente lo aplicaremos en código.

Supongamos que queremos crear un conjunto de clases que estén relacionadas con aves. Cada una de nuestras aves tendrá la capacidad de volar. Para aplicar el patrón estrategia, debemos identificar primero cuáles son esos comportamientos comunes que tienen nuestro conjunto de clases (Aves), para lo cual sería el método de volar, y vamos a encapsular este tipo de comportamiento. Esta idea se ilustra en el siguiente diagrama:

{{<imageWebp src="img/uml.png">}}

Para este proceso optaremos por definir las clases abstractas de Aves y del comportamiento de volar, de esta manera podemos crear nuestras diversas clases y estas podrán emplear cualquiera de las clases que implementen la clase base de `comportamientoVolar`.

Este código implementado en Python se vería de la siguiente manera:

{{<code filename="birds.py">}}
{{<highlight python>}}
from abc import ABC, abstractclassmethod

# Clases abstractas
class FlightBehavior(ABC):
    def __init__(self):
        pass

    @abstractclassmethod
    def execute_fly(self):
        pass

class Bird(ABC):
    def __init__(self, flys_behavior: FlightBehavior):
        self.flys_behavior = flys_behavior

    def fly(self):
        self.flys_behavior.execute_fly()

# Cómo utilizarlo
# 1. Definir las clases que implementan las clases abstractas

# Estrategias
class NoFly(FlightBehavior):
    def __init__(self):
        super().__init__()

    def execute_fly(self):
        print("I can't fly")

class Fly(FlightBehavior):
    def __init__(self):
        super().__init__()

    def execute_fly(self):
        print("I can fly")

# Clases que implementan la estrategia
class Hen(Bird):
    def __init__(self, flys_behavior: FlightBehavior):
        super().__init__(flys_behavior=flys_behavior)

class Duck(Bird):
    def __init__(self, flys_behavior: FlightBehavior):
        super().__init__(flys_behavior=flys_behavior)

# 2. Crear los objetos
if __name__ == '__main__':
    hen = Hen(NoFly())
    hen.fly()

    duck = Duck(Fly())
    duck.fly()
{{</highlight>}}
{{</code >}}

Este patrón es útil en situaciones en las que tienes una clase que tiene varios comportamientos y quieres que el comportamiento se seleccione en tiempo de ejecución, según las necesidades de tu aplicación. Por ejemplo, puedes tener una clase que realiza operaciones matemáticas y quieres poder cambiar la operación que realiza en tiempo de ejecución, según las necesidades de la aplicación.

A continuación, un ejemplo de Python de este caso de cambio de estrategia en tiempo de ejecución:

{{<code filename="strategy.py">}}
{{<highlight python>}}
from abc import ABC, abstractmethod

class Context:
    def __init__(self, strategy: 'Strategy') -> None:
        self._strategy = strategy

    def execute_strategy(self, x: int, y: int) -> int:
        return self._strategy.execute(x, y)

class Strategy(ABC):
    @abstractmethod
    def execute(self, x: int, y: int) -> int:
        pass

class AddStrategy(Strategy):
    def execute(self, x: int, y: int) -> int:
        return x + y

class SubtractStrategy(Strategy):
    def execute(self, x: int, y: int) -> int:
        return x - y

# Uso de las clases
context = Context(AddStrategy())
print(context.execute_strategy(10, 5))  # Salida: 15

context = Context(SubtractStrategy())
print(context.execute_strategy(10, 5))  # Salida: 5
{{</highlight>}}
{{</code >}}