# nix-Simula3MS

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

This is a simple packaging of [Simula3MS](https://simula3ms.des.udc.es), an education-oriented MIPS simulator, which is widely used at the [FIC](https://fic.udc.es/).

It is developed by the [*Computer Architecture Group*](https://gac.udc.es/) at the [UDC](https://www.udc.es/).

Here is the original program description:

> Simula3MS es un proyecto del grupo de [Arquitectura de Computadores](https://gac.des.udc.es/) de la [Universidad de A Coruña](https://www.udc.es/). El proyecto abarca la implementación de un simulador de una arquitectura básica en sus versiones monociclo, multiciclo y segmentado, que se pretende usar en los laboratorios de prácticas de asignaturas que tratan la organización del computador. Actualmente cuenta con tres opciones de simulación diferentes: entrada/salida, técnicas de salto y camino de datos. Esta última opción permite escoger entre diferentes configuraciones del camino de datos: monociclo, multiciclo, segmentado básico, Marcador y algoritmo de Tomasulo.
>
> Los simuladores de los procesadores son ampliamente utilizados en docencia debido a que ofrecen un entorno de programación menos peligroso y mejor que una máquina real porque pueden detectar errores, ofrecer más posibilidades que un ordenador real y no modifican elementos físicos del computador.
>
> Simula3MS es un simulador orientado al estudio de las asignaturas que tratan la arquitectura y organización del computador, en el cual se pueden observar y aplicar los conocimientos adquiridos en las clases de teoría. Cuenta con un entorno de trabajo gráfico y de fácil manejo que permite depurar cómodamente los programas, observar la evolución de la memoria, así como la ejecución de las instrucciones sobre distintos caminos de datos. La presencia de las distintas implementaciones en la misma herramienta permite observar las diferencias de ejecución de un mismo código según cuales sean las características del procesador.
>
> Simula3MS implementa un subconjunto de instrucciones basadas en el repertorio de instrucciones del procesador MIPS R2000/R3000. Consta de una primera parte que incluye un editor y que permite analizar sintácticamente las instrucciones antes de pasar a observar la ejecucción de las mismas. Una vez analizadas sintácticamente las instrucciones se puede seguir la evolución del segmento de datos, así como de los registros y del resto de elementos de la ventana de ejecución. Por otra parte, Simula3MS cuenta con un coprocesador de punto flotante en todas sus configuraciones, e incluye dos técnicas de gestión de entrada/salida: encuesta e interrupciones.

## License

I have not been able to find license information about the program itself, neither the source code for it.

The content in this repo itself is licensed under the [MIT license](./LICENSE).