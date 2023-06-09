# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby26 ruby27 ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="FAQ.txt History.txt README.md"

inherit ruby-fakegem

DESCRIPTION="Trollop is a commandline option parser for Ruby"
HOMEPAGE="https://manageiq.github.io/trollop/"
LICENSE="MIT"

KEYWORDS="amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~ppc-macos ~x64-macos ~x64-solaris"
SLOT="2"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/chronic )"

all_ruby_prepare() {
	sed -i -e '/bundle/ s:^:#:' Rakefile || die
}

each_ruby_test() {
	MUTANT=true ${RUBY} -S rake test || die "Tests failed."
}
