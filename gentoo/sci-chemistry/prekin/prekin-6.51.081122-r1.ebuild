# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

MY_P=${PN}.${PV}
DESCRIPTION="Prepares molecular kinemages from PDB-format coordinate files"
HOMEPAGE="http://kinemage.biochem.duke.edu/software/prekin.php"
SRC_URI="http://kinemage.biochem.duke.edu/downloads/software/${PN}/${MY_P}.src.tgz"

LICENSE="richardson"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="X"

RDEPEND="
	x11-libs/libXext
	x11-libs/libXmu
	x11-libs/libXt
	x11-libs/libX11
	X? ( >=x11-libs/motif-2.3:0= )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

PATCHES=(
	"${FILESDIR}"/${PV}-Makefile.patch
	"${FILESDIR}"/${PV}-overflow.patch
	"${FILESDIR}"/${P}-fno-common.patch
)

src_configure() {
	tc-export CC

	sed \
		-e 's:cc:$(CC):g' \
		-e "s:GENTOOLIBDIR:$(get_libdir):g" \
		Makefile.linux > Makefile || die
}

src_compile() {
	emake $(usex X ${PN} nogui)
}

src_install() {
	dobin prekin
}