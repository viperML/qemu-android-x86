.PHONY: all clean install
TARGET=/var/lib/qemu-android-x86
images=system.img initrd.img ramdisk.img kernel

all: system.img

system.img: system.sfs
	unsquashfs -f -d . system.sfs

system.sfs: android.tar
	tar --strip-components=2 -xpvf android.tar

android.tar:
	rpm2tar -S android.rpm -O > android.tar

clean:
	rm -rf bin squashfs-root  system.sfs android.tar $(images)

install:
	install -Dm0664 -o root -g qemu-android $(images) $(TARGET)
	install -Dm0755 qemu-android /usr/bin/qemu-android
	install -Dm0644 config /usr/share/qemu-android-x86/config
