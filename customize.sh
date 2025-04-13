#!/system/bin/sh

# Directorio del módulo (KernelSU lo define, ${0%/*} suele funcionar)
MODDIR=${0%/*}

# Función de impresión (KernelSU la intercepta)
ui_print() {
  echo "$1"
}

ui_print "*******************************"
ui_print " Instalando Optimizador A24    "
ui_print "     (Ejemplo KernelSU)      "
ui_print "*******************************"
ui_print " "
ui_print "Dispositivo: Samsung A24 (Enfoque)"
ui_print " "
ui_print "ADVERTENCIA:"
ui_print "Este módulo es experimental."
ui_print "¡AJUSTA ZRAM EN service.sh!"
ui_print "Úsalo bajo tu propio riesgo."
ui_print " "

# Establecer permisos para los scripts
# Necesitamos asegurarnos de que set_perm_recursive esté disponible o usar chmod
# find $MODDIR -type d -exec chmod 755 {} \;
# find $MODDIR -type f -exec chmod 644 {} \;
# chmod 755 $MODDIR/service.sh
set_perm_recursive() {
  find "$1" -type d 2>/dev/null | while read dir; do
    chown $2:$3 "$dir"
    chmod $4 "$dir"
  done
  find "$1" -type f 2>/dev/null | while read file; do
    chown $2:$3 "$file"
    chmod $5 "$file"
  done
}

set_perm_recursive $MODDIR 0 0 0755 0644 # u:rwx g:rx o:rx / u:rw g:r o:r

# Permiso de ejecución para service.sh
chmod 755 $MODDIR/service.sh

ui_print "Permisos establecidos."
ui_print "Instalación completada."
ui_print "¡IMPORTANTE! Edita service.sh si necesitas cambiar ZRAM o Whitelist."
ui_print "Reinicia para aplicar los cambios."
