# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.4.0.9999
#hackport: flags: exe:executable,+use-cbits

CABAL_HACKAGE_REVISION=3

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Fast, pure and practical SHA-256 implementation"
HOMEPAGE="https://github.com/hvr/cryptohash-sha256"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="executable"

CABAL_CHBINS=(
	'sha256sum' 'cryptohash-sha256sum'
)

RDEPEND="
	>=dev-lang/ghc-8.10.6:=
	executable? (
		|| (
			( >=dev-haskell/base16-bytestring-0.1.1 <dev-haskell/base16-bytestring-0.2 )
			=dev-haskell/base16-bytestring-1.0*
		)
		dev-haskell/base16-bytestring:=[profile?]
	)
"
DEPEND="
	${RDEPEND}
	>=dev-haskell/cabal-3.2.1.0
	test? (
		>=dev-haskell/sha-1.6.4 <dev-haskell/sha-1.7
		>=dev-haskell/tasty-1.4 <dev-haskell/tasty-1.6
		=dev-haskell/tasty-hunit-0.10*
		=dev-haskell/tasty-quickcheck-0.10*
		|| (
			( >=dev-haskell/base16-bytestring-0.1.1 <dev-haskell/base16-bytestring-0.2 )
			=dev-haskell/base16-bytestring-1.0*
		)
	)
"

src_configure() {
	local conf_flags=(
		$(cabal_flag executable exe)
		--flag=use-cbits
	)

	haskell-cabal_src_configure "${conf_flags[@]}"
}
