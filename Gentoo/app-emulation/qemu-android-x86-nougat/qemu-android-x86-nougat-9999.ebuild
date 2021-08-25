# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm git-r3 xdg-utils

DESCRIPTION="Android-x86 environment via QEMU and VirGL"
HOMEPAGE="https://github.com/viperML/qemu-android-x86"
SRC_URI="https://osdn.mirror.constant.com//android-x86/67834/android-x86-7.1-r5.x86_64.rpm"
EGIT_REPO_URI="https://github.com/viperML/qemu-android-x86.git"
EGIT_BRANCH="testing"

LICENSE="GPL-2 Apache-2.0 CC0-1.0"
SLOT="0"
IUSE="+rwsystem +gtk"


RDEPEND="
app-emulation/qemu[qemu_softmmu_targets_x86_64,qemu_user_targets_x86_64,virtfs,virgl,sdl,sdl-image,virtfs,vhost-net]
gtk? ( gnome-extra/zenity  )
"
DEPEND="${RDEPEND}"
BDEPEND="
rwsystem? ( sys-fs/squashfs-tools )
"

src_unpack() {
	# Mixed Git+Binaries, so unpack and move into git repo root
 	rpm_src_unpack ${A}
	mv android-7.1-r5 "${WORKDIR}/${P}"
	git-r3_fetch
	git-r3_checkout
}

src_prepare() {
	default
	if use rwsystem ; then
		unsquashfs system.sfs
	else
		mv system.sfs system.img
	fi
}

src_install() {
	dobin qemu-android

	insinto /usr/share/android-x86
	doins config
	doins initrd.img
	doins kernel
	doins ramdisk.img

	if use rwsystem ; then
		doins squashfs-root/system.img
	else
		doins system.img
	fi

	if use gtk ; then
		insinto /usr/share/applications
		doins qemu-android.desktop
		insinto /usr/share/icons/hicolor/scalable/apps
		doins qemu-android.svg
	fi

	elog "WARNING: Required qemu USE flags are not thoroughfully tested!!!"
}

pkg_postinst() {
	if use gtk ; then
		xdg_icon_cache_update
	fi
}
