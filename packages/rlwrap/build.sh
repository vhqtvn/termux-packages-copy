TERMUX_PKG_HOMEPAGE=https://github.com/hanslub42/rlwrap
TERMUX_PKG_DESCRIPTION="Wrapper using readline to enable editing of keyboard input for commands"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=0.45
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=https://github.com/hanslub42/rlwrap/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=780faa7330f306430aaf895984c936f451a8d35555145eff5451dc57b0c3ba8c
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
ac_cv_func_grantpt=yes
ac_cv_func_unlockpt=yes
ac_cv_lib_util_openpty=no
ptyttylib_cv_ptys=STREAMS
"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_DEPENDS="ncurses, readline"

termux_step_pre_configure() {
	#aclocal
	#automake --add-missing
	autoreconf -i
}
