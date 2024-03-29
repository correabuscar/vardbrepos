# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dockapp to monitor LongRun on a Transmeta Crusoe processor"
HOMEPAGE="https://www.dockapps.net/wmlongrun"
SRC_URI="https://www.dockapps.net/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="-* ~x86"

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}"
