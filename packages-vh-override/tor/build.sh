
save_function termux_step_pre_configure termux_step_pre_configure_bk
termux_step_pre_configure() {
    sed -i'' -E 's/PF_FILE/PF_LOCAL/g' "$TERMUX_PKG_SRCDIR/src/lib/sandbox/sandbox.c"
	termux_step_pre_configure_bk
}
