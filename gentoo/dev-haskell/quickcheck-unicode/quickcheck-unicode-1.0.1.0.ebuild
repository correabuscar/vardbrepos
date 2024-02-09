# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.4.0.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Generator and shrink functions for testing Unicode-related software"
HOMEPAGE="https://github.com/bos/quickcheck-unicode"

LICENSE="BSD-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND=">=dev-haskell/quickcheck-2.7:=[profile?]
	>=dev-lang/ghc-8.10.6:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.2.1.0
"