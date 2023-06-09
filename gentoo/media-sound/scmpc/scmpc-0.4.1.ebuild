# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="a client for MPD which submits your tracks to last.fm"
HOMEPAGE="https://cmende.github.io/scmpc/"
SRC_URI="https://dev.gentoo.org/~angelos/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-libs/glib:2
	dev-libs/confuse:=
	media-libs/libmpdclient:=
	net-misc/curl:="
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"
PATCHES=(
	"${FILESDIR}"/${PN}-0.4.1-fno-common.patch
)

src_install() {
	default
	dodoc scmpc.conf.example

	newinitd "${FILESDIR}"/${PN}-2.init ${PN}
	insinto /etc
	insopts -m600
	newins scmpc.conf.example scmpc.conf
}
