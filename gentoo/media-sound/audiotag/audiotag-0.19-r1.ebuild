# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit optfeature

DESCRIPTION="Command-line tool for mass tagging/renaming of audio files"
HOMEPAGE="https://github.com/Daenyth/audiotag"
SRC_URI="https://github.com/Daenyth/audiotag/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 ~ppc ppc64 sparc x86"

RDEPEND="dev-lang/perl"

src_install() {
	dobin ${PN}
	dodoc ChangeLog README
}

pkg_postinst() {
	optfeature "for m4a/mp4 support" media-video/atomicparsley
	optfeature "for flac support" media-libs/flac
	optfeature "for mp3 support" media-libs/id3lib
	optfeature "for vorbis support" media-sound/vorbis-tools
}
