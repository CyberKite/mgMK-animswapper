#!/data/adb/magisk/busybox ash
MODPATH=$(readlink -f "$0")
MODPATH=$(dirname "$MODPATH")
. "${MODPATH}/scripts/main.sh"
