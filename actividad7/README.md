# Actividad 7
## Completely Fair Scheduler

### 202101648
### Juan Pedro Valle Lema

#### Caracteristicas y Funcionalidades

Este es un algoritmo planificador desarrollado con el objetivo en mente de maximizar el uso de la CPU con las diferentes tareas que se inician en un sistema operativo Linux, basandose en el mismo. Este aparecio en la version de nucleo de Kernel 2.6.23 buscando sustituir al proceso planificador que se incluia en las versiones anteriores. Este se basa en el scheduler RSDL (Rotating Staircase Deadline Scheduler) y es bastante elegante al momento de manejar los procesos tanto ligados a I/O como a CPU.

Como su nombre lo indica la idea de este Scheduler es dividir de forma equitativa el tiempo en que el CPU esta en un proceso. En este cada proceso que puede encontrarse corriendo tiene un tiempo virtual asociado con un PCB (process control block). Cuando ocurre un cambio de contexto en este, el proceso que se encuentre corriendo actualmente tendra su tiempo virtual incrementado por una cantidad T, que representa el tiempo que se ha ejecutado recientemente, debido a esto el tiempo de ejecucion de los procesos aumenta de forma monolitica. 

Este scheduler tiene latencia objetiva, que es el tiempo minimo idealizado a una muy pequeña duracion, asi cada tarea ejecutable tendra al menos un turno en el procesador, en este caso cada proceso obtiene una parte de latencia obtenida por medio de 1/N, donde N es el numero de tareas. Sabiendo ademas que N es dinamica ya que en cada instante los valores de cantidad de tareas se encuentran cambiando. Este ademas llega a utilizar una granularidad minima, que seria el tiempo minimo de ejecucion antes de ser adelantado, sabiendo que este valor no puede ser mayor al de 1/N o si no perderiamos la caracteristica de equitatividad de nuestro scheduler.

Este es un algoritmo bastante simple para el Scheduling de procesos implementado por medio de un arbol Rojo Negro y no colas. Entonces este todos los procesos que se encuentran en la memoria principal son insertados a nuestro arbol cada vez que un nuevo proceso llega y es insertado, esto ya que el arbol Rojo Negro tiene la capacidad de autobalancearse. Cuando ocurre el cambio de contexto ademas de actualizar el tiempo de ejecucion virtual como se menciono anteriormente, el nuevo proceso se decide viendo cual tiene el manor valor en este tiempo que en este caso podemos saber que es el que se encuentre mas a la izquierda del arbol. Ademas de eso si el proceso actual aun tiene burst time se insertara en el arbol. De esta forma este scheduler mantiene esa llamada equitatividad al cambiar las prioridades de los procesos en cada cambio de contexto. 

La complejidad de tiempo de este algoritmo es O(logn), esto debido a que la insercion de los nodos es de esta complejidad sin embargo la busqueda del nodo es O(1) debido a que sabemos que siempre sera el de mas hacia la izquierda. 

Existe una ventaja de el uso del arbol Rojo Negro y es que los procesos que sean atados a I/O tendran un tiempo virtual muy pequeño y aparecera en la parte de mas a la izquierda del arbol, teniendo una mayor prioridad para ejecutarse de primero. Esto permite que este Scheduler facilmente sepa que procesos son atados a I/O y cuales son atados a CPU, para asi dar mas prioridad a los procesos atados a I/O y evitar que estos se encuentren en un estado de starvation. 

Es importante saber que el CFS acepta multiprocesos simetricos en los que cualquier proceso puede ejecutarse en cualquier procesador, aunque tambien puede haber casos donde alguno se segregue debido a alguna politica que este maneje.