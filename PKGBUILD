# Maintainer: Fernando Ayats <ayatsfer[at]gmail[dot]com>
groups=('modified')
pkgname=qemu-android-x86
_pkgver="9.0-r2"
pkgver=9.0.r2
pkgrel=4
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
		"qemu-android.svg"
		"qemu-android"
		"config"
		"qemu-android.desktop")
sha256sums=('6e54e25d945e050cf6a6ad2ac3e0775add04b1d586989e29276499c8d11e629f'
            '8c80b881727efc8831c8ef53806e7c1d0427607e145aae09061c4870b6cd402f'
            '8fc3b556487c2466f69f8d6e519f7ac656908117151293d8b3e4296a8fbbeb05'
            '144a1f55fcf84d3909fd8228bbc5854086adec70a6bdec2465c334a9f0a3064b'
            '144a1f55fcf84d3909fd8228bbc5854086adec70a6bdec2465c334a9f0a3064b')

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

    install -Dm0644 "$srcdir/qemu-android.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/qemu-android.svg"

}
