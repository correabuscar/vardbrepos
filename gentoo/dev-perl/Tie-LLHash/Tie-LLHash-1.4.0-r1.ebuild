# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=XAERXESS
DIST_VERSION=1.004
inherit perl-module

DESCRIPTION="Implements an ordered hash-like object"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="virtual/perl-Carp"
BDEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? ( >=virtual/perl-Test-Simple-0.880.0 )
"

src_test() {
	perl_rm_files t/10_changes.t t/11_kwalitee.t
	perl-module_src_test
}
