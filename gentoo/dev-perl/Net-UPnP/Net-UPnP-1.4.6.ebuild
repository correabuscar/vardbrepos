# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=SKONNO
inherit perl-module

DESCRIPTION="Perl extension for UPnP"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc x86"

IUSE="examples"

RDEPEND="
	virtual/perl-version
"
BDEPEND="${RDEPEND}
	dev-perl/Module-Build
	test? ( virtual/perl-Test-Simple )
"

src_install() {
	perl-module_src_install
	if use examples; then
		dodir usr/share/doc/${PF}/examples
		docompress -x usr/share/doc/${PF}/examples
		insinto usr/share/doc/${PF}/
		doins -r examples/
	fi
}
