save_function termux_step_post_get_source termux_step_post_get_source_bk


termux_step_post_get_source() {
    termux_step_post_get_source_bk
    rm -rf "$TERMUX_PKG_HOSTBUILD_DIR"
}
