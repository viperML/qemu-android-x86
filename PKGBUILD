# Maintainer: Fernando Ayats <ayatsfer[at]gmail[dot]com>
groups=('modified')
pkgname=qemu-android-x86
_pkgver="7.1-r5"
pkgver=7.1_r5
pkgrel=1
pkgdesc="Android-x86 environment via QEMU and VirGL"
arch=("x86_64")
url="http://www.android-x86.org/"
license=('Apache' 'GPL2' 'custom:Creative Commons 3.0 Attribution Unported')
depends=('rxvt-unicode' 'zenity' 'qemu' 'hicolor-icon-theme') 
makedepends=('inkscape' 'squashfs-tools')
install="qemu-android-x86.install"
source=("android-x86-${_pkgver}.${arch}.rpm::https://osdn.mirror.constant.com//android-x86/67834/android-x86-7.1-r5.x86_64.rpm"
		"https://upload.wikimedia.org/wikipedia/commons/d/d7/Android_robot.svg"
		"qemu-android"
		"config"
		"qemu-android.desktop")
sha256sums=('31efd1a4fa9549a91cacb7bdcb256a057158aa57aec632e41922664cedc7cd39'
            '8c80b881727efc8831c8ef53806e7c1d0427607e145aae09061c4870b6cd402f'
            '2ac5f992a293012471a0e6f4e9b1192007614c7bef4de4231a63b79e5c76cbed'
            'b8dd746aa074ac5c24e5b3dd31cd4bb783ffb0992df66d63229edb20c5522e38'
            '8a5ed6a6c1a4dfd1c8af0ff5de48965ec2dc6b50f87e5f990d33c7025f63c8ec')

#PKGEXT=".pkg.tar"

build() {
    cd "android-${_pkgver}"
    unsquashfs system.sfs
    mv squashfs-root/system.img .
    rm -rf squashfs-root
    rm system.sfs
}

package() {

	mkdir -p $pkgdir/usr/share/android-x86 $pkgdir/usr/bin $pkgdir/usr/share/applications
	install -m0644 $srcdir/android-${_pkgver}/* $pkgdir/usr/share/android-x86
	install -m0644 $srcdir/usr/bin/qemu-android $pkgdir/usr/share/android-x86/original.qemu-android
	install -m0644 $srcdir/config $pkgdir/usr/share/android-x86
	install -m0644 $srcdir/qemu-android.desktop $pkgdir/usr/share/applications
	install -m0755 $srcdir/qemu-android $pkgdir/usr/bin/qemu-android

	iconsizes=(16 32 64 128 256 512)
	for size in "${iconsizes[@]}"; do
		mkdir -p $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps
		inkscape -o $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/qemu-android.png -w $size -h $size $srcdir/Android_robot.svg
	done

}
