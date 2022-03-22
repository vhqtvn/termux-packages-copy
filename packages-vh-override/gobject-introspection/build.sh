save_function termux_step_configure termux_step_configure_bk
termux_step_configure() {
	termux_step_configure_bk \
    || (cp -r "$TERMUX_PKG_SRCDIR/giscanner/doctemplates" "$TERMUX_PKG_BUILDDIR/giscanner/" && termux_step_configure_bk )
}
