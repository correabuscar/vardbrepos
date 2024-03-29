# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Andrew McMillan's Web Libraries"
HOMEPAGE="https://gitlab.com/davical-project/awl"
SRC_URI="https://www.davical.org/downloads/${PN}_${PV}.orig.tar.xz -> ${P}.tar.xz"

USE_PHP="php8.0 php8.1"

LICENSE="GPL-2 GPL-2+ GPL-3+ LGPL-2+ LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="test? ( dev-php/phpunit )"
RDEPEND="dev-lang/php:*[pdo,xml]"

S="${WORKDIR}"

src_compile() {
	:
}

src_test() {
	local slot
	for slot in ${USE_PHP//-/.} ; do
		if [[ -x /usr/bin/${slot} ]] ; then
			${slot} "${EPREFIX}"/usr/bin/phpunit --verbose --do-not-cache-result tests/ \
				|| die "test suite failed"
		fi
	done
}

src_install() {
	einstalldocs
	insinto /usr/share/php/${PN}
	doins -r dba inc
}
