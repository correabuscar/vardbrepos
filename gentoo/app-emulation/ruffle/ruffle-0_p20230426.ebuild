# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	Inflector-0.11.4
	ab_glyph-0.2.21
	ab_glyph_rasterizer-0.1.8
	addr2line-0.19.0
	adler-1.0.2
	adler32-1.2.0
	ahash-0.7.6
	ahash-0.8.3
	aho-corasick-1.0.1
	aliasable-0.1.3
	alsa-0.7.0
	alsa-sys-0.3.1
	android-activity-0.4.1
	android-properties-0.2.2
	android_system_properties-0.1.5
	anstream-0.3.0
	anstyle-1.0.0
	anstyle-parse-0.2.0
	anstyle-query-1.0.0
	anstyle-wincon-1.0.0
	anyhow-1.0.70
	approx-0.5.1
	arboard-3.2.0
	arrayref-0.3.7
	arrayvec-0.7.2
	ash-0.37.2+1.3.238
	async-channel-1.8.0
	async-io-1.13.0
	async-lock-2.7.0
	atk-sys-0.16.0
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.67
	base64-0.13.1
	base64-0.21.0
	bindgen-0.64.0
	bit-set-0.5.3
	bit-vec-0.6.3
	bitflags-1.3.2
	bitflags-2.1.0
	bitstream-io-1.6.0
	block-0.1.6
	block-buffer-0.10.4
	block-sys-0.1.0-beta.1
	block2-0.2.0-alpha.6
	bumpalo-3.12.1
	bytemuck-1.13.1
	bytemuck_derive-1.4.1
	byteorder-1.4.3
	bytes-1.4.0
	cairo-sys-rs-0.16.3
	calloop-0.10.5
	castaway-0.1.2
	cc-1.0.79
	cesu8-1.1.0
	cexpr-0.6.0
	cfg-expr-0.15.1
	cfg-if-0.1.10
	cfg-if-1.0.0
	cfg_aliases-0.1.1
	chrono-0.4.24
	clang-sys-1.6.1
	clap-4.2.4
	clap_builder-4.2.4
	clap_derive-4.2.0
	clap_lex-0.4.1
	clipboard-win-4.5.0
	codespan-reporting-0.11.1
	color_quant-1.1.0
	colorchoice-1.0.0
	colored-2.0.0
	com-rs-0.2.1
	combine-4.6.6
	concurrent-queue-2.2.0
	console-0.15.5
	console_error_panic_hook-0.1.7
	convert_case-0.6.0
	cookie-factory-0.3.2
	core-foundation-0.9.3
	core-foundation-sys-0.6.2
	core-foundation-sys-0.8.4
	core-graphics-0.22.3
	core-graphics-types-0.1.1
	coreaudio-rs-0.11.2
	coreaudio-sys-0.2.12
	cpal-0.15.2
	cpufeatures-0.2.7
	crc-3.0.1
	crc-catalog-2.2.0
	crc32fast-1.3.2
	crossbeam-channel-0.5.8
	crossbeam-deque-0.8.3
	crossbeam-epoch-0.9.14
	crossbeam-utils-0.8.15
	crypto-common-0.1.6
	csv-1.2.1
	csv-core-0.1.10
	ctor-0.1.26
	curl-0.4.44
	curl-sys-0.4.61+curl-8.0.1
	cxx-1.0.94
	cxx-build-1.0.94
	cxxbridge-flags-1.0.94
	cxxbridge-macro-1.0.94
	d3d12-0.6.0
	darling-0.14.4
	darling_core-0.14.4
	darling_macro-0.14.4
	dasp_sample-0.11.0
	data-encoding-2.3.3
	derive-try-from-primitive-1.0.0
	diff-0.1.13
	digest-0.10.6
	dirs-4.0.0
	dirs-5.0.0
	dirs-sys-0.3.7
	dirs-sys-0.4.0
	dispatch-0.2.0
	dlib-0.5.0
	downcast-rs-1.2.0
	either-1.8.1
	embed-resource-2.1.1
	encode_unicode-0.3.6
	encoding_rs-0.8.32
	enum-map-2.5.0
	enum-map-derive-0.11.0
	enumset-1.0.12
	enumset_derive-0.6.1
	env_logger-0.10.0
	errno-0.3.1
	errno-dragonfly-0.1.2
	error-code-2.3.1
	euclid-0.22.9
	event-listener-2.5.3
	fastrand-1.9.0
	fdeflate-0.3.0
	flate2-1.0.25
	float_next_after-0.1.5
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.1.0
	futures-0.3.28
	futures-channel-0.3.28
	futures-core-0.3.28
	futures-executor-0.3.28
	futures-io-0.3.28
	futures-lite-1.13.0
	futures-macro-0.3.28
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	gdk-pixbuf-sys-0.16.3
	gdk-sys-0.16.0
	generational-arena-0.2.8
	generator-0.7.4
	generic-array-0.14.7
	gethostname-0.2.3
	getrandom-0.2.9
	gif-0.12.0
	gimli-0.27.2
	gio-sys-0.16.3
	glib-sys-0.16.3
	glob-0.3.1
	glow-0.12.1
	gobject-sys-0.16.3
	gpu-alloc-0.5.3
	gpu-alloc-types-0.2.0
	gpu-allocator-0.22.0
	gpu-descriptor-0.2.3
	gpu-descriptor-types-0.1.1
	gtk-sys-0.16.0
	hashbrown-0.12.3
	hashbrown-0.13.2
	hassle-rs-0.10.0
	heck-0.4.1
	hermit-abi-0.1.19
	hermit-abi-0.2.6
	hermit-abi-0.3.1
	hexf-parse-0.2.1
	http-0.2.9
	humantime-2.1.0
	iana-time-zone-0.1.56
	iana-time-zone-haiku-0.1.1
	ident_case-1.0.1
	idna-0.3.0
	image-0.24.6
	indexmap-1.9.3
	indicatif-0.17.3
	insta-1.29.0
	instant-0.1.12
	io-lifetimes-1.0.10
	is-terminal-0.4.7
	isahc-1.7.2
	itoa-1.0.6
	jni-0.19.0
	jni-0.20.0
	jni-0.21.1
	jni-sys-0.3.0
	jobserver-0.1.26
	jpeg-decoder-0.3.0
	js-sys-0.3.61
	khronos-egl-4.1.0
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.142
	libflate-1.3.0
	libflate_lz77-1.2.0
	libloading-0.7.4
	libloading-0.8.0
	libm-0.2.6
	libnghttp2-sys-0.1.7+1.45.0
	libtest-mimic-0.6.0
	libz-sys-1.1.8
	link-cplusplus-1.0.8
	linked-hash-map-0.5.6
	linkme-0.3.9
	linkme-impl-0.3.9
	linux-raw-sys-0.3.4
	lock_api-0.4.9
	log-0.4.17
	loom-0.5.6
	lyon-1.0.1
	lyon_algorithms-1.0.3
	lyon_geom-1.0.4
	lyon_path-1.0.3
	lyon_tessellation-1.0.10
	lzma-rs-0.3.0
	mach2-0.4.1
	malloc_buf-0.0.6
	matchers-0.1.0
	memchr-2.5.0
	memmap2-0.5.10
	memoffset-0.6.5
	memoffset-0.8.0
	metal-0.24.0
	mime-0.3.17
	minimal-lexical-0.2.1
	miniz_oxide-0.6.2
	miniz_oxide-0.7.1
	mio-0.8.6
	naga-0.12.0
	naga_oil-0.7.0
	ndk-0.7.0
	ndk-context-0.1.1
	ndk-sys-0.4.1+23.1.7779620
	nix-0.24.3
	nix-0.25.1
	nom-7.1.3
	nu-ansi-term-0.46.0
	num-bigint-0.4.3
	num-complex-0.4.3
	num-derive-0.3.3
	num-integer-0.1.45
	num-rational-0.4.1
	num-traits-0.2.15
	num_cpus-1.15.0
	num_enum-0.5.11
	num_enum_derive-0.5.11
	number_prefix-0.4.0
	objc-0.2.7
	objc-foundation-0.1.1
	objc-sys-0.2.0-beta.2
	objc2-0.3.0-beta.3.patch-leaks.3
	objc2-encode-2.0.0-pre.2
	objc_exception-0.1.2
	objc_id-0.1.1
	object-0.30.3
	oboe-0.5.0
	oboe-sys-0.5.0
	once_cell-1.17.1
	openssl-probe-0.1.5
	openssl-sys-0.9.86
	orbclient-0.3.44
	os_info-3.7.0
	ouroboros-0.15.6
	ouroboros_macro-0.15.6
	output_vt100-0.1.3
	overload-0.1.1
	owned_ttf_parser-0.19.0
	pango-sys-0.16.3
	parking-2.1.0
	parking_lot-0.12.1
	parking_lot_core-0.9.7
	path-slash-0.2.1
	peeking_take_while-0.1.2
	percent-encoding-2.2.0
	pin-project-1.0.12
	pin-project-internal-1.0.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.26
	png-0.17.8
	polling-2.8.0
	portable-atomic-0.3.19
	pp-rs-0.2.1
	ppv-lite86-0.2.17
	pretty_assertions-1.3.0
	primal-check-0.3.3
	proc-macro-crate-1.3.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.56
	profiling-1.0.8
	profiling-procmacros-1.0.8
	quick-xml-0.28.2
	quote-1.0.26
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	range-alloc-0.1.3
	raw-window-handle-0.5.2
	rayon-1.7.0
	rayon-core-1.11.0
	realfft-3.2.0
	redox_syscall-0.2.16
	redox_syscall-0.3.5
	redox_users-0.4.3
	regex-1.8.1
	regex-automata-0.1.10
	regex-syntax-0.6.29
	regex-syntax-0.7.1
	regress-0.5.0
	renderdoc-sys-1.0.0
	rfd-0.11.3
	rle-decode-fast-1.0.3
	ron-0.8.0
	rustc-demangle-0.1.23
	rustc-hash-1.1.0
	rustc_version-0.4.0
	rustdct-0.7.1
	rustfft-6.1.0
	rustix-0.37.14
	rustversion-1.0.12
	ryu-1.0.13
	safe_arch-0.6.0
	same-file-1.0.6
	schannel-0.1.21
	scoped-tls-1.0.1
	scopeguard-1.1.0
	scratch-1.0.5
	sctk-adwaita-0.5.4
	semver-1.0.17
	serde-1.0.160
	serde-wasm-bindgen-0.5.0
	serde-xml-rs-0.6.0
	serde_derive-1.0.160
	serde_json-1.0.96
	serde_spanned-0.6.1
	sha2-0.10.6
	sharded-slab-0.1.4
	shlex-1.1.0
	simd-adler32-0.3.5
	similar-2.2.1
	simple_asn1-0.6.2
	slab-0.4.8
	slotmap-1.0.6
	sluice-0.5.5
	smallvec-1.10.0
	smithay-client-toolkit-0.16.0
	socket2-0.4.9
	spirv-0.2.0+1.5.4
	static_assertions-1.1.0
	str-buf-1.0.6
	strength_reduce-0.2.4
	strict-num-0.1.0
	strsim-0.10.0
	symphonia-0.5.2
	symphonia-bundle-mp3-0.5.2
	symphonia-core-0.5.2
	symphonia-metadata-0.5.2
	syn-1.0.109
	syn-2.0.15
	synstructure-0.12.6
	system-deps-6.0.5
	target-lexicon-0.12.6
	termcolor-1.2.0
	thiserror-1.0.40
	thiserror-impl-1.0.40
	thread_local-1.1.7
	threadpool-1.8.1
	tiff-0.8.1
	time-0.3.20
	time-core-0.1.0
	time-macros-0.2.8
	tiny-skia-0.8.4
	tiny-skia-path-0.8.4
	tinyvec-1.6.0
	tinyvec_macros-0.1.1
	toml-0.5.11
	toml-0.7.3
	toml_datetime-0.6.1
	toml_edit-0.19.8
	tracing-0.1.37
	tracing-attributes-0.1.23
	tracing-core-0.1.30
	tracing-futures-0.2.5
	tracing-log-0.1.3
	tracing-subscriber-0.3.17
	tracing-tracy-0.10.0
	tracing-wasm-0.2.1
	tracy-client-0.14.2
	tracy-client-0.15.2
	tracy-client-sys-0.19.0
	tracy-client-sys-0.21.0
	transpose-0.2.2
	ttf-parser-0.19.0
	typed-arena-2.0.2
	typenum-1.16.0
	unicode-bidi-0.3.13
	unicode-ident-1.0.8
	unicode-normalization-0.1.22
	unicode-segmentation-1.10.1
	unicode-width-0.1.10
	unicode-xid-0.2.4
	url-2.3.1
	utf8parse-0.2.1
	valuable-0.1.0
	vcpkg-0.2.15
	vec_map-0.8.2
	version-compare-0.1.1
	version_check-0.9.4
	vswhom-0.1.0
	vswhom-sys-0.1.2
	waker-fn-1.1.0
	walkdir-2.3.3
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.84
	wasm-bindgen-backend-0.2.84
	wasm-bindgen-futures-0.4.34
	wasm-bindgen-macro-0.2.84
	wasm-bindgen-macro-support-0.2.84
	wasm-bindgen-shared-0.2.84
	wayland-client-0.29.5
	wayland-commons-0.29.5
	wayland-cursor-0.29.5
	wayland-protocols-0.29.5
	wayland-scanner-0.29.5
	wayland-sys-0.29.5
	weak-table-0.3.2
	web-sys-0.3.61
	webbrowser-0.8.9
	weezl-0.1.7
	wgpu-0.16.0
	wgpu-core-0.16.0
	wgpu-hal-0.16.0
	wgpu-types-0.16.0
	wide-0.7.8
	widestring-1.0.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-wsapoll-0.1.1
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.44.0
	windows-0.46.0
	windows-0.48.0
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winit-0.28.3
	winnow-0.4.1
	winreg-0.11.0
	x11-dl-2.21.0
	x11rb-0.10.1
	x11rb-protocol-0.10.0
	xcursor-0.3.4
	xml-rs-0.8.4
	yaml-rust-0.4.5
	yansi-0.5.1"
