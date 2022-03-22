
save_function termux_step_post_get_source termux_step_post_get_source_bk
termux_step_post_get_source() {
    sed -i'' -E 's/SIGSTKSZ/(8192)/g' "$TERMUX_PKG_SRCDIR/src/tests/doctest.cpp"
    sed -i'' -E 's/SIGSTKSZ/(8192)/g' "$TERMUX_PKG_SRCDIR/src/tests/doctest.h"
	termux_step_post_get_source_bk
}
