# Copyright 2017-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=8

CRATES="
	ansi_term@0.12.1
	attohttpc@0.16.3
	atty@0.2.14
	autocfg@1.0.1
	base64@0.13.0
	bitflags@1.3.2
	block-buffer@0.9.0
	boxfnonce@0.1.1
	bstr@0.2.17
	bumpalo@3.8.0
	byteorder@1.4.3
	bytes@1.1.0
	cast@0.2.7
	cc@1.0.72
	cfg-if@0.1.10
	cfg-if@1.0.0
	chrono@0.4.19
	clap@2.34.0
	console@0.15.0
	cpufeatures@0.2.1
	criterion@0.3.5
	criterion-plot@0.4.4
	crossbeam-channel@0.5.1
	crossbeam-deque@0.8.1
	crossbeam-epoch@0.9.5
	crossbeam-utils@0.8.5
	csv@1.1.6
	csv-core@0.1.10
	daemonize@0.4.1
	dialoguer@0.9.0
	digest@0.9.0
	either@1.6.1
	encode_unicode@0.3.6
	fnv@1.0.7
	form_urlencoded@1.0.1
	generic-array@0.14.4
	getrandom@0.2.3
	half@1.8.2
	hashbrown@0.11.2
	heck@0.3.3
	hermit-abi@0.1.19
	http@0.2.5
	httparse@1.5.1
	iai@0.1.1
	idna@0.2.3
	igd@0.12.0
	indexmap@1.7.0
	itertools@0.10.3
	itoa@0.4.8
	itoa@1.0.1
	js-sys@0.3.55
	lazy_static@1.4.0
	libc@0.2.112
	linked-hash-map@0.5.4
	log@0.4.14
	matches@0.1.9
	memchr@2.4.1
	memoffset@0.6.5
	nix@0.14.1
	nix@0.23.1
	num-integer@0.1.44
	num-traits@0.2.14
	num_cpus@1.13.1
	once_cell@1.9.0
	oorandom@11.1.3
	opaque-debug@0.3.0
	percent-encoding@2.1.0
	plotters@0.3.1
	plotters-backend@0.3.2
	plotters-svg@0.3.1
	ppv-lite86@0.2.15
	privdrop@0.5.1
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.34
	quote@1.0.10
	rand@0.8.4
	rand_chacha@0.3.1
	rand_core@0.6.3
	rand_hc@0.3.1
	rayon@1.5.1
	rayon-core@1.9.1
	redox_syscall@0.2.10
	regex@1.5.4
	regex-automata@0.1.10
	regex-syntax@0.6.25
	remove_dir_all@0.5.3
	ring@0.16.20
	rustc_version@0.4.0
	ryu@1.0.9
	same-file@1.0.6
	scopeguard@1.1.0
	semver@1.0.4
	serde@1.0.132
	serde_cbor@0.11.2
	serde_derive@1.0.132
	serde_json@1.0.73
	serde_yaml@0.8.23
	sha-1@0.9.8
	signal@0.7.0
	smallvec@1.7.0
	spin@0.5.2
	strsim@0.8.0
	structopt@0.3.25
	structopt-derive@0.4.18
	syn@1.0.83
	tempfile@3.2.0
	terminal_size@0.1.17
	textwrap@0.11.0
	thiserror@1.0.30
	thiserror-impl@1.0.30
	tinytemplate@1.2.1
	tinyvec@1.5.1
	tinyvec_macros@0.1.0
	tungstenite@0.16.0
	typenum@1.14.0
	unicode-bidi@0.3.7
	unicode-normalization@0.1.19
	unicode-segmentation@1.8.0
	unicode-width@0.1.9
	unicode-xid@0.2.2
	untrusted@0.7.1
	url@2.2.2
	utf-8@0.7.6
	vec_map@0.8.2
	version_check@0.9.3
	void@1.0.2
	walkdir@2.3.2
	wasi@0.10.2+wasi-snapshot-preview1
	wasm-bindgen@0.2.78
	wasm-bindgen-backend@0.2.78
	wasm-bindgen-macro@0.2.78
	wasm-bindgen-macro-support@0.2.78
	wasm-bindgen-shared@0.2.78
	web-sys@0.3.55
	wildmatch@1.1.0
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	xml-rs@0.8.4
	xmltree@0.10.3
	yaml-rust@0.4.5
	zeroize@1.4.3
"

inherit cargo systemd

DESCRIPTION="High performance peer-to-peer mesh VPN"
HOMEPAGE="https://vpncloud.ddswd.de/"
SRC_URI="https://github.com/dswd/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}"
LICENSE="GPL-3+ ISC MIT MPL-2.0 openssl || ( Apache-2.0 Boost-1.0 ) || ( Apache-2.0 MIT ) || ( Apache-2.0 MIT ZLIB ) || ( MIT Unlicense )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="man"
RESTRICT="mirror"

DEPEND="man? ( dev-ruby/asciidoctor )"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_install() {
	cargo_src_install
	keepdir /etc/vpncloud
	insinto /etc/vpncloud
	doins assets/example.net.disabled
	systemd_dounit assets/${PN}{-wsproxy,@}.service assets/${PN}.target

	einstalldocs
	if use man; then
		gunzip target/vpncloud.1.gz || die
		doman target/vpncloud.1
	fi
}