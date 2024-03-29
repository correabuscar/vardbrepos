# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

# Upstream-package has no version in it's name.
# We therefore repackage it directly, together with the patches.
PATCH_LEVEL="2"

DESCRIPTION="Trace and analyze memory leaks in C++ programs"
HOMEPAGE="https://andreasen.org/LeakTracer/"
SRC_URI="mirror://gentoo/${P}-gentoo_p${PATCH_LEVEL}.tbz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

DEPEND="dev-lang/perl
	dev-debug/gdb"
RDEPEND="${DEPEND}"

# leaktracer is being realized using LD_PRELOAD and segfaults
# when being run in the sandbox and the library is _not_ in
# /usr/$(get_libdir) which is not possible before installation
RESTRICT="test"

src_prepare() {
	eapply -p1 "${WORKDIR}/patches/01_all_gcc-cflags.patch"
	eapply -p0 "${WORKDIR}/patches/05_all_libdir.patch"
	eapply -p1 "${WORKDIR}/patches/15_all_printf.patch"

	sed -i \
		-e "s|%LIBDIR%|$(get_libdir)|" \
		LeakCheck || die "sed for setting lib path failed"

	eapply_user
}

src_compile() {
	emake CXX="$(tc-getCXX)"
}

src_install() {
	dobin LeakCheck leak-analyze
	dolib.so LeakTracer.so
	dodoc README test.cc
	docinto html
	dodoc README.html
}

pkg_postinst() {
	elog "To use LeakTracer, run LeakCheck my_prog and then leak-analyze my_prog leak.out"
	elog "Please refer to README file for more info."
}
