# canalstay
Linux Persistence - 

#Autor: Adrian Ledesma Bello
#Link: https://www.canalhacker.com


# ESPAÑOL: No me hago responsable por el uso de esta herramienta.

Crea una shell persistente en linux, ejecutando un comando en la maquina víctima. Este comando descargará el payload de
nuestro servidor y se ejecutará incluso cuando se reinicie el ordenador. En el proceso, se moverá el archivo /bin/ps
por /bin/.ps y se creará un nuevo archivo /bin/ps evitando que los comandos en background se puedan visualizar con ps.
Una vez se ejecuta el comando en la víctima, nuestro servidór cambiará el puerto que hemos asignado anteriormente por otro 
nuevo (aumentandolo de 10 en 10) para poder utilizar el mismo comando en cualquier otro ordenador.

# ENGLISH: I'm not responsible for the use of this tool

Create a persistent shell in linux, executing a command on the victim machine. This command will download from our server a
payload and will be executed even the computer is restarted. The command, will move /bin/ps file to /bin/.ps and then create 
a new /bin/ps file, preventing the background commands from being displayed with ps.
Once the command is executed on the victim, our server will change the assigned port that we have previously assigned to a
new one (incressing it from 10 by 10) to be able to use the same command on any other computer.

# 中文: 我不负责什么用这个工具

