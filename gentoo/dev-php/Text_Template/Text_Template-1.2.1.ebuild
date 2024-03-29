# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN="php-text-template"

DESCRIPTION="A simple template engine"
HOMEPAGE="https://phpunit.de"
SRC_URI="https://github.com/sebastianbergmann/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm ~hppa ppc ppc64 ~s390 sparc x86"
IUSE=""

S="${WORKDIR}/${MY_PN}-${PV}"

RDEPEND="dev-php/fedora-autoloader
	>=dev-lang/php-5.6:*"

src_install() {
	insinto /usr/share/php/Text/Template
	doins -r src/*
	doins "${FILESDIR}/autoload.php"
}

pkg_postinst() {
	ewarn "This library now loads via /usr/share/php/Text/Template/autoload.php"
	ewarn "Please update any scripts to require the autoloader"
}
