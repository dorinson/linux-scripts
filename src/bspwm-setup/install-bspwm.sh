#!/bin/bash     

# 1. Actualizamos el sistema.
sudo dnf update
sudo dnf upgrade

# 2. Instalamos
sudo dnf install -y bspwm

# 3. Creamos los directios para almacenar la configuracion
mkdir ~/.config/bspwm
mkdir ~/.config/bspwm/scripts/

# 4. Copiamos los archivos de configuración
cp resources/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc

cp resources/bspwm_resize ~/.config/bspwm/scripts/
chmod +x ~/.config/bspwm/scripts/bspwm_resize
