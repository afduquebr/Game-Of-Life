# El juego de la vida de Conway
Autor: Andrés Felipe Duque Bran

***
## Descripción
Es un juego el cual no requiere interacción durante su evolución, únicamente para definir su estado inicial. Este consta de una cuadrícula con un autómata 
por cada una de ellas, las cuales pueden encontrarse en dos estados posibles, vivas o muertas. Esto dependerá especificamente del estado en que se encuentren 
sus vecinos, y viene dado de la forma:

  * Un autómata vivo con 2 o 3 vecinos vivos continúa viviendo, de lo contrario muere.
  * Un autómata muerto con 3 vecinos vivos revive, de lo contrario continúa muerto.
  
A partir de este conjunto de reglas y evolución, es posible construir un grupo de patrones cuya evolución durante el juego resulta de interés. Estos son:

  * Naves Espaciales: Es un tipo de patrón que luego de un número exacto de pasos en la evolución reaparece en una posición diferente. 
  * Osciladores: Es un tipo de patrón que luego de un número exacto de pasos en la evolución reaparece en una la misma posición. 
  * Vidas Estáticas: Son patrones que se mantienen inmóviles ante cada paso de la evolución, es decir, su forma no cambia desde su estado inicial.
  * Matusalenes: Son patrones que toman un número gande de iteraciones de la evolución para lograr su estabilización. Dependiendo del tipo, este número puede 
  variar en un rango mayor a 100 pasos.
  
*La información expuesta en esta sección fue tomada de* [Wikipedia.org](https://es.wikipedia.org/wiki/Juego_de_la_vida).
  
***
## Implementación
Para la implementación de este juego se realizó un desarrollo en el lenguaje de programación *Processing Java*. En la cual, a través del uso de una ventana 
de 1000x700 píxeles, se incluye un total de 700 autómatas, cada uno en recuadro de 10x10 píxeles. Por otro lado, para la configuración del estado inicial se 
dispuso de dos formas predeterminadas, llenado de forma aleatoria, y de patrones como los descritos en la sección anterior, además de la posibilidad de 
configuración manual personalizada. Por último, se contempla la posiblidad dar vida o muerte a cualquier autómata sin restricción alguna durante la evolución 
del juego, así como darle pausa y variar su velocidad en un rango de cuadros por segundo predeterminados.

***
## Instrucciones.
  1. En la carpeta GameOfLife se encuentra el archivo GameOfLife.pde, para el cual es necesario tener instalado el lenguaje de programación *Processing*, que 
  por defecto se encuentra basado en *Java*, para su descarga puede consultar [aquí](https://processing.org/download/). Una vez asegurado lo anterior, puede 
  proceder a abrir y correr el código, evite cambiar el nombre del archivo o la carpeta en que se encuentra contenido.
  
  2. Al ejecutar el archivo, una ventana en negro de 1000x700 píxeles. Y con el fin de iniciar el juego se pueden llevar a cabo las siguientes opciones:
  
      1. Para inicializar el juego con un patrón generado de forma aleatoria oprima la tecla ```1```, y su inicio se dará de forma automática.
    
      2. Para dar inicio con patrones predeterminados, puede oprimir la tecla ```2```, y su inicio se dará de forma automática.
    
      3. En caso de querer generar el patrón de forma manual puede dar clic sobre cada casilla y esta se tornará de color blanco, para dar inicio puede oprimir 
    cualquier tecla de valor alfabético.
  
  3. El juego cuenta con la posibilidad de pausar o reanudar en cualquier momento de su evolución, para esto es necesario oprimir la tecla ```BACKSPACE```, o 
  cualquier tecla de valor alfabético, respectivamente. 
  
  4. Si se desea regresar al inicio, la tecla ```DELETE``` permite volver a la interfaz descrita en el paso 2.
  
  5. El juego permite variar la velocidad controladamente en que se desarrolla el juego de forma ascedente y descendente durante toda su evolución, esto es 
  posible oprimiendo la tecla ```UP``` o ```DOWN``` respectivamente, y según se desee.
  
  6. La intervención manual sobre el estado de los autómatas puede realizarse sin problema durante cualquier momento de la evolución del juego, dando clic sobre 
  las casillas deseadas, ya sea para dar vida o quitarla, y una vez se desee continuar, el juego puede reanudarse como se explica en el paso 3.
  
*** 

*Este trabajo fue realizado como tarea para la materia de Programación Orientada a Objetos a cargo del profesor Jean Pierre Charalambos, en la Universidad Nacional 
de Colombia en el semestre 2021-1. Sus lineamientos se pueden consultar en el archivo* ```Professor_Instructions.md```.
