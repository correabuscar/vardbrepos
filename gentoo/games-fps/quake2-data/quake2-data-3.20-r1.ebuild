# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cdrom unpacker

DESCRIPTION="iD Software's Quake 2 ... the data files"
HOMEPAGE="https://www.idsoftware.com/"
SRC_URI="mirror://idsoftware/quake2/q2-${PV}-x86-full-ctf.exe"
S="${WORKDIR}"

LICENSE="Q2EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="videos"
RESTRICT="bindist"

RDEPEND="!games-fps/quake2-demodata[symlink]"
BDEPEND="app-arch/unzip"

src_unpack() {
	export CDROM_NAME_SET=("Existing Install" "Ultimate Quake Edition" "Quake2 CD" "Quake4 Bonus DVD")
	cdrom_get_cds baseq2:Install/patch:Install:Movies
	# The .exe is just a self-extracting .zip
	unpack_zip ${A}
}

src_install() {
	dodoc DOCS/* 3.20_Changes.txt
	newdoc ctf/readme.txt ctf-readme.txt

	case ${CDROM_SET} in
		0) { docinto html && dodoc -r "${CDROM_ROOT}"/Install/DOCS/quake2_manual/* ; } ;;
		1) { docinto html && dodoc -r "${CDROM_ROOT}"/Install/Docs/quake2_manual/* ; } ;;
		2) { docinto html && dodoc -r "${CDROM_ROOT}"/Install/DOCS/quake2_manual/* ; } ;;
		3) dodoc "${CDROM_ROOT}"/Docs/* ;;
	esac

	local baseq2_cdpath
	case ${CDROM_SET} in
		0) baseq2_cdpath=${CDROM_ROOT}/baseq2;;
		1) baseq2_cdpath=${CDROM_ROOT}/Install/Data/baseq2;;
		2) baseq2_cdpath=${CDROM_ROOT}/Install/Data/baseq2;;
		3) baseq2_cdpath=${CDROM_ROOT}/setup/Data/baseq2;;
	esac

	dodir /usr/share/quake2/baseq2

	if use videos ; then
		insinto /usr/share/quake2/baseq2/video
		doins "${baseq2_cdpath}"/video/*
	fi

	insinto /usr/share/quake2/baseq2
	doins "${baseq2_cdpath}"/pak0.pak
	doins baseq2/*.pak baseq2/maps.lst

	dodir /usr/share/quake2/baseq2/players
	cp -R "${baseq2_cdpath}"/players/* baseq2/players/* \
		"${ED}"/usr/share/quake2/baseq2/players/ || die

	for mod in ctf rogue xatrix ; do
		if [[ -d ${baseq2_cdpath}/../${mod} ]] ; then
			if use videos && [[ -d ${baseq2_cdpath}/../${mod}/video ]] ; then
				insinto /usr/share/quake2/${mod}/video
				doins "${baseq2_cdpath}"/../${mod}/video/* 2>/dev/null
			fi
			if [[ -n $(ls "${baseq2_cdpath}"/../${mod}/*.pak 2>/dev/null) ]] ; then
				insinto /usr/share/quake2/${mod}
				doins "${baseq2_cdpath}"/../${mod}/*.pak
			fi
		fi
	done

	insinto /usr/share/quake2/ctf
	doins ctf/*.{cfg,ico,pak}
}
