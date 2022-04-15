#!/bin/bash     

# 1. Actualizamos el sistema.
sudo dnf update
sudo dnf upgrade

# 2. Instalamos
sudo dnf install -y sxhkd

# 3. Creamos los directios para almacenar la configuracion
mkdir ~/.config/sxhkd

# 4. Copiamos los archivos de configuración
cp resources/sxhkdrc ~/.config/sxhkd/
