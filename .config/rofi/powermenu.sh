#!/bin/bash

opcion="🔒 Bloquear
🚪 Cerrar sesión
🔄 Reiniciar
⏻ Apagar
💤 Suspender"

elegido=$(echo -e "$opcion" | rofi -dmenu -p "Energía" -theme-str 'window {width: 320px;} listview {columns: 1;}')

case "$elegido" in
    "🔒 Bloquear") i3lock -c 000000 ;;
    "🚪 Cerrar sesión") i3-msg exit ;;
    "🔄 Reiniciar") sudo /sbin/reboot ;;
    "⏻ Apagar") sudo /sbin/poweroff ;;
    "💤 Suspender") sudo /usr/sbin/pm-suspend ;;
esac
