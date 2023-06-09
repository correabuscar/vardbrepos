# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xorg-3

DESCRIPTION="window information utility for X"

KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~x64-solaris"
IUSE=""

RDEPEND=">=x11-libs/libxcb-1.6"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	x11-libs/libX11"
