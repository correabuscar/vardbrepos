# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools desktop toolchain-funcs xdg-utils

if [[ ${PV} == "99999999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://git.tartarus.org/simon/puzzles.git"
	GENTOO_ICONS="20160315"
	SRC_URI="https://dev.gentoo.org/~np-hardass/distfiles/${PN}/${PN}-icons-${GENTOO_ICONS}.tar.xz"
else
	MAGIC=e2135d5
	SRC_URI="https://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.${MAGIC}.tar.gz"
	S=${WORKDIR}/puzzles-${PV}.${MAGIC}
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Simon Tatham's Portable Puzzle Collection"
HOMEPAGE="https://www.chiark.greenend.org.uk/~sgtatham/puzzles/"

LICENSE="MIT"
SLOT="0"
IUSE="+doc"

COMMON_DEPEND="
	x11-libs/gtk+:3"

RDEPEND="${COMMON_DEPEND}
	x11-misc/xdg-utils" # Used by builtin help patch

DEPEND="${COMMON_DEPEND}"

BDEPEND="
	dev-lang/perl
	virtual/pkgconfig
	doc? ( >=app-text/halibut-1.2 )"

PATCHES=( "${FILESDIR}/${PN}-20161207-builtin-help.patch" )

src_unpack() {
	default
	if [[ ${PV} == "99999999" ]]; then
		git-r3_src_unpack
	fi
}

src_prepare() {
	default

	sed -i \
		-e 's|-Werror||g' \
		configure.ac || die
	sed -i \
		-e 's/-O2 -Wall .* -g/-Wall/' \
		-e "s/libstr =/libstr = '\$(LDFLAGS) ' ./" \
		mkfiles.pl || die
	./mkfiles.pl || die
	eautoreconf

	# Import icons from latest Gentoo tarball for live
	if [[ ${PV} == "99999999" ]]; then
		cp -R ../${PN}-icons/icons . || die
	fi
}

src_configure() {
	econf \
		--program-prefix="${PN}_" \
		--with-gtk=3
}

src_compile() {
	emake CC="$(tc-getCC)"
	if use doc ; then
		halibut --text --html --info --pdf --ps puzzles.but || die
	fi
}

src_install() {
	default

	local file name
	for file in *.R ; do
		[[ ${file} == "nullgame.R" ]] && continue
		name=$(awk -F: '/exe:/ { print $3 }' "${file}")
		file=${file%.R}
		newicon -s 48 icons/${file}-48d24.png ${PN}_${file}.png
		make_desktop_entry "${PN}_${file}" "${name}" "${PN}_${file}" "LogicGame;X-${PN};"
	done

	if use doc ; then
		local DOCS=( puzzles.{pdf,ps,txt} )
		local HTML_DOCS=( *.html )
		einstalldocs
		doinfo puzzles.info{,-1,-2,-3}
	fi

	insinto /etc/xdg/menus/applications-merged
	doins "${FILESDIR}/${PN}.menu"
	insinto /usr/share/desktop-directories
	doins "${FILESDIR}/${PN}.directory"
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
