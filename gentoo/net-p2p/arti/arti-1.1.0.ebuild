# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.17.0
	adler-1.0.2
	aes-0.8.2
	ahash-0.7.6
	aho-corasick-0.7.20
	android_system_properties-0.1.5
	anyhow-1.0.66
	approx-0.5.1
	arbitrary-1.2.0
	arrayref-0.3.6
	asynchronous-codec-0.6.1
	async-broadcast-0.4.1
	async-channel-1.7.1
	async-compression-0.3.15
	async-ctrlc-1.2.0
	async-executor-1.5.0
	async-global-executor-2.3.1
	async-io-1.12.0
	async-lock-2.6.0
	async-native-tls-0.4.0
	async-process-1.6.0
	async-rustls-0.3.0
	async-std-1.12.0
	async-task-4.3.0
	async-trait-0.1.59
	async_executors-0.6.0
	atomic-0.5.1
	atomic-waker-1.0.0
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.66
	base64ct-1.5.3
	base64-0.13.1
	bitflags-1.3.2
	blanket-0.2.0
	blocking-1.3.0
	block-buffer-0.9.0
	block-buffer-0.10.3
	bounded-vec-deque-0.1.1
	bumpalo-3.11.1
	bytemuck-1.12.3
	byteorder-1.4.3
	bytes-1.3.0
	by_address-1.1.0
	cache-padded-1.2.0
	cc-1.0.77
	cfg-if-1.0.0
	chrono-0.4.23
	cipher-0.4.3
	clap-3.2.23
	clap_lex-0.2.4
	coarsetime-0.1.22
	codespan-reporting-0.11.1
	concurrent-queue-1.2.4
	concurrent-queue-2.0.0
	config-0.13.2
	const-oid-0.9.1
	convert_case-0.4.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	cpufeatures-0.2.5
	crc32fast-1.3.2
	crossbeam-channel-0.5.6
	crossbeam-queue-0.3.8
	crossbeam-utils-0.8.14
	crypto-common-0.1.6
	ctor-0.1.26
	ctrlc-3.2.3
	ctr-0.9.2
	curve25519-dalek-3.2.0
	cxxbridge-flags-1.0.82
	cxxbridge-macro-1.0.82
	cxx-1.0.82
	cxx-build-1.0.82
	darling-0.14.2
	darling_core-0.14.2
	darling_macro-0.14.2
	dashmap-5.4.0
	data-encoding-2.3.2
	derive_arbitrary-1.2.0
	derive_builder_core_fork_arti-0.11.2
	derive_builder_fork_arti-0.11.2
	derive_builder_macro_fork_arti-0.11.2
	derive_more-0.99.17
	der-0.6.0
	digest-0.9.0
	digest-0.10.6
	directories-4.0.1
	dirs-4.0.0
	dirs-sys-0.3.7
	displaydoc-0.2.3
	downcast-rs-1.2.0
	dyn-clone-1.0.9
	ed25519-1.5.2
	ed25519-dalek-1.0.1
	educe-0.4.20
	either-1.8.0
	enum-as-inner-0.5.1
	enum-ordinalize-3.1.12
	env_logger-0.5.13
	event-listener-2.5.3
	fallible-iterator-0.2.0
	fallible-streaming-iterator-0.1.9
	fastrand-1.8.0
	filetime-0.2.18
	flate2-1.0.25
	float-cmp-0.9.0
	float-ord-0.3.2
	float_eq-1.0.1
	fluid-let-1.0.0
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.1.0
	fslock-0.2.1
	futures-0.3.25
	futures-await-test-0.3.0
	futures-await-test-macro-0.3.0
	futures-channel-0.3.25
	futures-core-0.3.25
	futures-executor-0.3.25
	futures-io-0.3.25
	futures-lite-1.12.0
	futures-macro-0.3.25
	futures-sink-0.3.25
	futures-task-0.3.25
	futures-util-0.3.25
	generic-array-0.14.6
	getrandom-0.1.16
	getrandom-0.2.8
	gimli-0.26.2
	gloo-timers-0.2.5
	hashbrown-0.12.3
	hashlink-0.8.1
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	hex-literal-0.3.4
	hkdf-0.12.3
	hmac-0.12.1
	hostname-validator-1.1.1
	httparse-1.8.0
	httpdate-1.0.2
	http-0.2.8
	http-body-0.4.5
	humantime-1.3.0
	humantime-2.1.0
	humantime-serde-1.1.1
	hyper-0.14.23
	iana-time-zone-0.1.53
	iana-time-zone-haiku-0.1.1
	ident_case-1.0.1
	idna-0.2.3
	idna-0.3.0
	indexmap-1.9.2
	inotify-0.9.6
	inotify-sys-0.1.5
	inout-0.1.3
	instant-0.1.12
	ipnet-2.5.1
	itertools-0.10.5
	itoa-1.0.4
	jobserver-0.1.25
	js-sys-0.3.60
	keccak-0.1.3
	kqueue-1.0.7
	kqueue-sys-1.0.3
	kv-log-macro-1.0.7
	lazy_static-1.4.0
	libc-0.2.137
	libm-0.2.6
	libsqlite3-sys-0.25.2
	link-cplusplus-1.0.7
	lock_api-0.4.9
	log-0.4.17
	lzma-sys-0.1.20
	matchers-0.1.0
	matches-0.1.9
	matrixmultiply-0.3.2
	memchr-2.5.0
	memmap2-0.5.8
	merlin-2.0.1
	minimal-lexical-0.2.1
	miniz_oxide-0.5.4
	miniz_oxide-0.6.2
	mio-0.8.5
	nalgebra-0.29.0
	nalgebra-macros-0.1.0
	native-tls-0.2.11
	nix-0.25.0
	nom-7.1.1
	notify-5.0.0
	num-bigint-0.4.3
	num-bigint-dig-0.8.2
	num-complex-0.4.2
	num-integer-0.1.45
	num-iter-0.1.43
	num-rational-0.4.1
	num-traits-0.2.15
	num_cpus-1.14.0
	num_enum-0.5.7
	num_enum_derive-0.5.7
	nu-ansi-term-0.46.0
	object-0.29.0
	once_cell-1.16.0
	opaque-debug-0.3.0
	openssl-0.10.43
	openssl-macros-0.1.0
	openssl-probe-0.1.5
	openssl-src-111.24.0+1.1.1s
	openssl-sys-0.9.78
	os_str_bytes-6.4.1
	overload-0.1.1
	parking-2.0.0
	parking_lot-0.12.1
	parking_lot_core-0.9.5
	paste-1.0.9
	pathdiff-0.2.1
	pem-0.8.3
	pem-rfc7468-0.6.0
	percent-encoding-2.2.0
	phf-0.11.1
	phf_generator-0.11.1
	phf_macros-0.11.1
	phf_shared-0.11.1
	pin-project-1.0.12
	pin-project-internal-1.0.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkcs1-0.4.1
	pkcs8-0.9.0
	pkg-config-0.3.26
	polling-2.5.0
	postage-0.5.0
	ppv-lite86-0.2.17
	proc-macro2-1.0.47
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	quick-error-1.2.3
	quote-1.0.21
	rand-0.7.3
	rand-0.8.5
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.5.1
	rand_core-0.6.4
	rand_distr-0.4.3
	rand_hc-0.2.0
	rawpointer-0.2.1
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.7.0
	regex-automata-0.1.10
	regex-syntax-0.6.28
	remove_dir_all-0.5.3
	retain_mut-0.1.9
	ring-0.16.20
	rlimit-0.8.3
	rmp-0.8.11
	rmp-serde-1.1.1
	rsa-0.7.2
	rusqlite-0.28.0
	rustc-demangle-0.1.21
	rustc_version-0.4.0
	rustls-0.20.7
	rustversion-1.0.9
	ryu-1.0.11
	safe_arch-0.6.0
	same-file-1.0.6
	sanitize-filename-0.4.0
	schannel-0.1.20
	scopeguard-1.1.0
	scratch-1.0.2
	sct-0.7.0
	secmem-proc-0.2.1
	security-framework-2.7.0
	security-framework-sys-2.6.1
	semver-1.0.14
	serde-1.0.148
	serde_derive-1.0.148
	serde_ignored-0.1.5
	serde_json-1.0.89
	serde_test-1.0.148
	serde_with-2.1.0
	serde_with_macros-2.1.0
	serial_test-0.9.0
	serial_test_derive-0.9.0
	sha1-0.10.5
	sha1-asm-0.5.1
	sha2-0.9.9
	sha2-0.10.6
	sha3-0.10.6
	sharded-slab-0.1.4
	shellexpand-2.1.2
	signal-hook-0.3.14
	signal-hook-async-std-0.2.2
	signal-hook-registry-1.4.0
	signature-1.6.4
	simba-0.6.0
	simple_asn1-0.6.2
	siphasher-0.3.10
	slab-0.4.7
	smallvec-1.10.0
	socket2-0.4.7
	spin-0.5.2
	spki-0.6.0
	static_assertions-1.1.0
	statrs-0.16.0
	strsim-0.10.0
	strum-0.24.1
	strum_macros-0.24.3
	subtle-2.4.1
	synstructure-0.12.6
	syn-1.0.104
	tempfile-3.3.0
	termcolor-1.1.3
	test-cert-gen-0.9.0
	textwrap-0.16.0
	thiserror-1.0.37
	thiserror-impl-1.0.37
	thread_local-1.1.4
	time-0.3.17
	time-core-0.1.0
	time-macros-0.2.6
	tinystr-0.7.0
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tls-api-0.9.0
	tls-api-native-tls-0.9.0
	tls-api-test-0.9.0
	tokio-1.22.0
	tokio-macros-1.8.0
	tokio-socks-0.5.1
	tokio-util-0.7.4
	toml-0.5.9
	tower-service-0.3.2
	tracing-0.1.37
	tracing-appender-0.2.2
	tracing-attributes-0.1.23
	tracing-core-0.1.30
	tracing-journald-0.3.0
	tracing-log-0.1.3
	tracing-subscriber-0.3.16
	tracing-test-0.2.3
	tracing-test-macro-0.2.3
	trust-dns-proto-0.22.0
	try-lock-0.2.3
	typenum-1.15.0
	unicode-bidi-0.3.8
	unicode-ident-1.0.5
	unicode-normalization-0.1.22
	unicode-width-0.1.10
	unicode-xid-0.2.4
	untrusted-0.6.2
	untrusted-0.7.1
	url-2.3.1
	users-0.11.0
	valuable-0.1.0
	value-bag-1.0.0-alpha.9
	vcpkg-0.2.15
	version_check-0.9.4
	visibility-0.0.1
	visible-0.0.1
	void-1.0.2
	waker-fn-1.1.0
	walkdir-2.3.2
	want-0.3.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-futures-0.4.33
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	weak-table-0.3.2
	webpki-0.22.0
	web-sys-0.3.60
	wepoll-ffi-0.1.2
	wide-0.7.5
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.39.0
	windows-sys-0.36.1
	windows-sys-0.42.0
	windows_aarch64_gnullvm-0.42.0
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.39.0
	windows_aarch64_msvc-0.42.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.39.0
	windows_i686_gnu-0.42.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.39.0
	windows_i686_msvc-0.42.0
	windows_x86_64_gnullvm-0.42.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.39.0
	windows_x86_64_gnu-0.42.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.39.0
	windows_x86_64_msvc-0.42.0
	x509-signature-0.5.0
	x25519-dalek-2.0.0-pre.1
	xz2-0.1.7
	zeroize-1.5.7
	zeroize_derive-1.3.2
	zstd-0.11.2+zstd.1.5.2
	zstd-safe-5.0.2+zstd.1.5.2
	zstd-sys-2.0.4+zstd.1.5.2
"

inherit cargo

MY_P="${PN}-${PN}-v${PV}"

DESCRIPTION="An implementation of Tor, in Rust."
HOMEPAGE="https://gitlab.torproject.org/tpo/core/arti/"
SRC_URI="https://gitlab.torproject.org/tpo/core/${PN}/-/archive/${PN}-v${PV}/${PN}-${PN}-v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-arch/xz-utils
	dev-db/sqlite:3
	dev-libs/openssl:="
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

QA_FLAGS_IGNORED="usr/bin/arti"

src_compile() {
	cd crates/arti || die
	cargo_src_compile
}

src_test() {
	cd crates/arti || die
	cargo_src_test
}

src_install() {
	pushd crates/arti >/dev/null || due

	cargo_src_install
	newdoc src/arti-example-config.toml arti.toml

	popd >/dev/null || die

	dodoc -r doc/*
}