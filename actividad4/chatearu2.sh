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