declare -A GIT_CRATES=(
	[dasp]="https://github.com/RustAudio/dasp;f05a703d247bb504d7e812b51e95f3765d9c5e94;dasp-%commit%/dasp"
	[flash-lso]="https://github.com/ruffle-rs/rust-flash-lso;8376453eddddbe701031a091c0eed94068fa5649;rust-flash-lso-%commit%/flash-lso"
	[gc-arena]="https://github.com/kyren/gc-arena;1a6310c0d5c98836fa9efb1c4773038ecfd5a92e;gc-arena-%commit%/src/gc-arena"
	[h263-rs-yuv]="https://github.com/ruffle-rs/h263-rs;d5d78eb251c1ce1f1da57c63db14f0fdc77a4b36;h263-rs-%commit%/yuv"
	[h263-rs]="https://github.com/ruffle-rs/h263-rs;d5d78eb251c1ce1f1da57c63db14f0fdc77a4b36;h263-rs-%commit%/h263"
	[nellymoser-rs]="https://github.com/ruffle-rs/nellymoser;4a33521c29a918950df8ae9fe07e527ac65553f5;nellymoser-%commit%"
	[nihav_codec_support]="https://github.com/ruffle-rs/nihav-vp6;9416fcc9fc8aab8f4681aa9093b42922214abbd3;nihav-vp6-%commit%/nihav-codec-support"
	[nihav_core]="https://github.com/ruffle-rs/nihav-vp6;9416fcc9fc8aab8f4681aa9093b42922214abbd3;nihav-vp6-%commit%/nihav-core"
	[nihav_duck]="https://github.com/ruffle-rs/nihav-vp6;9416fcc9fc8aab8f4681aa9093b42922214abbd3;nihav-vp6-%commit%/nihav-duck"
)
inherit cargo desktop flag-o-matic virtualx xdg

