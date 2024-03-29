# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/bitlbee/bitlbee-steam.git"
	inherit git-r3
else
	SRC_URI="https://github.com/bitlbee/bitlbee-steam/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Steam protocol plugin for BitlBee"
HOMEPAGE="https://github.com/bitlbee/bitlbee-steam"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libgcrypt:0=
	>=net-im/bitlbee-3.4[plugins]"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default

	find "${ED}" -name '*.la' -delete || die
}
