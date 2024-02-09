# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.2.1.9999

CABAL_HACKAGE_REVISION=2

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Compatibility package for the Foldable1 and Bifoldable1 type classes"
HOMEPAGE="https://github.com/haskell-compat/foldable1-classes-compat"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="+tagged"

RDEPEND=">=dev-lang/ghc-8.8.1:=
	tagged? (
		>=dev-haskell/tagged-0.4.4:=[profile?] <dev-haskell/tagged-1:=[profile?]
	)
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0.0.0
	test? (
		>=dev-haskell/quickcheck-2.13.2 <dev-haskell/quickcheck-2.15
		>=dev-haskell/quickcheck-instances-0.3.27 <dev-haskell/quickcheck-instances-0.4
		>=dev-haskell/test-framework-0.8.2.0 <dev-haskell/test-framework-0.9
		>=dev-haskell/test-framework-quickcheck2-0.3.0.5 <dev-haskell/test-framework-quickcheck2-0.4
	)
"

pkg_pretend() {
	if use test; then
		ewarn "The \"test\" USE flag for this package creates cycles within the"
		ewarn "dependency graph. This may give you problems during 'haskell-updater' runs."
		ewarn "It is recommended to leave it disabled unless explicitly testing the package."
	fi
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag tagged tagged)
}