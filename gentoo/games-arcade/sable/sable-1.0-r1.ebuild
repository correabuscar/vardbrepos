# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="A frantic 3D space shooter"
HOMEPAGE="https://jeuxlibres.net/showgame/sable.html"
SRC_URI="mirror://gentoo/${P}-src.tgz
	mirror://gentoo/${PN}.png"
S="${WORKDIR}/${PN}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/opengl
	media-libs/libsdl[joystick,opengl,sound,video]
	media-libs/sdl-image[png]
	media-libs/sdl-mixer"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-gentoo.patch )

src_compile() {
	emake INSTALL_RESDIR="/usr/share"
}

src_install() {
	dobin ${PN}
	insinto /usr/share/${PN}
	doins -r models sfx textures
	einstalldocs

	doicon "${DISTDIR}"/${PN}.png
	make_desktop_entry ${PN} Sable
}
