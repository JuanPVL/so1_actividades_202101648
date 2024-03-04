# Actividad 4
## Chat entre 2 participantes usando Named Pipes y Bash

## Funcionamiento

#### Scripts

Para nuestro chat debemos crear dos scripts diferentes uno que funciona para nuestro usuario uno y el otro para el usuario 2

Script Usuario 1

```
#!/bin/bash

# Script para chatear con otro usuario
#Usuario 1 primero escribe, luego el usuario 2 responde

#creamos un nuevo named pipe si es que este no existe
if [ -p chatapp ]
then
    echo ""
else   
    mkfifo chatapp
fi

mkfifo chatapp

#en este el usuario 1 primero escribe y luego pasa a leer el named pipe de forma infinita con el ciclo while
while true
do
    echo -n "User 1: "
    read MESSAGE

    echo "User 1: $MESSAGE" >> chatapp

    cat < chatapp

done

```
En este script creamos nuestro named pipe si no existiera para posteriormente escribir el mensaje del primer usuario en el, posteriormente este busca leer la informacion que dicho named pipe tenga escrita en el es decir la salida que obtenga del segundo script conseguida en forma de una respuesta del usuario 2.


Script Usuario 2

```
#!/bin/bash

# Script para chatear con otro usuario

#Usuario 2 lee el mensaje y responde

#en este el usuario 2 primero lee el named pipe y luego escribe en el named pipe de forma infinita con el ciclo while
while true
do
    cat < chatapp
    echo -n "User 2: "
    read MESSAGE

    echo "User2: $MESSAGE" >> chatapp
done

```
En este script se lee la informacion que nuestro named pipe tenga dentro es decir la salida obtenida del script 1 y posteriormente se pide al segundo usuario que escriba una respuesta al usuario 1 la cual se escribe dentro del named pipe.

#### Ejecutar los scripts

Utilizamos el comando bash para ejecutar nuestros scripts asegurandonos de ejecutar primer el script del usuario 1 y luego el del usuario 2
```
sudo bash chatear.sh

sudo bash chatearu2.sh
```

Posterior a ejecutar los scripts podremos utilizarlos de forma normal como un chat entre 2 usuarios.