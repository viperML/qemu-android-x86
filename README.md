# qemu-android-x86

This is a modified version from [https://aur.archlinux.org/packages/qemu-android-x86/](https://aur.archlinux.org/packages/qemu-android-x86/).

Changes include:
- Downgraded Android x86 to 7.1-r5, which includes houdini support (ARM translation layer)
- Set up ADB connection, configurable via NETPORT config. Default is port 47000 with user networking, so the command to connect would be `$ adb connect localhost:47000`
- Unsquash system.sfs into system.img, then copy it to user config directory (configurable path with SYSTEMIMG) so it can be modified.

## Installation
1. Clone this repo
2. Build and install the package `makepkg -sric`
3. Copy the default config `mkdir ~/.config/android-x86` ; cp /usr/share/android-x86/config ~/.config/android-x86/``
4. Run `qemu-android` from your console or with the included .desktop file
5. (Optional) To enable support for ARM apps:
  - In Android, Settings > Apps compatibility > Enable native bridge (? reboot)
  - In a android terminal, or via your pc, remount /system as writable `mount -o rw,remount /system`
  - Manually pull houdini `wget http://dl.android-x86.org/houdini/7_y/houdini.sfs -O /system/etc/houdini7_y.sfs`
  - Run `enable_nativebridge`, no output should come out
