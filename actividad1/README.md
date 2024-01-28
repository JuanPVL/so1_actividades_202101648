# Actividad 1
## Tipos de Kernel y sus Diferencias

El kernel es algo que podemos definir como parte fundamental de lo que son los diferentes sistemas operativos, esto al permitir la interacción entre el hardware y software de nuestros diversos dispositivos. Es por esto que debemos conocer un poco más sobre los diferentes tipos de kernel y cuales son las funciones de los mismos.

- # Kernel Monolítico 
    Este es un kernel de gran tamaño teniendo un núcleo grande y complejo, el cual se encarga de gestionar todas las tareas o servicios del sistema. Este tipo de Kernel es el responsable de la gestión de memoria y procesos al igual que de la comunicación entre los procesos, así como el soporte de las diversas funciones de los drivers y el software. Este se programa de forma no modular y cualquier cambio a realizar en cualquiera de los servicios requiere recompilar el núcleo y el reinicio del sistema para aplicar dichos cambios. Sistemas Operativos que utilizan este tipo de Kernel son Linux, OS X y Windows.

- # Microkernel
    Este tipo de kernel esta diseñado de forma especifica y planificada con un menor tamaño, esto ya que tienen una función clara que es evitar el colapso total del sistema en caso dado exista algun fallo. Esto ya que no se paralizaría todo el sistema operativo. Sin embargo, para que este logre funcionar completamente como un 