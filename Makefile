.PHONY: all clean install
IMAGES_TARGET=/var/lib/qemu-android-x86
images=system.img initrd.img ramdisk.img kernel
SOURCE_RPM?=android.rpm

all: system.img

system.img: system.sfs
	unsquashfs -f -d . system.sfs

system.sfs: android.tar
	tar --strip-components=2 -xpvf android.tar

android.tar:
	rpm2tar -S $(SOURCE_RPM) -O > android.tar

clean:
	rm -rf bin squashfs-root system.sfs android.tar $(images)

install:
	install -dm755 $(IMAGES_TARGET)
	install -Dm0664 -o root -g qemu-android-x86 $(images) $(IMAGES_TARGET)
	install -Dm0755 qemu-android-x86 /usr/bin/qemu-android-x86
	install -Dm0644 config /usr/share/qemu-android-x86/config
	install -Dm0644 qemu-android-x86.desktop /usr/share/applications/qemu-android-x86.desktop
	install -Dm0644 qemu-android-x86.svg /usr/share/icons/hicolor/scalable/apps/qemu-android-x86.svg
