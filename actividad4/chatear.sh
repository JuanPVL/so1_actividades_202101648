#!/bin/bash

# Script para chatear con otro usuario
#Usuario 1 primero escribe, luego el usuario 2 responde

#creamos un nuevo named pipe si es que el archivo ya existe
if [ -p chatapp ]
then
    echo ""
else   
    mkfifo chatapp
fi



#en este el usuario 1 primero escribe y luego pasa a leer el named pipe de forma infinita con el ciclo while
while true
do
    echo -n "User 1: "
    read MESSAGE

    echo "User 1: $MESSAGE" >> chatapp

    cat < chatapp

done


