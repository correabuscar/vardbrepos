# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="X Steps Recorder"
HOMEPAGE="https://github.com/nonnymoose/xsr"
SRC_URI="https://github.com/nonnymoose/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cursor"

RDEPEND="
	dev-lang/perl
	media-gfx/scrot
	cursor? (
		media-gfx/imagemagick
		x11-misc/xdotool
	)"

src_install() {
	dobin xsr

	insinto /usr/share/xsr
	doins Cursor.png

	einstalldocs
}
