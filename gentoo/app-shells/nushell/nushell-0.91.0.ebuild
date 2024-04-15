# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler32@1.2.0
	adler@1.0.2
	ahash@0.7.7
	ahash@0.8.7
	aho-corasick@1.1.2
	alloc-no-stdlib@2.0.4
	alloc-stdlib@0.2.2
	allocator-api2@0.2.16
	alphanumeric-sort@1.5.3
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	ansi-str@0.8.0
	ansitok@0.2.0
	anstream@0.6.11
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.4
	arboard@3.3.0
	argminmax@0.6.1
	array-init-cursor@0.2.0
	arrayvec@0.5.2
	arrayvec@0.7.4
	assert-json-diff@2.0.2
	assert_cmd@2.0.13
	async-stream-impl@0.3.5
	async-stream@0.3.5
	async-trait@0.1.77
	atoi@2.0.0
	atoi_simd@0.15.6
	autocfg@1.1.0
	avro-schema@0.3.0
	backtrace-ext@0.2.1
	backtrace@0.3.69
	base64@0.13.1
	base64@0.21.7
	bincode@1.3.3
	bindgen@0.68.1
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.4.2
	bitvec@1.0.1
	block-buffer@0.10.4
	block@0.1.6
	borsh-derive@1.3.1
	borsh@1.3.1
	bracoxide@0.1.3
	brotli-decompressor@2.5.1
	brotli@3.4.0
	bstr@1.9.0
	bumpalo@3.14.0
	byte-unit@5.1.4
	bytecheck@0.6.11
	bytecheck_derive@0.6.11
	bytecount@0.6.7
	bytemuck@1.14.1
	bytemuck_derive@1.5.0
	byteorder@1.5.0
	bytes@1.5.0
	bytesize@1.3.0
	calamine@0.24.0
	cassowary@0.3.0
	castaway@0.2.2
	cc@1.0.83
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	chardetng@0.1.17
	charset@0.1.3
	chrono-humanize@0.2.3
	chrono-tz-build@0.2.1
	chrono-tz@0.8.5
	chrono@0.4.34
	chumsky@0.9.3
	clang-sys@1.7.0
	clap@4.4.18
	clap_builder@4.4.18
	clap_lex@0.6.0
	clipboard-win@4.5.0
	codepage@0.1.1
	colorchoice@1.0.0
	comfy-table@7.1.0
	compact_str@0.7.1
	condtype@1.3.0
	console@0.15.8
	const-random-macro@0.1.16
	const-random@0.1.17
	const_format@0.2.32
	const_format_proc_macros@0.2.32
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	cpufeatures@0.2.12
	crc-catalog@1.1.1
	crc32fast@1.3.2
	crc@2.1.0
	crossbeam-channel@0.5.11
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.19
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	crypto-common@0.1.6
	cssparser-macros@0.6.1
	cssparser@0.31.2
	csv-core@0.1.11
	csv@1.3.0
	ctrlc@3.4.2
	dashmap@5.5.3
	deranged@0.3.11
	derive-new@0.5.9
	derive_more@0.99.17
	dialoguer@0.11.0
	diff@0.1.13
	difflib@0.4.0
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	divan-macros@0.1.14
	divan@0.1.14
	dlib@0.5.2
	dlv-list@0.5.2
	doc-comment@0.3.3
	downcast-rs@1.2.0
	dtoa-short@0.3.4
	dtoa@1.0.9
	dtparse@2.0.0
	dunce@1.0.4
	dyn-clone@1.0.16
	ego-tree@0.6.2
	either@1.9.0
	eml-parser@0.1.4
	encode_unicode@0.3.6
	encoding_rs@0.8.33
	enum_dispatch@0.3.12
	env_logger@0.8.4
	equivalent@1.0.1
	erased-serde@0.4.2
	errno@0.3.8
	error-code@2.3.1
	ethnum@1.5.0
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	fancy-regex@0.13.0
	fast-float@0.2.0
	fastrand@2.0.1
	fd-lock@3.0.13
	file-id@0.2.1
	filesize@0.2.0
	filetime@0.2.23
	fixedbitset@0.4.2
	flate2@1.0.28
	float-cmp@0.9.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	foreign_vec@0.1.0
	form_urlencoded@1.2.1
	fs_extra@1.3.0
	fsevent-sys@4.1.0
	funty@2.0.0
	futf@0.1.5
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-timer@3.0.2
	futures-util@0.3.30
	futures@0.3.30
	fuzzy-matcher@0.3.7
	fxhash@0.2.1
	generic-array@0.14.7
	gethostname@0.3.0
	getrandom@0.2.12
	gimli@0.28.1
	git2@0.18.1
	gjson@0.8.1
	glob@0.3.1
	h2@0.3.24
	halfbrown@0.2.4
	hamcrest2@0.3.0
	hash32@0.3.1
	hashbrown@0.12.3
	hashbrown@0.13.2
	hashbrown@0.14.3
	hashlink@0.9.0
	heapless@0.8.0
	heck@0.4.1
	hermit-abi@0.3.4
	hex@0.4.3
	home@0.5.9
	html5ever@0.26.0
	http-body@0.4.6
	http@0.2.11
	httparse@1.8.0
	httpdate@1.0.3
	human-date-parser@0.1.1
	hyper@0.14.28
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.59
	ical@0.10.0
	idna@0.5.0
	indexmap@2.2.2
	indicatif@0.17.7
	indoc@2.0.4
	inotify-sys@0.1.5
	inotify@0.9.6
	instant@0.1.12
	inventory@0.3.15
	is-docker@0.2.0
	is-wsl@0.4.0
	is_ci@1.2.0
	is_debug@1.0.1
	is_executable@1.0.1
	itertools@0.11.0
	itertools@0.12.0
	itoa@1.0.10
	itoap@1.0.1
	jobserver@0.1.27
	joinery@2.1.0
	js-sys@0.3.67
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lazy_static@1.4.0
	lazycell@1.3.0
	lexical-core@0.8.5
	lexical-parse-float@0.8.5
	lexical-parse-integer@0.8.6
	lexical-util@0.8.5
	lexical-write-float@0.8.5
	lexical-write-integer@0.8.5
	libc@0.2.152
	libflate@1.4.0
	libflate_lz77@1.2.0
	libgit2-sys@0.16.2+1.7.2
	libloading@0.8.1
	libm@0.2.8
	libmimalloc-sys@0.1.35
	libproc@0.14.2
	libredox@0.0.1
	libsqlite3-sys@0.28.0
	libssh2-sys@0.3.0
	libz-sys@1.1.15
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.13
	lock_api@0.4.11
	log@0.4.20
	lru@0.12.1
	lscolors@0.17.0
	lsp-server@0.7.6
	lsp-types@0.95.0
	lz4-sys@1.9.4
	lz4@1.24.0
	mac@0.1.1
	mach2@0.4.2
	malloc_buf@0.0.6
	markup5ever@0.11.0
	md-5@0.10.6
	memchr@2.7.1
	memmap2@0.7.1
	memoffset@0.7.1
	miette-derive@7.1.0
	miette@7.1.0
	mimalloc@0.1.39
	mime@0.3.17
	mime_guess@2.0.4
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.11
	mockito@1.3.0
	multiversion-macros@0.7.3
	multiversion@0.7.3
	native-tls@0.2.11
	new_debug_unreachable@1.0.4
	nix@0.26.4
	nix@0.27.1
	nom@7.1.3
	notify-debouncer-full@0.3.1
	notify@6.1.1
	now@0.1.3
	ntapi@0.4.1
	nu-ansi-term@0.50.0
	num-bigint@0.2.6
	num-bigint@0.4.4
	num-complex@0.2.4
	num-complex@0.4.4
	num-format@0.4.4
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.2.4
	num-rational@0.4.1
	num-traits@0.2.17
	num@0.2.1
	num@0.4.1
	num_cpus@1.16.0
	num_threads@0.1.6
	number_prefix@0.4.0
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	object@0.32.2
	omnipath@0.1.6
	once_cell@1.19.0
	open@5.0.1
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.2.3+3.2.1
	openssl-sys@0.9.99
	openssl@0.10.63
	ordered-multimap@0.7.1
	os_display@0.1.3
	os_pipe@1.1.5
	owo-colors@4.0.0
	papergrid@0.10.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	parquet-format-safe@0.2.4
	parse-zoneinfo@0.3.0
	paste@1.0.14
	pathdiff@0.2.1
	peeking_take_while@0.1.2
	percent-encoding@2.3.1
	peresil@0.3.0
	pest@2.7.6
	pest_derive@2.7.6
	pest_generator@2.7.6
	pest_meta@2.7.6
	petgraph@0.6.4
	phf@0.10.1
	phf@0.11.2
	phf_codegen@0.10.0
	phf_codegen@0.11.2
	phf_generator@0.10.0
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.10.0
	phf_shared@0.11.2
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkg-config@0.3.29
	planus@0.3.1
	polars-arrow-format@0.1.0
	polars-arrow@0.37.0
	polars-compute@0.37.0
	polars-core@0.37.0
	polars-error@0.37.0
	polars-io@0.37.0
	polars-json@0.37.0
	polars-lazy@0.37.0
	polars-ops@0.37.0
	polars-parquet@0.37.0
	polars-pipe@0.37.0
	polars-plan@0.37.0
	polars-row@0.37.0
	polars-sql@0.37.0
	polars-time@0.37.0
	polars-utils@0.37.0
	polars@0.37.0
	pori@0.0.0
	portable-atomic@1.6.0
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	precomputed-hash@0.1.1
	predicates-core@1.0.6
	predicates-tree@1.0.9
	predicates@3.1.0
	pretty_assertions@1.4.0
	print-positions@0.6.1
	proc-macro-crate@3.1.0
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.78
	procfs-core@0.16.0
	procfs@0.16.0
	psm@0.1.21
	ptr_meta@0.1.4
	ptr_meta_derive@0.1.4
	pure-rust-locales@0.8.1
	pwd@1.4.0
	quick-error@1.2.3
	quick-error@2.0.1
	quick-xml@0.31.0
	quickcheck@1.0.3
	quickcheck_macros@1.0.0
	quote@1.0.35
	quoted_printable@0.5.0
	radium@0.7.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_distr@0.4.3
	ratatui@0.26.0
	rayon-core@1.12.1
	rayon@1.8.1
	redox_syscall@0.4.1
	redox_users@0.4.4
	reedline@0.30.0
	ref-cast-impl@1.0.22
	ref-cast@1.0.22
	regex-automata@0.4.5
	regex-lite@0.1.5
	regex-syntax@0.8.2
	regex@1.10.3
	relative-path@1.9.2
	rend@0.4.1
	rfc2047-decoder@1.0.2
	rkyv@0.7.43
	rkyv_derive@0.7.43
	rle-decode-fast@1.0.3
	rmp-serde@1.1.2
	rmp@0.8.12
	ropey@1.6.1
	roxmltree@0.19.0
	rstest@0.18.2
	rstest_macros@0.18.2
	rusqlite@0.31.0
	rust-embed-impl@8.2.0
	rust-embed-utils@8.2.0
	rust-embed@8.2.0
	rust-ini@0.20.0
	rust_decimal@1.33.1
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustc_version@0.4.0
	rustix@0.38.31
	rustversion@1.0.14
	ryu@1.0.16
	same-file@1.0.6
	schannel@0.1.23
	scoped-tls@1.0.1
	scopeguard@1.2.0
	scraper@0.18.1
	seahash@4.1.0
	security-framework-sys@2.9.1
	security-framework@2.9.2
	selectors@0.25.0
	semver@1.0.21
	seq-macro@0.3.5
	serde@1.0.196
	serde_derive@1.0.196
	serde_json@1.0.112
	serde_repr@0.1.18
	serde_spanned@0.6.5
	serde_urlencoded@0.7.1
	serde_yaml@0.9.30
	serial_test@3.0.0
	serial_test_derive@3.0.0
	servo_arc@0.3.0
	sha2@0.10.8
	shadow-rs@0.26.1
	shell-words@1.1.0
	shlex@1.3.0
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	signal-hook@0.3.17
	simd-json@0.13.8
	simdutf8@0.1.4
	similar@2.4.0
	simplelog@0.12.1
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.13.1
	smartstring@1.0.1
	smawk@0.3.2
	snap@1.1.1
	socket2@0.5.5
	sqlparser@0.39.0
	sqlparser@0.43.1
	stability@0.1.1
	stable_deref_trait@1.2.0
	stacker@0.1.15
	static_assertions@1.1.0
	str-buf@1.0.6
	str_indices@0.4.3
	streaming-decompression@0.1.2
	streaming-iterator@0.1.9
	strength_reduce@0.2.4
	string_cache@0.8.7
	string_cache_codegen@0.5.2
	strip-ansi-escapes@0.2.0
	strsim@0.10.0
	strum@0.25.0
	strum@0.26.1
	strum_macros@0.25.3
	strum_macros@0.26.1
	supports-color@3.0.0
	supports-hyperlinks@3.0.0
	supports-unicode@3.0.0
	sxd-document@0.3.2
	sxd-xpath@0.4.2
	syn@1.0.109
	syn@2.0.48
	syn_derive@0.1.8
	sys-locale@0.3.1
	sysinfo@0.30.5
	tabled@0.14.0
	tap@1.0.1
	target-features@0.1.5
	tempfile@3.10.0
	tendril@0.4.3
	termcolor@1.1.3
	terminal_size@0.3.0
	termtree@0.4.1
	textwrap@0.16.0
	thiserror-impl@1.0.56
	thiserror@1.0.56
	thread_local@1.1.7
	time-core@0.1.2
	time-macros@0.2.16
	time@0.3.31
	tiny-keccak@2.0.2
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	titlecase@2.2.1
	tokio-util@0.7.10
	tokio@1.35.1
	toml@0.7.8
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.21.0
	tower-service@0.3.2
	tracing-core@0.1.32
	tracing@0.1.40
	trash@3.3.1
	tree_magic_mini@3.0.3
	try-lock@0.2.5
	typed-arena@1.7.0
	typenum@1.17.0
	typetag-impl@0.2.15
	typetag@0.2.15
	ucd-trie@0.1.6
	umask@2.1.0
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.22
	unicode-reverse@1.0.8
	unicode-segmentation@1.11.0
	unicode-width@0.1.11
	unicode-xid@0.2.4
	unsafe-libyaml@0.2.10
	ureq@2.9.1
	url@2.5.0
	utf-8@0.7.6
	utf8-width@0.1.7
	utf8parse@0.2.1
	uu_cp@0.0.23
	uu_mkdir@0.0.23
	uu_mktemp@0.0.23
	uu_mv@0.0.23
	uu_whoami@0.0.23
	uucore@0.0.24
	uucore_procs@0.0.24
	uuhelp_parser@0.0.24
	uuid@1.7.0
	v_htmlescape@0.15.8
	value-trait@0.8.1
	vcpkg@0.2.15
	version_check@0.9.4
	vte@0.10.1
	vte@0.11.1
	vte_generate_state_changes@0.1.1
	wait-timeout@0.2.0
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.90
	wasm-bindgen-macro-support@0.2.90
	wasm-bindgen-macro@0.2.90
	wasm-bindgen-shared@0.2.90
	wasm-bindgen@0.2.90
	wax@0.6.0
	wayland-backend@0.3.3
	wayland-client@0.31.2
	wayland-protocols-wlr@0.2.0
	wayland-protocols@0.31.2
	wayland-scanner@0.31.1
	wayland-sys@0.31.1
	which@6.0.0
	wild@2.2.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-wsapoll@0.1.1
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows@0.44.0
	windows@0.52.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.35
	winreg@0.52.0
	winresource@0.1.17
	wl-clipboard-rs@0.8.0
	wyz@0.5.1
	x11rb-protocol@0.12.0
	x11rb@0.12.0
	xattr@1.3.1
	xxhash-rust@0.8.8
	yansi@0.5.1
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
	zip@0.6.6
	zstd-safe@7.0.0
	zstd-sys@2.0.9+zstd.1.5.5
	zstd@0.13.0
