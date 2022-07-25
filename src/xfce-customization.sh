#!/bin/bash

sudo dnf install -y arc-theme papirus-icon-theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Dark"
xfconf-query -c xfwm4 -p /general/theme -s "Arc-Dark"
