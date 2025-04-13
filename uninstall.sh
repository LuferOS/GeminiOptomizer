#!/system/bin/sh

MODDIR_UNINSTALL=${0%/*} # Directorio del módulo
PIDFILE="$MODDIR_UNINSTALL/killer.pid"
ZRAM_DEVICE="/sys/block/zram0" # Asume el mismo dispositivo que en service.sh

echo "********************************"
echo " Desinstalando Optimizador A24 "
echo "********************************"

# 1. Detener el proceso killer en segundo plano (si existe y está activo)
echo "Intentando detener el proceso killer..."
if [ -f "$PIDFILE" ]; then
  PID=$(cat "$PIDFILE")
  if [ -n "$PID" ] && ps -p $PID > /dev/null; then
    echo "Deteniendo proceso killer con PID $PID..."
    kill -9 $PID >/dev/null 2>&1 # Usar kill -9 para asegurar que se detenga
    rm -f "$PIDFILE"
    echo "Proceso killer detenido."
  else
    echo "No se encontró un proceso killer activo (PID: $PID) o archivo PID vacío."
    rm -f "$PIDFILE" # Limpia el archivo por si acaso
  fi
else
  echo "No se encontró archivo PID del killer ($PIDFILE)."
  # Intento adicional por si el archivo PID falló (menos fiable)
  # pkill -f "$MODDIR_UNINSTALL/service.sh killer_loop"
fi

# 2. Desactivar y resetear ZRAM (si fue configurado por el módulo)
# Nota: El sistema podría reconfigurar ZRAM por sí mismo después.
echo "Intentando desactivar y resetear ZRAM ($ZRAM_DEVICE)..."
if [ -e "$ZRAM_DEVICE/disksize" ]; then
  swapoff $ZRAM_DEVICE >/dev/null 2>&1
  echo 1 > "$ZRAM_DEVICE/reset" >/dev/null 2>&1
  echo "ZRAM $ZRAM_DEVICE desactivado y reseteado (si estaba activo)."
else
  echo "Dispositivo ZRAM $ZRAM_DEVICE no encontrado, no se requiere acción."
fi

# 3. Restaurar sysctl (Opcional - Generalmente no necesario, se resetean al reiniciar)
# echo "Los valores de sysctl se restaurarán al reiniciar."

echo "Limpieza básica de desinstalación completada."
echo "Se recomienda reiniciar el dispositivo."