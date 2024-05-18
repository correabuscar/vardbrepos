# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

declare -A GIT_CRATES=(
	[async_zip]='https://github.com/charliermarsh/rs-async-zip;1dcb40cfe1bf5325a6fd4bfcf9894db40241f585;rs-async-zip-%commit%'
	[pubgrub]='https://github.com/astral-sh/pubgrub;0e684a874c9fb8f74738cd8875524c80e3d4820b;pubgrub-%commit%'
)

inherit cargo check-reqs

CRATE_P=${P}
DESCRIPTION="A Python package installer and resolver, written in Rust"
HOMEPAGE="
	https://github.com/astral-sh/uv/
	https://pypi.org/project/uv/
"
# pypi sdist misses scripts/, needed for tests
SRC_URI="
	https://github.com/astral-sh/uv/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"
if [[ ${PKGBUMPING} != ${PVR} ]]; then
	SRC_URI+="
		https://dev.gentoo.org/~mgorny/dist/${CRATE_P}-crates.tar.xz
	"
fi

# most of the code
LICENSE="|| ( Apache-2.0 MIT )"
# crates/pep508-rs is || ( Apache-2.0 BSD-2 ) which is covered below
# Dependent crate licenses
LICENSE+="
	0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD ISC MIT
	MPL-2.0 Unicode-DFS-2016
"
# ring crate
LICENSE+=" openssl"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~x86"
IUSE="test"
RESTRICT="test"
PROPERTIES="test_network"

DEPEND="
	dev-libs/libgit2:=
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	>=virtual/rust-1.77
	test? (
		dev-lang/python:3.8
		dev-lang/python:3.9
		dev-lang/python:3.10
		dev-lang/python:3.11
		dev-lang/python:3.12
	)
"

QA_FLAGS_IGNORED="usr/bin/.*"

check_space() {
	local CHECKREQS_DISK_BUILD=3G
	use debug && CHECKREQS_DISK_BUILD=9G
	check-reqs_pkg_setup
}

pkg_pretend() {
	check_space
}

pkg_setup() {
	check_space
}

src_prepare() {
	# https://github.com/astral-sh/uv/pull/3569
	eapply "${FILESDIR}/${P}-test.patch"
	default

	# https://github.com/vorot93/tokio-tar/pull/23
	# (fortunately uv already depends on portable-atomic, so we don't
	# have to fight Cargo.lock)
	cd "${WORKDIR}/cargo_home/gentoo/tokio-tar-0.3.1" || die
	eapply "${FILESDIR}/tokio-tar-0.3.1-ppc.patch"
}

src_configure() {
	local myfeatures=(
		# from upstream defaults
		flate2/zlib-ng
		python
		pypi
		git
		maturin
		# skip tests that require specific patch version of the interpreter:
		# python-patch
	)

	cargo_src_configure --no-default-features
}

src_compile() {
	cd crates/uv || die
	cargo_src_compile
}

src_test() {
	cd crates/uv || die
	cargo_src_test --no-fail-fast
}

src_install() {
	cd crates/uv || die
	cargo_src_install
}