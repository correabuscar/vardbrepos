# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PLOCALES="cs de en es fi fr hr hu id_ID it ja nl pl pt_BR ru sv uk zh_TW"
inherit flag-o-matic plocale qmake-utils xdg

if [[ ${PV} != *9999 ]] ; then
	SRC_URI="https://github.com/openstreetmap/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
else
	EGIT_REPO_URI="https://github.com/openstreetmap/merkaartor.git"
	inherit git-r3
fi

DESCRIPTION="Qt based map editor for the openstreetmap.org project"
HOMEPAGE="http://www.merkaartor.be https://github.com/openstreetmap/merkaartor"

LICENSE="GPL-2"
SLOT="0"
IUSE="debug exif gps libproxy webengine"

DEPEND="
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsingleapplication[X,qt5(+)]
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	sci-libs/gdal:=
	sci-libs/proj:=
	sys-libs/zlib
	exif? ( media-gfx/exiv2:= )
	gps? ( >=sci-geosciences/gpsd-3.17-r2:= )
	libproxy? ( net-libs/libproxy )
	webengine? ( dev-qt/qtwebengine:5[widgets] )
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-qt/linguist-tools:5
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/${PN}-0.18.3-sharedir-pluginsdir.patch # downstream, bug 621826
	"${FILESDIR}"/${P}-exiv2-0.28.patch # upstream git master, bug 906501
)

DOCS=( AUTHORS CHANGELOG )

src_prepare() {
	default

	rm -r 3rdparty || die "Failed to remove bundled libs"

	my_rm_loc() {
		sed -i -e "s:../translations/${PN}_${1}.\(ts\|qm\)::" src/src.pro || die
		rm "translations/${PN}_${1}.ts" || die
	}

	if [[ -n "$(plocale_get_locales)" ]]; then
		plocale_for_each_disabled_locale my_rm_loc
		$(qt5_get_bindir)/lrelease src/src.pro || die
	fi

	# build system expects to be building from git
	if [[ ${PV} != *9999 ]] ; then
		sed -i src/Config.pri -e "s:SION = .*:SION = \"${PV}\":g" || die
	fi
}

src_configure() {
	if has_version "<sci-libs/proj-8.0.0" ; then
		# bug #685234
		append-cppflags -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H
	fi

	# TRANSDIR_SYSTEM is for bug #385671
	local myeqmakeargs=(
		PREFIX="${EPREFIX}/usr"
		LIBDIR="${EPREFIX}/usr/$(get_libdir)"
		PLUGINS_DIR="/usr/$(get_libdir)/${PN}/plugins"
		SHARE_DIR_PATH="/usr/share/${PN}"
		TRANSDIR_MERKAARTOR="${EPREFIX}/usr/share/${PN}/translations"
		TRANSDIR_SYSTEM="${EPREFIX}/usr/share/qt5/translations"
		SYSTEM_QTSA=1
		NODEBUG=$(usex debug 0 1)
		GEOIMAGE=$(usex exif 1 0)
		GPSDLIB=$(usex gps 1 0)
		LIBPROXY=$(usex libproxy 1 0)
		USEWEBENGINE=$(usex webengine 1 0)
	)
	[[ ${PV} != *9999 ]] && myeqmakeargs+=( RELEASE=1 )

	eqmake5 "${myeqmakeargs[@]}" Merkaartor.pro
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
