# Find correct pipe file descriptor of updated process to print to recovery UI.
# It's actually the second parameter of this process:
#
#  PID USER       VSZ STAT COMMAND
# 7849 root      456m S    /tmp/updater 3 37 /sdcard/Cyandelta/cm-12-20150404-N
#
# Source: http://forum.xda-developers.com/showthread.php?t=1023150
#

OUTFD=$(ps | grep -v "grep" | grep -o -E "updater(.*)" | cut -d " " -f 3);

ui_print() {
  if [ "$OUTFD" != "" ]; then
    echo -n -e "ui_print $*\n" > /proc/self/fd/$OUTFD
    echo -n -e "ui_print\n" > /proc/self/fd/$OUTFD
  fi

  echo $*
}
