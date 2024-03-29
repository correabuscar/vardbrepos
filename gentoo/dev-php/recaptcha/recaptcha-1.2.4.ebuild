# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="PHP client library for Google's reCAPTCHA service"
HOMEPAGE="https://github.com/google/recaptcha"
SRC_URI="https://github.com/google/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples test"
RESTRICT="!test? ( test )"

RDEPEND="dev-lang/php"
BDEPEND="test? ( ${RDEPEND} <dev-php/phpunit-8 )"

src_install() {
	insinto "/usr/share/php/${PN}"
	doins -r src/autoload.php src/ReCaptcha
	dodoc CONTRIBUTING.md README.md
	use examples && dodoc -r examples
}

src_test() {
	phpunit || die "test suite failed"
}

pkg_postinst() {
	elog "${PN} has been installed in /usr/share/php/${PN}/."
	elog "To use it in a script, require('${PN}/autoload.php'),"
	elog "and then use the ${PN} class normally. Most of the examples in"
	elog "the documentation should work without further modification."
}
