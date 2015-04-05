# unbloat

Script for removing bloatware from Android after CM11/12 update (w/ CyanDelta).

Based on: [XDA: Addon.d script for Xposed to survive CM12 flashes](http://forum.xda-developers.com/xposed/addon-d-script-xposed-to-survive-cm12-t3036886)

## Installation

Copy the files in ```system/addon.d/``` to your Android device under ```/system/addon.d/``` and update file permissions on the device:

    adb push system/addon.d/81-Xposed.sh /system/addon.d/
    adb push system/addon.d/91-sounds.sh /system/addon.d/
    adb push system/addon.d/92-bloatware.sh /system/addon.d/
    adb push system/addon.d/uiprint.sh /system/addon.d/
    adb shell chmod 755 /system/addon.d/*.sh
    adb shell ls -la /system/addon.d/

Thus, it should look similar like this afterwards:

    $> adb shell ls -la /system/addon.d/
    drwxr-xr-x    2 root     root          4096 Apr  5 11:24 .
    drwxr-xr-x   17 root     root          4096 Apr  5 11:24 ..
    -rwxr-xr-x    1 root     root           680 Mar 11 09:59 50-cm.sh
    -rwxr-xr-x    1 root     root          6519 Mar 11 23:49 70-gapps.sh
    -rwxr-xr-x    1 root     root          3478 Apr  3 06:11 81-Xposed.sh
    -rwxr-xr-x    1 root     root           431 Apr  2 17:54 91-sounds.sh
    -rwxr-xr-x    1 root     root          1458 Apr  5 11:23 92-bloatware.sh
    -rwxr-xr-x    1 root     root           132 Mar 11 09:59 blacklist
    -rwxr-xr-x    1 root     root           565 Apr  5 11:18 uiprint.sh

Now whenever you flash a CM update those scripts will/should be executed.

Tested with TWRP 2.8.5.0 on CM12 for I9505 (jfltexx).

## Troubleshooting

After running the CM flash check the ```/tmp/recovery.log``` while still in recovery mode:

    adb shell cat /tmp/recovery.log
