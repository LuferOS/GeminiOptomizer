 ########################################################################################
# README / Información Importante
# ########################################################################################
#
# Módulo KernelSU - Optimizador Básico para Samsung A24 (EJEMPLO NO PROBADO)
#
# Autor: LuferOS
# Versión: 1-kernelsu
#
# ADVERTENCIA:
# - Este módulo modifica parámetros del sistema y gestiona procesos usando KernelSU.
# - ÚSALO BAJO TU PROPIO RIESGO. No me hago responsable por inestabilidad,
#   pérdida de datos o cualquier otro problema que pueda surgir.
# - Este es un EJEMPLO y puede requerir ajustes para tu Samsung específico
#   y tu versión de One UI/Android, siente libre de modificar el modulo con MTmanager o tu explorador o terminal de preferencia.
# - Se recomienda encarecidamente hacer una copia de seguridad completa antes de instalar.
# - Monitoriza el comportamiento de tu dispositivo después de la instalación, si detectas anomalias o sobrecalentamiento, abre un hilo y tratare de corregirlo lo antes posible.
#
# Funciones (Intentadas):
# 1. Ajustes de Gestión de Memoria (Swappiness, Cache Pressure)
# 2. Configuración de ZRAM (Tamaño - ¡¡REQUIERE AJUSTE MANUAL PARA TU A24!!)
# 3. Mejora de Entropía (Read/Write Wakeup Thresholds)
# 4. Priorización de Procesos (Foreground App Boost - Básico)
# 5. Limpieza Agresiva de Apps en Segundo Plano (Opcional, ¡CUIDADO!)
# 6. Script de Desinstalación (uninstall.sh) para limpieza básica.
