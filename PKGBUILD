# Maintainer: Fernando Ayats <ayatsfer[at]gmail[dot]com>
groups=('modified')
pkgname=qemu-android-x86
_pkgver="9.0-r2"
pkgver=9.0.r2
pkgrel=3
pkgdesc="Android-x86 environment via QEMU and VirGL"
arch=("x86_64")
url="http://www.android-x86.org/"
license=('Apache' 'GPL2' 'custom:Creative Commons 3.0 Attribution Unported')
depends=('qemu' 'hicolor-icon-theme')
makedepends=('squashfs-tools')
optdepends=(
    'rxvt-unicode: for GUI support'
    'zenity: for GUI support')
install="qemu-android-x86.install"
source=("android-x86-${_pkgver}.${arch}.rpm::https://osdn.net/frs/redir.php?m=constant&f=android-x86%2F71931%2Fandroid-x86-${_pkgver}.${arch}.rpm"
		"https://upload.wikimedia.org/wikipedia/commons/d/d7/Android_robot.svg"
		"qemu-android"
		"config"
		"qemu-android.desktop")
sha256sums=('6e54e25d945e050cf6a6ad2ac3e0775add04b1d586989e29276499c8d11e629f'
            '8c80b881727efc8831c8ef53806e7c1d0427607e145aae09061c4870b6cd402f'
            '455ed7ef3db79aa183d3f99219892c42f949d64be62a81236c6269ff6076c9f0'
            '814171660aaee37c417cb9cedfe47b756f8bce59ce0940a304935d4f748995d1'
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

    install -Dm0644 "$srcdir/config" "$srcdir/android-${_pkgver}"/* -t "$pkgdir/usr/share/android-x86"
    install -Dm0644 "$srcdir/usr/bin/qemu-android" "$pkgdir/usr/share/android-x86/original.qemu-android"
    install -Dm0644 "$srcdir/qemu-android.desktop" "$pkgdir/usr/share/applications/qemu-android.desktop"
    install -Dm0755 "$srcdir/qemu-android" "$pkgdir/usr/bin/qemu-android"

    install -Dm0644 "$srcdir/Android_robot.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/qemu-android.svg"

}
