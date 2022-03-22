
save_function termux_step_post_configure termux_step_post_configure_bk
termux_step_post_configure() {
    sed -i'' 's/\/home\/builder\/.termux-build\/libprotobuf\/build\/\/data\/data/\/data\/data/g' "$TERMUX_PKG_BUILDDIR/cmake_install.cmake" || true
	termux_step_post_configure_bk
}
