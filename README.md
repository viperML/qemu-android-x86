# qemu-android-x86

This is a modified version from [https://aur.archlinux.org/packages/qemu-android-x86/](https://aur.archlinux.org/packages/qemu-android-x86/)

Changes include:

- Easy install any Android version
- Read + Write system
- ADB connection out of the box (`adb connect localhost:47000`)
- Removed GUI support for simplicity

## Installation

First, create the `qemu-android-x86` group in your system:

```sh
$ sudo groupadd qemu-android-x86
$ sudo usermod -a -G qemu-android-x86 $USER
# Reboot your system
```

Download any `android-x86-<version>.x86_64.rpm` from upstream: [https://osdn.net/projects/android-x86/releases](https://osdn.net/projects/android-x86/releases) and place it in this directory with the name `android.rpm`. Alternatively, you can specify the variable `SOURCE_RPM` to `make`.

Finally, install the package:

```sh
$ make
$ sudo make install
```



## Usage

Open a terminal and run:

```
$ qemu-android-x86
```

- When setting up the device, select `VirtWifi`

- To enable ARM support, run in the same terminal:

  ```
  # enable_nativebridge
  ```

  Then enable native bridge under Settings > Apps compatibility and reboot the VM.

- To connect via adb, run:

  ```sh
  $ adb connect localhost:<NETPORT> # as set in your config file
  ```

## Dependencies

- Runtime dependencies:
  - qemu (witch virgl support)
  - bash

- Build dependencies:
  - squashfs-tools
  - rpm2targz
