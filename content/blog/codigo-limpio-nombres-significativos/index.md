---
title: "Código Limpio: Define buenos nombres en tu código"
description: Aprende a nombrar variables y funciones eficazmente con consejos de 'Código Limpio'. Mejora la legibilidad y mantenimiento de tu código.
date: 2023-09-14T02:18:24.251Z
author: David A. Casas
banner: img/banner.png
draft: false
etiquetas:
  - teoria
categorias:
  - programacion
keywords:
  - consejos de programación
  - nombres en el código
  - código limpio
---

Al momento de escribir código, una tarea difícil de la que nadie habla es el hecho de nombrar nuestras variables, funciones, clases, etc. Y si no lo sientes así, déjame contarte por qué es algo a lo que deberías prestarle atención 😉.

Te voy a compartir algunos consejos que te ayudarán a la hora de definir dichos nombres y el porqué es buena práctica. Dentro de estos consejos encontramos...

{{< callout >}}
🚀 El contenido de este post está basado en las enseñanzas del libro "Código Limpio" y lo que he aprendido a lo largo de mi carrera como programador.
{{< /callout >}}

### Nombres significativos

Los nombres deben transmitir claramente cuál es el propósito del código, es decir, que con el hecho de leer la variable o función, se debe entender qué contiene.

{{< code filename="typescript.ts" >}}
{{< highlight typescript >}}
// Incorrecto
const a: string[] = []

// Correcto
const users: string[] = []
{{< /highlight >}}
{{< /code >}}

En el ejemplo anterior podemos ver que en la primera parte estamos definiendo nombres aleatorios para nuestro código lo cual no nos dice nada y en dado caso debemos leer más a fondo el código para entender qué es lo que hace, mientras que en la segunda parte podemos ver claramente que la variable será un arreglo de usuarios.

### Transmitir el propósito del código

Los nombres deben transmitir claramente cuál es la intención o uso del código. Por ejemplo, en el siguiente ejemplo podemos ver que en la primera parte el nombre no nos dice nada sobre lo que hace la función, mientras que en la segunda parte podemos ver que el nombre nos dice claramente que dicha función escribirá `Hello World`.

{{< code filename="typescript.ts" >}}
{{< highlight typescript >}}
// Incorrecto
function foo(): void {
    console.log("Hello World")
}

// Correcto
function printHelloWorld(): void {
    console.log("Hello World")
}
{{< /highlight >}}
{{< /code >}}

{{< callout >}}
🚀 Incluso podemos mejorar el nombre de la función `printHelloWorld` a `printHelloWorldToConsole` para ser más explícitos.
{{< /callout >}}

### Sé explícito y puntual

Los nombres que des dentro de tu código deben ser explícitos, esto significa que deben ser claros al transmitir información, esto ya lo mencioné, pero no caigas en hacerlo en exceso. Observa el siguiente ejemplo.

{{< code filename="typescript.ts" >}}
{{< highlight typescript >}}
// Incorrecto
const usersStringNameArray: string[] = ['John', 'Mary', 'Sam'];

// Correcto
const userNames: string[] = ['John', 'Mary', 'Sam'];
{{< /highlight >}}
{{< /code >}}

En el ejemplo observamos que estamos repitiendo información que ya nos brinda el tipado, como por ejemplo nombrar que es un arreglo de `strings`, lo que termina siendo redundante ya que el tipo de dato está implícito en el tipado `string[]`.

### Variables similares

Habrá casos en donde tengas variables cuyo comportamiento es similar o que hagan referencia a un mismo valor y puede ser difícil nombrarlas. Usa nombres que realmente distingan la funcionalidad de dicha variable y cuál es su objetivo, como en el siguiente código:

{{< code filename="typescript.ts" >}}
{{< highlight typescript >}}
// Incorrecto
function copyChars(a1: string[], a2: string[]): void {
  for (let i = 0; i < a1.length; i++) {
    a2[i] = a1[i];
  }
}

// Correcto
function copyChars(source: string[], destination: string[]): void {
  for (let i = 0; i < source.length; i++) {
    destination[i] = source[i];
  }
}
{{< /highlight >}}
{{< /code >}}

Para el ejemplo anterior, podemos observar que el uso de `source` y `destination` en lugar de `a1` y `a2` transmite claramente la funcionalidad de cada variable a pesar de ser similares.

### Nombres pronunciables

Usa nombres que sean pronunciables y que estén relacionados con el lenguaje que se esté usando al momento de escribir código. De esta manera, al leer el código no tendrás que hacer mapas mentales de los nombres. No seas como Flynt Loco.

{{< imageWebp src="img/fldsmdfrjpeg.jpeg" alt="Nombres pronunciables" >}}

### Nombres faciles de buscar

En concordancia con el punto anterior, además de tener nombres pronunciables, también piensa en que sean fáciles de buscar dentro del código o incluso dentro del proyecto.

Intenta evitar el uso de variables sencillas como a, además de que no transmiten nada, encontrarlas es difícil. ¿Cuántas palabras no tienen una 'a'? 🙃

{{< callout >}}
🚀 Solo en casos en donde la variable se use una vez en códigos pequeños, como ciclos `for`, podemos optar por usar variables simples como `e`.
{{< /callout >}}

{{< code filename="typescript.ts" >}}
{{< highlight typescript >}}
for (int j=0; j<34; j++) {
    s += (t[j]*4)/5;
}
{{< /highlight >}}
{{< /code >}}

### No permitas los mapas mentales

Cuando nos referimos a mapas mentales del código, estamos pensando en los demás (inclusive en tu yo del futuro). Cuando estás leyendo código y empiezas a crear mapas en tu cabeza con las relaciones de cada nombre de variable, función, etc., estás agregando una tarea adicional e innecesaria porque en sí tienes que entender el código y ahora tener ese mapa de nombres en la cabeza. ¿Imagínate si tienes muchas variables o nombres?

Para evitar esto, no uses nombres simples como `i`, `j` (muy común en ciclos for) o `r` para decir `url` o `response`. Simplemente coloca el nombre que corresponde.

### Nombres en las clases

Además de los consejos ya presentados, en las clases debemos tener en cuenta también otros casos para escribir código entendible y mantenible. Ten en cuenta estas consideraciones:

1. Las clases deben tener nombres sustantivos y NO verbales o de acciones. Un sustantivo es una palabra que se utiliza para nombrar personas, animales, cosas, lugares o ideas.
2. Los métodos de las clases deben tener nombres que hagan referencia a verbos o frases verbales, como `postPayment`, `deletePage` o `save`.
3. Los accesores, mutadores, getters o setters deben ser nombrados según su valor y llevar el prefijo `get/set` e `is`.
4. Define una forma de nombrar las acciones y aférrate a ella. Por ejemplo, si usas get, no uses `fetch` en otros. De esta manera mantienes la consistencia a través del código y/o proyecto.
