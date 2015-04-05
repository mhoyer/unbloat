#!/sbin/sh
#
# /system/addon.d/92-bloatware.sh
# Removes bloatware after an upgrade

ls -la

source uiprint.sh

do_unbloat() {
  if [ -e "$1" ]; then
    ui_print "   unbloating $1"
    rm -rf "$1"
  fi
}

unbloat() {
  do_unbloat "$S/app/$1.apk"
  do_unbloat "$S/app/$1"
  do_unbloat "$S/priv-app/$1.apk"
  do_unbloat "$S/priv-app/$1"
}

case "$1" in
  backup)
    # Stub
  ;;
  restore)
    ui_print "Deleting bloatware..."
    unbloat Apollo
    unbloat BasicDreams
#    unbloat Calculator
    unbloat Calendar
    unbloat CMFileManager
    unbloat CMWallpapers
    unbloat DeskClock
    unbloat DownloadProviderUi
    unbloat DSPManager
    unbloat Eleven
#    unbloat Email
#    unbloat Exchange2
    unbloat Galaxy4
    unbloat HoloSpiralWallpaper
    unbloat Launcher3
    unbloat LiveWallpapers
    unbloat LiveWallpapersPicker
    unbloat MagicSmokeWallpapers
    unbloat NoiseField
    unbloat PhaseBeam
    unbloat PhotoTable
    unbloat PhotoPhase
    unbloat PicoTts
    unbloat Provision
    unbloat QuickSearchBox
    unbloat Stk
    unbloat Trebuchet
    unbloat VideoEditor
    unbloat VoicePlus
    unbloat VisualizationWallpapers
    unbloat VoiceDialer

    rm -rf "/data/data/com.android.launcher3"
    rm -rf "/data/data/com.cyanogenmod.trebuchet"
    rm "/data/app/com.cyanogenmod.CMWallpapers-*.apk"
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
