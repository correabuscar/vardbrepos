# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools flag-o-matic linux-info

DESCRIPTION="Dynamic instrumentation of the Linux kernel with BPF and kprobes"
HOMEPAGE="https://github.com/iovisor/ply"
SRC_URI="https://github.com/iovisor/ply/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/iovisor/ply/commit/1bc183af8703023e377f92716ecd3f339ffffd11.patch -> ${P}-arm-build-fix.patch"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 ppc ~riscv"
IUSE="static-libs"
# Bug 733248 file collisions with sys-boot/plymouth:
# /usr/lib64/libply.la
# /usr/lib64/libply.so
RDEPEND="!sys-boot/plymouth"
DEPEND="elibc_musl? ( sys-libs/queue-standalone )"

pkg_pretend() {
	local CONFIG_CHECK="~BPF ~BPF_SYSCALL ~NET_CLS_BPF ~NET_ACT_BPF
		~BPF_JIT ~HAVE_EBPF_JIT ~BPF_EVENTS"

	check_extra_config
}

src_prepare() {
	sed -i "/^AC_INIT/c\AC_INIT(${PN}, ${PV}," configure.ac || die

	default
	eautoreconf
}

src_configure() {
	# -Werror=strict-aliasing
	# https://bugs.gentoo.org/858458
	# https://github.com/iovisor/ply/issues/92
	#
	# Do not trust it with LTO either.
	append-flags -fno-strict-aliasing
	filter-lto

	default
}

src_install() {
	default
	rm -f "${ED}/usr/share/doc/${P}/COPYING"

	if ! use static-libs; then
		find "${D}" -type f -name '*.a' -delete || die
		find "${ED}" -name '*.la' -delete || die
	fi
}
