# Actividad 3
## Systemd Unit

Crear un systemd unit de tipo servicio que realice lo siguiente.

- Ejecutar un script imprima un saludo y la fecha actual infinitamente con una pausa de un segundo.
- Habilitar el servicio para que se inicie con el sistema 

## Pasos para la instalacion

### Paso 1
#### Creación del script 
Para nuestro script primero debemos crear un archivo con extension .sh, por ejemplo saludos.sh, posteriormente debemos realizar el código que va a estar utilizando nuestro script en este caso podriamos utilizar el siguiente.

`
#!/bin/bash
while true
do
FECHA=$(date '+%d-%m-%Y')
echo "Hola usuario, el dia de hoy es $FECHA"
sleep 1
done
`
El script descrito imprimira el saludo, con la fecha del día en que se hace de forma indefinida, sin embargo primero debemos darle permisos de ejecución al mismo.

`
chmod +x saludos.sh
`
# Paso 2
#### Creación del archivo systemd de servicio

Realizamos un cd hacia la carpeta system de la siguiente manera:
`cd /etc/systemd/system`

Creamos un archivo con la terminación .service; por ejemplo para el caso de nuestro script podria ser saludarnos.service; la creación se realiza de la siguiente manera 
`sudo nano saludarnos.service`

Dentro del archivo debemos agregar el siguiente contenido
`
[Unit]
Description=Saludos infinitos

[Service]
ExecStart=/home/user_name/saludos.sh
Restart=always
WorkingDirectory=/home/user_name

[Install]
WantedBy=multi.user.target
`
- En este la parte de [Unit] nos permite dar una descripción de lo que nuestro script estara haciendo.

- En [Service] estaremos diciendole a nuestro servicio que debe ejecutar por medio de la directriz ExecStart; la directriz restar nos sirve para que el servicio se reinicie si llegara a haber algun problema como un timeout y la directriz WorkingDirectory para decirle al servicio en que carpeta estamos trabajando.

- En [Install] la directriz WantedBy nos permite habilitar el servicio para que este se ejecute de forma automatica desde que iniciamos nuestro sistema operativo.

Posteriormente despues de haber editado el archivo lo guardamos.

# Paso 3

Si queremos que el servicio se ejecute de forma automatica al momento de iniciar el sistema usamos el comando

`sudo systemctl enable saludarnos.service`

Si en algun punto deseamos deshabilitarlo utilizamos

`sudo systemctl disable saludarnos`

Antes de poder activar nuestro servicio lo mejor es que realicemos una recarga a los servicios de daemon por medio del comando

`sudo systemctl daemon-reload`

Tambine podemos recargar el servicio creado por medio de

`sudo systemctl restart saludarnos`

Para iniciar nuestro servicio utilizamos el comando

`sudo systemctl start saludarnos`

Si quisieramos detener el servicio 

`sudo systemctl stop saludarnos`

Por ultimo para poder observar el estado y la ejecución de nuestro servicio, es decir sus logs utilizamos el comando

`sudo systemctl status saludarnos`