"

inherit cargo

DESCRIPTION="A new type of shell, written in Rust"
HOMEPAGE="https://www.nushell.sh"
SRC_URI="
	https://github.com/nushell/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	0BSD Apache-2.0 BSD Boost-1.0 CC-PD CC0-1.0 ISC MIT MPL-2.0 MPL-2.0
	Unicode-DFS-2016 ZLIB
"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64 ~riscv"
IUSE="dataframe extra"

DEPEND="
	>=dev-libs/libgit2-0.99:=
	dev-libs/oniguruma:=
	dev-libs/openssl:0=
	net-libs/libssh2:=
	net-libs/nghttp2:=
	net-misc/curl
	dev-db/sqlite:3=
	x11-libs/libX11
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.60
	virtual/pkgconfig
"

RESTRICT+=" test"

QA_FLAGS_IGNORED="usr/bin/nu.*"

src_prepare() {
	default
}

src_configure() {
	# high magic to allow system-libs
	export OPENSSL_NO_VENDOR=true
	export RUSTONIG_SYSTEM_LIBONIG=1
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
	export LIBSSH2_SYS_USE_PKG_CONFIG=1
	export PKG_CONFIG_ALLOW_CROSS=1

	local myfeatures=(
		stable
		$(usev dataframe)
		$(usev extra)
	)

	cargo_src_configure
}

src_compile() {
	cargo_src_compile --workspace
}

src_install() {
	cargo_src_install
	local DOCS=( README.md )
	einstalldocs
}