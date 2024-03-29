# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	advapi32-sys@0.2.0
	ahash@0.8.3
	aho-corasick@1.0.5
	allocator-api2@0.2.16
	anstream@0.5.0
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@2.1.0
	anstyle@1.0.2
	anyhow@1.0.75
	arrayvec@0.7.4
	autocfg@1.1.0
	backtrace@0.3.69
	benchmarking@0.4.12
	bindgen@0.65.1
	bitflags@1.3.2
	bitflags@2.4.0
	block-buffer@0.10.4
	block@0.1.6
	btoi@0.4.3
	built@0.6.1
	bytefmt@0.1.7
	byteorder@1.4.3
	bzip2-sys@0.1.11+1.0.8
	bzip2@0.4.4
	cargo-lock@9.0.0
	cc@1.0.83
	cexpr@0.6.0
	cfg-if@1.0.0
	circular@0.3.0
	clang-sys@1.6.1
	clap@4.4.2
	clap_builder@4.4.2
	clap_lex@0.5.1
	colorchoice@1.0.0
	console@0.15.7
	cpufeatures@0.2.9
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-queue@0.3.8
	crossbeam-utils@0.8.16
	crossbeam@0.8.2
	crypto-common@0.1.6
	ctrlc@3.4.0
	dialoguer@0.10.4
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	displaydoc@0.2.4
	either@1.9.0
	encode_unicode@0.3.6
	encode_unicode@1.0.0
	encoding-index-japanese@1.20141219.5
	encoding-index-korean@1.20141219.5
	encoding-index-simpchinese@1.20141219.5
	encoding-index-singlebyte@1.20141219.5
	encoding-index-tradchinese@1.20141219.5
	encoding@0.2.33
	encoding_index_tests@0.1.4
	equivalent@1.0.1
	errno-dragonfly@0.1.2
	errno@0.3.3
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fastrand@2.0.0
	find-crate@0.6.3
	flate2@1.0.27
	fluent-langneg@0.13.0
	form_urlencoded@1.2.0
	generic-array@0.14.7
	getrandom@0.2.10
	gettext@0.4.0
	gimli@0.28.0
	git2@0.17.2
	glob@0.3.1
	hashbrown@0.14.0
	hashlink@0.8.4
	hermit-abi@0.3.2
	hostname@0.3.1
	human-panic@1.2.0
	i18n-config@0.4.4
	i18n-embed-impl@0.8.1
	i18n-embed@0.13.9
	idna@0.4.0
	indexmap@2.0.0
	indicatif@0.17.6
	instant@0.1.12
	intl-memoizer@0.5.1
	is-terminal@0.4.9
	itertools@0.10.5
	itoa@1.0.9
	jobserver@0.1.26
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.147
	libgit2-sys@0.15.2+1.6.4
	libloading@0.7.4
	librocksdb-sys@0.11.0+8.1.1
	libsqlite3-sys@0.26.0
	libz-sys@1.1.12
	linux-raw-sys@0.4.5
	locale_config@0.3.0
	lock_api@0.4.10
	log@0.4.20
	lz4-sys@1.9.4
	lz4@1.24.0
	lzma-sys@0.1.20
	malloc_buf@0.0.6
	match_cfg@0.1.0
	memchr@2.6.2
	memmap@0.7.0
	memoffset@0.9.0
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	nix@0.26.4
	nom@7.1.3
	num-traits@0.2.16
	num_cpus@1.16.0
	number_prefix@0.4.0
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	object@0.32.0
	once_cell@1.18.0
	os_info@3.7.0
	parking_lot@0.12.1
	parking_lot_core@0.9.8
	peeking_take_while@0.1.2
	percent-encoding@2.3.0
	pgcopy@0.0.2
	pgn-reader@0.25.0
	pkg-config@0.3.27
	portable-atomic@1.4.3
	positioned-io@0.3.2
	ppv-lite86@0.2.17
	prettyplease@0.2.12
	prettytable-rs@0.10.0
	proc-macro2@1.0.66
	quick-csv@0.1.6
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_xorshift@0.3.0
	rayon-core@1.11.0
	rayon@1.7.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	regex-automata@0.3.7
	regex-syntax@0.7.5
	regex@1.9.4
	rocksdb@0.21.0
	rusqlite@0.29.0
	rust-embed-impl@6.8.1
	rust-embed-utils@7.8.1
	rust-embed@6.8.1
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustc-serialize@0.3.24
	rustix@0.38.11
	rustversion@1.0.14
	ryu@1.0.15
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.18
	serde@1.0.188
	serde_derive@1.0.188
	serde_json@1.0.105
	serde_spanned@0.6.3
	sha2@0.10.7
	shakmaty-syzygy@0.24.0
	shakmaty@0.26.0
	shell-escape@0.1.5
	shell-words@1.1.0
	shlex@1.1.0
	smallvec@1.11.0
	strsim@0.10.0
	syn@1.0.109
	syn@2.0.29
	tempfile@3.8.0
	term@0.7.0
	termtree@0.4.1
	test_bin@0.4.0
	textwrap@0.16.0
	thiserror-impl@1.0.47
	thiserror@1.0.47
	tikv-jemalloc-sys@0.5.4+5.3.0-patched
	tinystr@0.7.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	toml@0.5.11
	toml@0.7.6
	toml_datetime@0.6.3
	toml_edit@0.19.14
	tr@0.1.7
	type-map@0.4.0
	typenum@1.16.0
	unic-langid-impl@0.9.1
	unic-langid@0.9.1
	unicase@2.7.0
	unicode-bidi@0.3.13
	unicode-ident@1.0.11
	unicode-normalization@0.1.22
	unicode-width@0.1.10
	url@2.4.1
	username@0.2.0
	utf8parse@0.2.1
	uuid@1.4.1
	vcpkg@0.2.15
	version_check@0.9.4
	walkdir@2.3.3
	wasi@0.11.0+wasi-snapshot-preview1
	winapi-build@0.1.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.2.8
	winapi@0.3.9
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	winnow@0.5.15
	xz2@0.1.7
	zstd-safe@6.0.6
	zstd-sys@2.0.8+zstd.1.5.5
	zstd@0.12.4
"
inherit cargo

DESCRIPTION="swiss army knife for chess file formats"
HOMEPAGE="https://git.sr.ht/~alip/jja"
SRC_URI="https://git.sr.ht/~alip/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
	"

# rocksdb needs clang
DEPEND+="sys-devel/clang
	sys-libs/liburing"
RDEPEND=${DEPEND}
LICENSE="GPL-3+"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD CC0-1.0 GPL-3+ ISC MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	cargo_src_unpack
	rmdir "${WORKDIR}"/${P}
	mv "${WORKDIR}"/${PN}-v${PV} "${WORKDIR}"/${P} || die
}
