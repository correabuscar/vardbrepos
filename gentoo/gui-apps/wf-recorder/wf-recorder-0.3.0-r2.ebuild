# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Screen recorder for wlroots-based compositors"
HOMEPAGE="https://github.com/ammen99/wf-recorder"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ammen99/wf-recorder.git"
else
	SRC_URI="https://github.com/ammen99/wf-recorder/releases/download/v${PV}/${P}.tar.xz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-libs/wayland
	media-libs/libpulse
	media-video/ffmpeg[pulseaudio,x264]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	virtual/pkgconfig
"
