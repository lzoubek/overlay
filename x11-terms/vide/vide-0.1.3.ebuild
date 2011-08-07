# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit eutils

DESCRIPTION="VIDE multi-tab terminal with DBUS support"
HOMEPAGE="http://github.com/lzap/vide"
SRC_URI="http://lzap.fedorapeople.org/temp/${PN}-${PV}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=">=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.12:2
	dev-libs/libgee"
DEPEND="${RDEPEND}
	dev-lang/vala:0.12
	dev-util/pkgconfig
	sys-devel/gettext"

src_configure() {
	VALAC=$(type -p valac-0.12)
	econf
}

src_install() {
	emake DESTDIR="${D}" install || die
}

