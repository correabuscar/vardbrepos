# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_IN_SOURCE_BUILD="1"
PYTHON_COMPAT=( python3_{9..10} )
PYPI_NO_NORMALIZE=1
PYPI_PN="wxPython"
WX_GTK_VER="3.0-gtk3"

inherit distutils-r1 multiprocessing virtualx wxwidgets pypi

DESCRIPTION="A blending of the wxWindows C++ class library with Python"
HOMEPAGE="https://www.wxpython.org/"
SRC_URI="$(pypi_sdist_url --no-normalize "${PYPI_PN}" "${PV}.post2")"

LICENSE="wxWinLL-3"
SLOT="4.0"
KEYWORDS="~alpha amd64 arm arm64 ~loong ppc ppc64 ~riscv ~sparc x86"
IUSE="test webkit"
# Tests broken: #726812, #722716
RESTRICT="test"
#RESTRICT="!test? ( test )"

# wxPython doesn't seem to be able to optionally disable features. webkit is
# optionally patched out because it's so huge, but other elements are not,
# which makes us have to require all features from wxGTK
RDEPEND="
	>=x11-libs/wxGTK-3.0.4-r301:${WX_GTK_VER}=[gstreamer,libnotify,opengl,sdl,tiff,webkit?,X]
	media-libs/libpng:=
	media-libs/tiff:=
	media-libs/libjpeg-turbo:="

BDEPEND="${RDEPEND}
	app-doc/doxygen
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	test? (
		${VIRTUALX_DEPEND}
		dev-python/appdirs[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${PYPI_PN}-${PV}.post2"

PATCHES=(
	"${FILESDIR}/${PN}-4.0.6-skip-broken-tests.patch"
	"${FILESDIR}/${P}-ultimatelistctrl.patch"
)

python_prepare_all() {
	if ! use webkit; then
		eapply "${FILESDIR}/${PN}-4.0.6-no-webkit.patch"
		rm unittests/test_webview.py || die
	fi
	# Most of these tests disabled below fail because of the virtx/portage
	# environment, but some fail for unknown reasons.
	rm unittests/test_uiaction.py \
		unittests/test_notifmsg.py \
		unittests/test_mousemanager.py \
		unittests/test_display.py \
		unittests/test_pi_import.py \
		unittests/test_lib_agw_thumbnailctrl.py \
		unittests/test_sound.py || die

	distutils-r1_python_prepare_all
}

src_configure() {
	setup-wxwidgets
}

python_compile() {
	DOXYGEN=/usr/bin/doxygen ${PYTHON} build.py dox etg --nodoc || die
	${PYTHON} build.py build_py \
		--use_syswx \
		--no_magic \
		--jobs=$(makeopts_jobs) \
		--release || die
}

python_install() {
	distutils-r1_python_install --skip-build
}

python_test() {
	virtx epytest unittests
}
