#!/data/adb/magisk/busybox ash
. "${MODPATH}/scripts/tinyutils.sh"

log "ENTRYPOINT load_animation.sh"

if [ "${MODPATH}" == "" ]; then
    ui_print "there is no \$MODPATH. Dang it :("
    echo     "there is no \$MODPATH. Dang it :("
fi

log "CHECKPOINT line 11"

rm "${drop_file}"

if [ "${BOOTMODE}" = "false" ]; then
    # I can't test this crap
    ui_print "Please run this module from userspace. It's hard to load a cfgfile from an encrypted filesystem"
elif [ "${bootanimation}" == "" ]; then
    ui_print "The Bootanimation is unset. Set one by filename in /sdcard/config/bootanimation.txt"
else
    if [ -f ${animation_file} ]; then
        ui_print "Installing Animation '${animation_file}'"
        cp "${animation_file}" "${drop_file}"
        error="$?"
        if [ "${error}" != "0" ]; then
            ui_print "Error Code: $?"
        else
            ui_print "Installed Successfully!"
        fi
    else
        ui_print "${animation_file} is not a file. '${bootanimation}' has either been removed or was invalid from the start."
    fi
    if [ -f "${animation_cred}" ]; then
        cat "${animation_cred}"
    fi
fi
log "EXIT load_animation.sh"
