#!/bin/bash

# Leer el contenido de un archivo
echo "Nombre del nuevo usuario: "  
read nombreUsuario
echo "Password: "
read password
echo "ID del nuevo usuario: "
read idUsuario
echo "ID del grupo: "
read idGrupo
echo "Nombre completo del nuevo usuario: "
read nombreCompleto
echo "Directorio hogar: "
read directorio

echo "$nombreUsuario:$password:$idUsuario:$idGrupo:$nombreCompleto:$directorio:/bin/bash" >> /etc/passwd
echo "$nombreUsuario:$password:$idGrupo:" >> /etc/group
mkdir /home/$nombreUsuario
cd /etc/skel
cp .bash_logout /home/$nombreUsuario
cp .bash_profile /home/$nombreUsuario
cp .bashrc /home/$nombreUsuario
cp -R .mozilla /home/$nombreUsuario
chown $nombreUsuario -R /home/$nombreUsuario
chgrp $nombreUsuario -R /home/$nombreUsuario
chmod 755 -R /home/$nombreUsuario
echo "Usuario creado exitosamente"
echo "Ingresa password"
passwd $nombreUsuario