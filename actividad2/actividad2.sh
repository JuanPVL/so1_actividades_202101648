
#Le pedimos al usuario ingresar su Usuario de Github y guardamos el valor en la variable GITHUB_USER
echo -n "Input your Github Username: "
read GITHUB_USER

#Concatenamos el Usuario de Github ingresado al link de la Api a la que consultamos los datos
API_LINK="https://api.github.com/users/$GITHUB_USER"

#Realizamos la peticion a la api y guardamos la respuesta obtenida en formato Json en una variable

DATOS=$(curl -s $API_LINK)

#Por medio de jq parseamos la respuesta de Json para obtener el ID y la fecha de creacion esto usando el | para unir la respuesta de salida del comando echo
#con la necesidad de un input para poder parsear de jq

ID=$(echo $DATOS | jq '.id')

CREATED_AT=$(echo $DATOS | jq '.created_at')

#Imprimimos los resultados de las variables junto con el github user 

echo "Hola $GITHUB_USER. User ID: $ID. Cuenta fue creada el: $CREATED_AT."

#Obtenemos la fecha y le damos formato

FECHA=$(date '+%d-%m-%Y')

#Creamos el directorio

DIR_PATH="/tmp/$FECHA"


#Revisamos si ya existe el directorio con un if para que el programa no de error en dado caso exista
if [ -d "$DIR_PATH" ]
then
    echo "Directorio existente se procedera a escribir en el log"
else
    mkdir $DIR_PATH
fi

#Creamos el log dentro del directorio creado en el que escribimos el mensaje anterior

LOG_FILE="$DIR_PATH/saludos.log"
echo "Hola $GITHUB_USER. User ID: $ID. Cuenta fue creada el: $CREATED_AT." > $LOG_FILE

#Creacion del cronjob para que el script se ejecute cada 5 minutos
FIVE_MINUTES="*/5****" 

(crontab -l ; echo "$FIVE_MINUTES $(pwd)/actividad2.sh") | crontab -



