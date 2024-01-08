---
title: "Patrones de Diseño: Observador"
description: Explora el patrón observador, su implementación en Python y su aplicación en la vida real. Aprende sobre sus partes claves de implementación
keywords:
  - Patrón Observador
  - Patrones de diseño
  - Publisher
  - Suscribers
  - Patron observador en Python
  - Diseño de Software
date: 2024-01-08T01:25:17.853Z
author: David A. Casas
banner: "img/banner.png"
draft: false
type: blog
etiquetas:
  - teoria
  - patrones de diseño
categorias:
  - programacion
---
## Teoría

El **patrón observador** es muy útil cuando se desea actualizar diversos objetos en función de los cambios en otros, siendo ampliamente implementado en frameworks frontend como React o Vue.

Este patrón se basa en dos partes clave: los publishers u observables, que son los objetos emisores de valores, y los suscriptores, conocidos como observadores o subscribers. Estos últimos reciben los valores emitidos por los publishers.

{{< callout >}}
🚀 Publishers + Suscribers = Observer Pattern
{{</ callout >}}

La esencia de este patrón es permitir que un **`publisher`** emita eventos a sus **`subscribers`**, teniendo además la capacidad de agregar o eliminar suscriptores de sus listas.

Veamos gráficamente cómo funciona este patrón.

{{<imageWebp src="img/obvs.jpg" width="400px">}}

En el caso 1, observamos un Objeto **Publisher** emitiendo valores constantemente, compartidos con todos los **Suscribers** registrados en su lista. En este ejemplo, no hay suscriptores.

En el caso 2, dos objetos están suscritos al objeto **Publisher**, recibiendo el valor emitido en el momento de su emisión.

{{<callout>}}
🚀 El patrón **Observer** permite relacionar objetos de manera comprensible, eficiente y mantenible. Es una relación **One-to-Many**.
{{</callout>}}

## Implementación

Implementaremos el patrón observer en Python definiendo dos clases abstractas: **Publisher** y **Subscriber**. Luego, crearemos clases derivadas que emitan valores (Publisher) y que se registren para recibir datos (Subscribers).

Comenzamos con las clases abstractas:

{{<code filename="main.py">}}
{{<highlight python>}}
from abc import ABC, abstractmethod

class Suscriber(ABC):
    def __init__(self):
        pass

    @abstractmethod
    def update(self, value) -> None:
        raise NotImplementedError("You must implement this method")

class Publisher(ABC):
    def __init__(self):
        self.subscribers: list[Suscriber] = list()

    def add_suscriber(self, subscriber: Suscriber):
        self.subscribers.append(subscriber)

    def remove_suscriber(self, suscriber: Suscriber):
        self.subscribers.remove(suscriber)

    def notify_suscribers(self, value):
        for suscriber in self.subscribers:
            suscriber.update(self, value)
{{</highlight>}}
{{</code>}}

En este código, definimos dos clases:

- Subscriber: Representa a los suscriptores o observadores, exigiendo la implementación del método **`update`**, que recibe el dato actualizado.
- Publisher: Define tres métodos clave:
    - **`add_subscriber`**: Registra un nuevo suscriptor.
    - **`remove_subscriber`**: Elimina un suscriptor específico.
    - **`notify_subscribers`**: Actualiza el valor a todos los suscriptores.

{{<callout>}}
🚀 Este código es una guía sobre cómo funciona el patrón y puede mejorarse según las necesidades de cada proyecto.
{{</callout>}}

Ahora, implementemos este patrón en un ejemplo práctico: un sistema de IoT en casa que mide la radiación ultravioleta. Queremos compartir estos datos con dos sistemas: uno que almacena información para la protección infantil contra los rayos UV y otro para un sistema de riego basado en estas mediciones.

Implementaremos tres clases:

1. UVSolarSystem (Publisher)
2. UVTracker (Suscriber)
3. UVPlantTracker (Suscriber)

Veamos su implementación:

{{<code filename="abs_classes.py">}}
{{<highlight python>}}
class UVSolarSystem(Publisher):
    
    def emit_value(self):
        value = randint(0, 100)
        self.notify_suscribers(value)

class UVTracker(Suscriber):
    
    def update(self, value) -> None:
        print(f"UVTracker: {value}")
        print("Doing funny stuff with this value :D")

class UVPlantTracker (Suscriber):

    def update(self, value) -> None:
        print(f"UVPlantTracker: {value}")
        print("Doing funny stuff for the plants with this value :D")
{{</highlight>}}
{{</code>}}

En el código, el método **`emit_value`** en UVSolarSystem es personalizado y utiliza **`notify_subscribers`**. Las clases Subscriber implementan el método **`update`**.

Probemos el código:

{{<code filename="main.py">}}
{{<highlight python>}}
print("Stage 1".center(50, "="))
    
  # define the publisher
  solar_system = UVSolarSystem()
  
  solar_system.emit_value()

  print("Stage 2".center(50, "="))
  # first suscriber
  uv_tracker = UVTracker()
  
  solar_system.add_suscriber(uv_tracker)
  solar_system.emit_value()
  
  print("Stage 3".center(50, "="))
  # second suscriber
  uv_plant_tracker = UVPlantTracker()
  
  solar_system.add_suscriber(uv_plant_tracker)
  solar_system.emit_value()
  
  print("Stage 4".center(50, "="))
  # remove the first suscriber
  solar_system.remove_suscriber(uv_tracker)
  solar_system.emit_value()
{{</highlight>}}
{{</code>}}

La salida sería

{{<code filename="main.py">}}
{{<highlight bash>}}
>>> $ python main.py
=====================Stage 1======================
=====================Stage 2======================
UVTracker: 2
Doing funny stuff with this value :D
=====================Stage 3======================
UVTracker: 79
Doing funny stuff with this value :D
UVPlantTracker: 79
Doing funny stuff for the plants with this value :D
=====================Stage 4======================
UVPlantTracker: 73
Doing funny stuff for the plants with this value :D
{{</highlight>}}
{{</code>}}

Podemos mejorar el Publisher inicial agregando la posibilidad de retener el último valor emitido. Esto permite a los suscriptores acceder al valor cuando lo necesiten. El cambio en la clase **`Publisher`** sería:

{{<code filename="main_improve.py">}}
{{<highlight python>}}
class PublisherImprove(ABC):
    def __init__(self) -> None:
        self.subscribers: list[Suscriber] = list()
        self._value = None
    
    def add_suscriber(self, subscriber: Suscriber):
        self.subscribers.append(subscriber)

    def remove_suscriber(self, suscriber: Suscriber):
        self.subscribers.remove(suscriber)

    def notify_suscribers(self):
        for suscriber in self.subscribers:
            suscriber.update(self._value)
    
    @property
    def get_value(self):
        return self._value
{{</highlight>}}
{{</code>}}

Agregamos el getter **`get_value`** para acceder al valor actual del Publisher, alojado como atributo privado **`self._value`**.

## ****Consideraciones del patrón observador****

- Define una relación one-to-many entre objetos.
- Los observables actualizan a los observadores a través de una interfaz común.
- Cualquier observador puede participar si cumple con la interfaz común.
- Los observadores deben estar desacoplados del observable.
- Es posible acceder a los datos del observable cuando sea necesario, en vez de esperar cada evento.
