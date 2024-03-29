# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Atmospheric Modelling for ALMA Observatory"
HOMEPAGE="https://svn.cv.nrao.edu/view/aatm/devel/casa/"
# tar ball is made from the HOMEPAGE and running ./configure && make dist
SRC_URI="https://dev.gentoo.org/~bicatali/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0/4"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc static-libs"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-libs/boost:=
	doc? ( app-text/doxygen[dot] )"

src_configure() {
	econf $(use_enable static-libs static)
}

src_compile() {
	emake
	use doc && doxygen doc/developer.doxy
}

src_install() {
	default

	if ! use static-libs; then
		find "${ED}" -name '*.la' -delete || die
	fi

	if use doc; then
		dodoc -r developer/html
		docompress -x /usr/share/doc/${PF}/html
	fi
}