MY_PV="nightly-${PV:3:4}-${PV:7:2}-${PV:9:2}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Flash Player emulator written in Rust"
HOMEPAGE="https://ruffle.rs/"
SRC_URI="
	https://github.com/ruffle-rs/ruffle/archive/refs/tags/${MY_PV}.tar.gz -> ${MY_P}.tar.gz
	$(cargo_crate_uris)"
S="${WORKDIR}/${MY_P}"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 ZLIB curl"
SLOT="0"
KEYWORDS="~amd64"

# dlopen: libX* (see winit+x11-dl crates)
RDEPEND="
	dev-libs/glib:2
	dev-libs/openssl:=
	media-libs/alsa-lib
	sys-libs/zlib:=
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXrandr
	x11-libs/libXrender"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto"
BDEPEND="
	virtual/jre:*
	virtual/pkgconfig
	>=virtual/rust-1.64
	test? (
		media-libs/mesa[llvm]
		x11-base/xorg-server[-minimal]
	)"

QA_FLAGS_IGNORED="usr/bin/${PN}.*"

src_configure() {
	filter-lto # TODO: cleanup after bug #893658

	if use test; then
		# tests will be skipped if don't build everything
		cargo_src_configure --workspace
	else
		cargo_src_configure --package={ruffle_{desktop,scanner},exporter}
	fi
}

src_test() {
	virtx cargo_src_test
}

src_install() {
	dodoc README.md

	newicon web/packages/extension/assets/images/icon180.png ${PN}.png
	make_desktop_entry ${PN} ${PN^} ${PN} "AudioVideo;Player;Emulator;" \
		"MimeType=application/x-shockwave-flash;application/vnd.adobe.flash.movie;"

	# TODO: swap with /gentoo after https://github.com/gentoo/gentoo/pull/29510
	cd target/$(usex debug{,} release) || die

	newbin ${PN}_desktop ${PN}
	newbin exporter ${PN}_exporter
	dobin ${PN}_scanner
}

pkg_postinst() {
	xdg_pkg_postinst

	if [[ ! ${REPLACING_VERSIONS} ]]; then
		elog "${PN} is experimental software that is still under heavy development"
		elog "and only receiving nightly releases. Plans in Gentoo is to update"
		elog "roughly every months if no known major regressions (feel free to"
		elog "report if you feel a newer nightly is needed ahead of time)."
		elog
		elog "There is currently no plans to support wasm builds / browser"
		elog "extensions, this provides the desktop viewer and other tools."
	fi
}
