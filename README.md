# qemu-android-x86

This is a modified version from [https://aur.archlinux.org/packages/qemu-android-x86/](https://aur.archlinux.org/packages/qemu-android-x86/).

Changes include:
- Downgraded Android x86 to 7.1-r5, which includes libhoudini support.
- Set up ADB connection, configurable via NETPORT config. Default is port 47000 with user networking, so the command to connect would be `$ adb connect localhost:47000`
- Unsquash system.sfs into system.img, then copy it to user config directory (configurable path with SYSTEMIMG) so it can be modified. Android will still mount it as read-only, but can be remounted with `# mount -o rw,remount /system`. Then you enable Native Bridge in Android settings and run `# /system/bin/enable_nativebridge` to pull libhoudini.