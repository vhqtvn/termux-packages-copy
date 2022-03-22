termux_step_make_install() {
	# See the "install" script for flags:
	$CC $CFLAGS $CPPFLAGS $LDFLAGS dcraw.c -lm -ljasper -ljpeg -llcms2 -o $TERMUX_PREFIX/bin/dcraw
	chmod +w dcraw.1 # Add missing write permission
	cp dcraw.1 $TERMUX_PREFIX/share/man/man1/
}
