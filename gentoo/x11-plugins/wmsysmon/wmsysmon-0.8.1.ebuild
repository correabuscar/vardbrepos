# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit toolchain-funcs

DESCRIPTION="a dockapp to monitor: CPU, Memory, Uptime, IRQs, Paging and Swap activity"
HOMEPAGE="https://github.com/voyageur/wmsysmon"
SRC_URI="https://github.com/voyageur/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND=">=x11-libs/libdockapp-0.7:=
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
RDEPEND="${DEPEND}"

DOCS=( ../ChangeLog ../README )
S=${WORKDIR}/${P}/src

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	dobin wmsysmon
	einstalldocs
}
