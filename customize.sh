#!/data/adb/magisk/busybox ash
DEBUG=false

if [ "$DEBUG" == "true" ]; then
    # we ARE invoking UI_print, but it's fine coz this is customize.sh
    ui_print "TU:"
    cat "${MODPATH}/scripts/tinyutils.sh"
    echo "${MODPATH}/scripts/tinyutils.sh"
    ui_print "====="
fi
. "${MODPATH}/scripts/tinyutils.sh"

log "ENTRYPOINT Customize.sh"

for i in $(seq 1 5); do
    ui_print ""
done

. "${MODPATH}/scripts/main.sh"
. "${MODPATH}/scripts/telem.sh"
mcat "${MODPATH}/strings/animlist.txt"
ui_print ""
mcat     "${MODPATH}/strings/credits.txt"
ui_print ""
ui_print "============================================================================="

log "Magisktmp=$MAGISKTMP"
. "${MODPATH}/scripts/cleanup.sh"
log "EXIT Customize.sh"

# this is a debug statement, but eh
ui_print "Done, enjoy!"
