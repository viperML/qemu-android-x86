# qemu-android-x86

This is a modified version from [https://aur.archlinux.org/packages/qemu-android-x86/](https://aur.archlinux.org/packages/qemu-android-x86/)

Changes include:

- Easy install any Android version
- Read + Write system
- ADB connection out of the box (`adb connect localhost:47000`)
- Removed GUI support for simplicity

## Installation

First, create the `qemu-android` group in your system:

```
$ sudo groupadd qemu-android
$ sudo usermod -a -G qemu-android $USER
# Reboot your system
```

Download any `android-x86-<version>.x86_64.rpm` from upstream: [https://osdn.net/projects/android-x86/releases](https://osdn.net/projects/android-x86/releases) and place it in this directory with the name `android.rpm`.

Finally, install the package:

```
$ make
$ sudo make install
```



## Usage

Open a terminal and run:

```
$ qemu-android
```

- When setting up the device, select `VirtWifi`

- To enable ARM support, run in the same terminal:
-
  ```
  # enable_nativebridge
  ```

  And enable native bridge under Settings > Apps compatibility

- To connect via adb, run:

  ```sh
  $ adb connect localhost:<NETPORT> # as set in your config file
  ```

## Dependencies

- Runtime dependencies:
  - bash
  - qemu

- Build dependencies:
  - squashfs-tools
  - rpm2targz

## Uninstall

Remove `/var/lib/qemu-android-x86`, `/usr/bin/qemu-android`, `/usr/share/qemu-android-x86`,
`$HOME/.config/qemu-android-x86`, and remove the `qemu-android` group.
