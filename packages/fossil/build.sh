TERMUX_PKG_HOMEPAGE=https://www.fossil-scm.org
TERMUX_PKG_DESCRIPTION="DSCM with built-in wiki, http interface and server, tickets database"
TERMUX_PKG_LICENSE="BSD 2-Clause"
TERMUX_PKG_LICENSE_FILE="COPYRIGHT-BSD2.txt"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION_HASH=7cfd58d771e77123dcccfce67da9da633fdba912b6e7019a84912146aa8f06ba
TERMUX_PKG_VERSION=2.15.2
TERMUX_PKG_SRCURL=https://fossil-scm.org/home/tarball/${TERMUX_PKG_VERSION_HASH}/fossil-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=39f5a3960ebaa4984fcc953c3307ead5c0f21da4f66ecad516872f89843fcf79
TERMUX_PKG_DEPENDS="libsqlite, openssl, zlib"

termux_step_pre_configure() {
	# Avoid mixup of flags between cross compilation
	# and native build.
	CC="$CC $CPPFLAGS $CFLAGS $LDFLAGS"
	unset CFLAGS LDFLAGS
}

termux_step_configure() {
	$TERMUX_PKG_SRCDIR/configure \
		--prefix=$TERMUX_PREFIX \
		--host=$TERMUX_HOST_PLATFORM \
		--json \
		--disable-internal-sqlite \
		--with-openssl=$TERMUX_PREFIX \
		--with-zlib=$TERMUX_PREFIX
}
