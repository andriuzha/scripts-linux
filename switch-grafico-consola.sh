#!/bin/bash

# Este script detecta si se esta en modo gráfico o consola y realiza el cambio al modo opuesto.
# Para realizar el cambio el script requiere que el equipo se reinicie.

# Author: @andriuzha
# Versión 1.0
# 2025-06-18
# https://github.com/andriuzha/scripts-linux

# Verifica el modo actual
current_target=$(systemctl get-default)

if [ "$current_target" == "graphical.target" ]; then
    echo "Cambiando a modo consola..."
    sudo systemctl set-default multi-user.target
else
    echo "Cambiando a modo gráfico..."
    sudo systemctl set-default graphical.target
fi

# Espera 5 segundos y se reinicia
echo "Reiniciando en 5 segundos..."
sleep 5
sudo reboot
