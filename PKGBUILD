# Maintainer: Fernando Ayats <ayatsfer[at]gmail[dot]com>
groups=('modified')
pkgname=qemu-android-x86
_pkgver="7.1-r5"
pkgver=7.1.r5
pkgrel=0
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
source=("android-x86-${_pkgver}.${arch}.rpm::https://osdn.mirror.constant.com//android-x86/67834/android-x86-7.1-r5.x86_64.rpm"
		"qemu-android.svg"
		"qemu-android"
		"config"
		"qemu-android.desktop")
sha256sums=('31efd1a4fa9549a91cacb7bdcb256a057158aa57aec632e41922664cedc7cd39'
            '8c80b881727efc8831c8ef53806e7c1d0427607e145aae09061c4870b6cd402f'
            'e4be5cc20fe79ef2fbc8f9784ca176eaf6a24b3f2904eaec0acdc3a6e928a4f1'
            '6561c407a3c90b2b7fb300a63eaa182cf342821acd7f7d180f52d67502ad3d12'
            'afb26843bd3bdcc9445438cf08b8efca3918fe5e6d82b24c6a657e0c9ef5ad93')

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
