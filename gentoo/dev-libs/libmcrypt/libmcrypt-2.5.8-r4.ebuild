# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Provides an uniform interface to access several encryption algorithms"
HOMEPAGE="https://mcrypt.sourceforge.net"
SRC_URI="mirror://sourceforge/mcrypt/${P}.tar.gz"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~mips ppc ppc64 ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"

DOCS=(
	AUTHORS NEWS README THANKS TODO ChangeLog
	doc/README.config doc/README.key doc/README.xtea
	doc/example.c
)

PATCHES=(
	"${FILESDIR}/${P}-rotate-mask.patch"
	"${FILESDIR}/${P}-autoconf-2.70.patch" #775113
)

src_prepare() {
	default
	mv configure.in configure.ac
	mv libltdl/configure.in libltdl/configure.ac
	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac libltdl/configure.ac || die
	eautoreconf # need new libtool for interix (elibtoolize would suffice for freebsd)
}
