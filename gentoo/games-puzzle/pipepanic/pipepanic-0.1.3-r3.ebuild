# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop toolchain-funcs

DESCRIPTION="Simple pipe connecting game"
HOMEPAGE="http://www.users.waitrose.com/~thunor/pipepanic/"
SRC_URI="http://www.users.waitrose.com/~thunor/pipepanic/dload/${P}-source.tar.gz"
S="${WORKDIR}/${P}-source"

LICENSE="GPL-2+ Free-Art-1.2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/libsdl[video]"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eapply "${FILESDIR}"/${P}-gentoo.patch
	# change harcoded data paths to match the install directory
	sed -i \
		-e "s:/opt/QtPalmtop/share/pipepanic/:/usr/share/${PN}/:" \
		main.h || die "sed failed"
}

src_compile() {
	tc-export CC
	default
}

src_install() {
	dobin ${PN}

	insinto /usr/share/${PN}
	doins *.bmp
	newicon PipepanicIcon64.png ${PN}.png
	make_desktop_entry ${PN} "Pipepanic"
	einstalldocs
}
