save_function termux_step_make termux_step_make_bk
termux_step_make() {
    sed -i'' 's/swab/s_w_a_b___/g' "$TERMUX_PKG_SRCDIR/converter/other/cameratopam/camera.c"
    sed -i'' 's/swab/s_w_a_b___/g' "$TERMUX_PKG_SRCDIR/converter/other/cameratopam/util.c"
	termux_step_make_bk
}
