#!/usr/bin/env bash
# Lanza polybar una sola vez, aunque sea llamado por i3 (exec_always)
# y por el autostart de XDG (.desktop) al mismo tiempo.

BAR_NAME="mybar"
CONF="$HOME/.config/polybar/config.ini"
LOGDIR="${XDG_CACHE_HOME:-$HOME/.cache}/polybar"
LOGFILE="$LOGDIR/launch.log"
LOCKFILE="/tmp/polybar-launch.lock"

mkdir -p "$LOGDIR"

# Si otra instancia de este script se está ejecutando, no hace nada
if [ -e "$LOCKFILE" ]; then
    echo "$(date '+%F %T') [launch] otro lanzamiento en curso, saliendo" >> "$LOGFILE"
    exit 0
fi

echo $$ > "$LOCKFILE"
trap 'rm -f "$LOCKFILE"' EXIT

echo "$(date '+%F %T') [launch] iniciando polybar ($BAR_NAME)" >> "$LOGFILE"

killall -q polybar 2>/dev/null   # SIGTERM: unembed limpio de la bandeja (tray)
for _ in $(seq 1 10); do
    pgrep -x polybar >/dev/null || break
    sleep 0.2
done
killall -q -9 polybar 2>/dev/null
sleep 0.2

polybar "$BAR_NAME" -c "$CONF" >> "$LOGFILE" 2>&1 &

sleep 1
if pgrep -x polybar >/dev/null; then
    echo "$(date '+%F %T') [launch] polybar OK (pid $(pgrep -x polybar))" >> "$LOGFILE"
else
    echo "$(date '+%F %T') [launch] ERROR: polybar no arrancó, revisa $LOGFILE" >> "$LOGFILE"
fi
