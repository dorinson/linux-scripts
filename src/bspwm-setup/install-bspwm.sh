#!/bin/bash     

# 1. Actualizamos el sistema.
sudo apt update
sudo apt upgrade

# 2. Instalamos
sudo apt install -y bspwm sxhkd

# 3. Creamos los directios para almacenar la configuracion
mkdir ~/.config/bspwm
mkdir ~/.config/bspwm/scripts/
mkdir ~/.config/sxhkd

# 4. Copiamos los archivos de configuración
cp resources/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc

cp resources/sxhkdrc ~/.config/sxhkd/

cp resources/bspwm_resize ~/.config/bspwm/scripts/
chmod +x ~/.config/bspwm/scripts/bspwm_resize