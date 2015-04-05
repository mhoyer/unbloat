#!/sbin/sh
#
# /system/addon.d/81-Xposed.sh
# During a CM12 upgrade, this script backs up Xposed framework files.
# /system is formatted and reinstalled, then the files are restored.
# Thread: http://forum.xda-developers.com/xposed/addon-d-script-xposed-to-survive-cm12-t3036886
# Author: Adlx.XDA
#

source uiprint.sh

. /tmp/backuptool.functions

list_files() {
cat <<EOF
bin/app_process32_xposed
bin/dex2oat
bin/oatdump
bin/patchoat
framework/XposedBridge.jar
lib/libart-compiler.so
lib/libart-disassembler.so
lib/libart.so
lib/libsigchain.so
lib/libxposed_art.so
bin/app_process64_xposed
lib64/libart.so
lib64/libart-compiler.so
lib64/libart-disassembler.so
lib64/libsigchain.so
lib64/libxposed_art.so
xposed.prop
EOF
}

case "$1" in
  backup)
    ui_print "STARTING TO BACKUP XPOSED"
    list_files | while read FILE DUMMY; do
      ui_print backup_file $S/"$FILE"
      backup_file $S/"$FILE"
    done
    ls -al /tmp
    ui_print "ENDING TO BACKUP XPOSED"
  ;;
  restore)
    ui_print "STARTING TO RESTORE XPOSED"
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
      ui_print $S/$FILE $( ls -alZ $S/$FILE )
    done
    ui_print "ENDING TO RESTORE XPOSED"
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
ui_print "STARTING POST-RESTORE XPOSED"
# /system/bin/app_process32_xposed
chmod 0755 /system/bin/app_process32_xposed
chown root:shell /system/bin/app_process32_xposed
chcon u:object_r:zygote_exec:s0 /system/bin/app_process32_xposed
# /system/bin/app_process64_xposed
chmod 0755 /system/bin/app_process64_xposed
chown root:shell /system/bin/app_process64_xposed
chcon u:object_r:zygote_exec:s0 /system/bin/app_process64_xposed
# /system/bin/dex2oat
chmod 0755 /system/bin/dex2oat
chown root:shell /system/bin/dex2oat
chcon u:object_r:dex2oat_exec:s0 /system/bin/dex2oat
# /system/bin/oatdump
chmod 0755 /system/bin/oatdump
chown root:shell /system/bin/oatdump
chcon u:object_r:system_file:s0 /system/bin/oatdump
# /system/bin/patchoat
chmod 0755 /system/bin/patchoat
chown root:shell /system/bin/patchoat
chcon u:object_r:dex2oat_exec:s0 /system/bin/patchoat
# /system/framework/XposedBridge.jar
chmod 0644 /system/framework/XposedBridge.jar
chown root:root /system/framework/XposedBridge.jar
chcon u:object_r:system_file:s0 /system/framework/XposedBridge.jar
# /system/lib/libart-compiler.so
chmod 0644 /system/lib/libart-compiler.so
chown root:root /system/lib/libart-compiler.so
chcon u:object_r:system_file:s0 /system/lib/libart-compiler.so
# /system/lib/libart-disassembler.so
chmod 0644 /system/lib/libart-disassembler.so
chown root:root /system/lib/libart-disassembler.so
chcon u:object_r:system_file:s0 /system/lib/libart-disassembler.so
# /system/lib/libart.so
chmod 0644 /system/lib/libart.so
chown root:root /system/lib/libart.so
chcon u:object_r:system_file:s0 /system/lib/libart.so
# /system/lib/libsigchain.so
chmod 0644 /system/lib/libsigchain.so
chown root:root /system/lib/libsigchain.so
chcon u:object_r:system_file:s0 /system/lib/libsigchain.so
# /system/lib/libxposed_art.so
chmod 0644 /system/lib/libxposed_art.so
chown root:root /system/lib/libxposed_art.so
chcon u:object_r:system_file:s0 /system/lib/libxposed_art.so
# /system/xposed.prop
chmod 0644 /system/xposed.prop
chown root:root /system/xposed.prop
chcon u:object_r:system_file:s0 /system/xposed.prop
ui_print "DONE POST-RESTORE XPOSED"
  ;;
esac
