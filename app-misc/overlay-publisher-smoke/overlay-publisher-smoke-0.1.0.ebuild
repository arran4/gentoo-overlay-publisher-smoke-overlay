# Copyright 2026 Gentoo Overlay Publisher contributors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Nonproduction overlay publisher end-to-end test fixture"
HOMEPAGE="https://github.com/arran4/gentoo-overlay-publisher-smoke-overlay"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

S="${WORKDIR}"

src_install() {
	newbin "${FILESDIR}/overlay-publisher-smoke" overlay-publisher-smoke
}
