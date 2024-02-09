# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.3.0

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A Testing Framework for Haskell"
HOMEPAGE="https://hspec.github.io/"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND=">=dev-haskell/ansi-terminal-0.6.2:=[profile?]
	>=dev-haskell/call-stack-0.2.0:=[profile?]
	>=dev-haskell/hspec-expectations-0.8.2:=[profile?] <dev-haskell/hspec-expectations-0.8.3:=[profile?]
	>=dev-haskell/hunit-1.6:=[profile?] <dev-haskell/hunit-1.7:=[profile?]
	>=dev-haskell/quickcheck-2.13.1:=[profile?]
	>=dev-haskell/quickcheck-io-0.2.0:=[profile?]
	dev-haskell/random:=[profile?]
	dev-haskell/setenv:=[profile?]
	>=dev-haskell/stm-2.2:=[profile?]
	dev-haskell/tf-random:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? (
		dev-haskell/base-orphans
		~dev-haskell/hspec-meta-2.10.5
		>=dev-haskell/quickcheck-2.14
		>=dev-haskell/silently-1.2.4
		dev-haskell/temporary
	)
"

pkg_pretend() {
	if use test; then
		ewarn "The \"test\" USE flag for this package creates cycles within the"
		ewarn "dependency graph. This may give you problems during 'haskell-updater' runs."
		ewarn "It is recommended to leave it disabled unless explicitly testing the package."
	fi
}