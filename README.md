# qemu-android-x86

This is a modified version from [https://aur.archlinux.org/packages/qemu-android-x86/](https://aur.archlinux.org/packages/qemu-android-x86/)

Changes include:
- Offer different Android Versions, which includes houdini support (ARM translation layer)
- Set up ADB connection, configurable via NETPORT config. Default is port 47000 with user networking, so the command to connect would be `$ adb connect localhost:47000`
- Read + Write system image. This is done by unsquashing the original image.

## Installation

### Arch Linux
- Download the latest revision for your selected Android Version from the releases page

- Unpack the tarball, and install it as any other package

   `$ makepkg -sric`


### Gentoo Linux

Ebuilds available in my [overlay](https://github.com/viperML/viperML-overlay/).


## Usage

Either:
  - Run `$ qemu-android` from your terminal
  - Run qemu-android from your start menu / app launcher. You need to configure the
    TERMINAL variable if using this method.

(Optional) To enable support for ARM apps:
    <!-- TODO: per version guide -->
  - In Android, Settings > Apps compatibility > Enable native bridge > Reboot
  - Use the provided shell (or via a terminal emulator app):
    - Remount /system as writable `# mount -o rw,remount /system`
    - Manually pull houdini `# wget http://dl.android-x86.org/houdini/7_y/houdini.sfs -O /system/etc/houdini7_y.sfs`
    - Modify...
      - `# vi /system/bin/enable_nativebridge`
      - Add `v=7_y` after the first `if` statement
    - Finally run `# enable_nativebridge`, no output should come out (don't ask me why that script is so broken...)
