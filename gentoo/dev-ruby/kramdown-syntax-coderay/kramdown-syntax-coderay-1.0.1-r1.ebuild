# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33"

inherit ruby-fakegem

DESCRIPTION="Uses coderay to highlight code blocks/spans"
HOMEPAGE="https://github.com/kramdown/syntax-coderay"
LICENSE="MIT"

KEYWORDS="~amd64 ~arm64"
SLOT="$(ver_cut 1)"
IUSE="doc"

ruby_add_rdepend ">=dev-ruby/coderay-1.1:0 dev-ruby/kramdown:2"

each_ruby_test() {
	${RUBY} -Ilib:. -e 'Dir["test/test_*.rb"].each{|f| require f}' || die
}
