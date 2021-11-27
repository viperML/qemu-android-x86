.PHONY: all clean install
DESTDIR=
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
	install -dm755 $(DESTDIR)/var/lib/qemu-android-x86
	install -Dm0664 -g qemu-android-x86 $(images) $(DESTDIR)/var/lib/qemu-android-x86
	install -Dm0755 qemu-android-x86 $(DESTDIR)/usr/bin/qemu-android-x86
	install -Dm0644 config $(DESTDIR)/usr/share/qemu-android-x86/config
	install -Dm0644 qemu-android-x86.desktop $(DESTDIR)/usr/share/applications/qemu-android-x86.desktop
	install -Dm0644 qemu-android-x86.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/qemu-android-x86.svg
