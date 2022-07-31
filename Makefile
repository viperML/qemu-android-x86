.PHONY: all clean install
DESTDIR ?=
PREFIX ?= /usr/local
images=system.img initrd.img ramdisk.img kernel
SOURCE_RPM ?= ${SOURCE_RPM}

M4FLAGS = -D _INSTALLDIR=$(DESTDIR)$(PREFIX)

all: qemu-android-x86

$(images): system.sfs
	unsquashfs -f -d . system.sfs

system.sfs: android.tar
	tar --strip-components=2 -xpvf android.tar

android.tar:
	rpm2tar -S $(SOURCE_RPM) -O > android.tar

clean:
	rm -rf bin squashfs-root system.sfs android.tar $(images) qemu-android-x86

qemu-android-x86: qemu-android-x86.in
	m4 ${M4FLAGS} qemu-android-x86.in > qemu-android-x86

install: all
	install -dm755 $(DESTDIR)$(PREFIX)/share/qemu-android-x86
	install -Dm0664 $(images) $(DESTDIR)$(PREFIX)/share/qemu-android-x86

	install -Dm0755 qemu-android-x86 $(DESTDIR)$(PREFIX)/bin/qemu-android-x86
	install -Dm0644 config $(DESTDIR)$(PREFIX)/share/qemu-android-x86/config
	install -Dm0644 qemu-android-x86.desktop $(DESTDIR)$(PREFIX)/share/applications/qemu-android-x86.desktop
	install -Dm0644 qemu-android-x86.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/qemu-android-x86.svg
