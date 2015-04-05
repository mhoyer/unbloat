#!/sbin/sh
#
# /system/addon.d/91-sounds.sh
# Removes camera sounds after an upgrade

source uiprint.sh

case "$1" in
  backup)
    # Stub
  ;;
  restore)
    ui_print "Deleting sounds..."
    rm "$S/media/audio/ui/camera_click.ogg"
    rm "$S/media/audio/ui/camera_focus.ogg"
    rm "$S/media/audio/ui/VideoRecord.ogg"
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
    # Stub
  ;;
esac
