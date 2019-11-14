# canalstay
Linux Persistence - 

#Autor: Adrian Ledesma Bello
#Link: https://www.canalhacker.com


# ESPAÑOL: No me hago responsable por el uso de esta herramienta.

Crea una persistencia en linux, ejecutando un comando en el ordenador víctima. Este comando descargará el payload de nuestro servidor y se ejecutará incluso cuando se reinicie el ordenador. En el proceso, se moverá el archivo /bin/ps por /bin/.ps y se creará un nuevo archivo /bin/ps evitando que los comandos en background se puedan visualizar con ps.
Una vez se ejecuta el comando en la víctima, nuestro servidór cambiará el puerto que hemos asignado anteriormente por otro nuevo (aumentandolo de 10 en 10) para poder utilizar el mismo comando en cualquier otro ordenador.

# ENGLISH: I'm not responsible for the use of this tool



# 中文: 我不负责什么用这个工具

