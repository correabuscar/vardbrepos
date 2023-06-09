# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT=977b14a7c1295ebf2aad2f807d3f8e7c27aeb47f

inherit elisp

DESCRIPTION="Major mode for editing Raku code"
HOMEPAGE="https://github.com/Raku/raku-mode/"
SRC_URI="https://github.com/Raku/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}"/${PN}-${COMMIT}

LICENSE="GPL-3+"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="test? ( app-emacs/ert-runner )"

DOCS=( CHANGELOG.md README.md README.tmp-imenu-notes )
SITEFILE="50${PN}-gentoo.el"

src_test() {
	ert-runner -L . -L test --reporter ert+duration --script test || die
}
