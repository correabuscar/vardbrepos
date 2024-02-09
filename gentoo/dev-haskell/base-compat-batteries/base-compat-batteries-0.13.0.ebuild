# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.2.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="base-compat with extra batteries"
HOMEPAGE="https://hackage.haskell.org/package/base-compat-batteries"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND="
	~dev-haskell/base-compat-0.13.0:=[profile?]
	>=dev-haskell/foldable1-classes-compat-0.1:=[profile?] <dev-haskell/foldable1-classes-compat-0.2:=[profile?]
	>=dev-haskell/onetuple-0.4:=[profile?] <dev-haskell/onetuple-0.5:=[profile?]
	>=dev-lang/ghc-8.8.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0.0.0
	test? (
		>=dev-haskell/hspec-1.8
		dev-haskell/quickcheck
	)
"