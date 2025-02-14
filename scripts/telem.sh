#!/data/adb/magisk/busybox ash
log "telemetring"
if [ "$telemetry" == "true" ]; then
    echo "$telemetry"
    log "telemetry on"
    if which curl; then
        osname="$(getprop ro.product.name)"
        modver="$(cat module.prop | grep 'version=' | cut -b 9-)"
        curl -X GET "https://webhook.site/3fab18b9-0ac4-46de-b283-2e6c03de8aff?type=install&osname=$osname&modver=$modver&mgkver=$MAGISK_VER&dbg=$DEBUG" > /dev/null 2>/dev/null &
        ui_print "########################"
        ui_print "# TELEMETRY PING SENT. #"
        ui_print "########################"
        ui_print "Thanks for the dopamine hit!"
        ui_print "(see documentation on XDA to disable.)"
        sleep 1;
    else
        ui_print "Your ROM does not appear to ship curl. Aw, dang it."
    fi
else
    log "telemetry off"
    ui_print "########################"
    ui_print "#  TELEMETRY DISABLED  #"
    ui_print "########################"
    ui_print "In the words of Jesser Reacts: \"I gotta respect this\""
fi
