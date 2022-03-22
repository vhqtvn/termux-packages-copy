
save_function termux_step_pre_configure termux_step_pre_configure_bk
termux_step_pre_configure() {
    sed -i'' 's/gtest\/gtest.h/gtest.h/g' "$TERMUX_PKG_SRCDIR/third-party/gtest-1.8.1/fused-src/gtest/gtest-all.cc"
	termux_step_pre_configure_bk
}
