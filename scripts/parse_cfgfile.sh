#!/data/adb/magisk/busybox ash
. "${MODPATH}/scripts/tinyutils.sh"
log "ENTRYPOINT parser"

cfgfile="/sdcard/config/bootanimation.txt"

if [ ! -f "${cfgfile}" ]; then
    mkdir -p "$(dirname "${cfgfile}")"
    cp "${MODPATH}/strings/default_conf.txt" "${cfgfile}"
fi

if [ "$(cat "${cfgfile}" | wc -l)" -eq 1 ] && ! grep "=" "${cfgfile}" > /dev/null; then
    log "loading legacy cfg"
    unsafe_bootanimation="$(cat "${cfgfile}")"
elif [ -f "$cfgfile" ]; then
    while IFS='=' read -r key value; do
        export "cfg_$key=$value"
        log "cfg_$key=$value"
    done < "$cfgfile"
   unsafe_bootanimation="${cfg_anim}"
fi

telemetry="${cfg_telemetry:-true}"
bootanimation="$(basename "${unsafe_bootanimation}")"
bootanimation="${bootanimation:-lavalamp}"
animation_file="${MODPATH}/anims/${bootanimation}.zip"
animation_cred="${MODPATH}/strings/anim_credits/${bootanimation}.txt"
drop_file="${MODPATH}/system/product/media/bootanimation.zip"
log "Telem: $telemetry"
log "Unsafe BA: $unsafe_bootanimation"
log "BA: $bootanimation"
