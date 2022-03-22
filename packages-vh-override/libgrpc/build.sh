
save_function termux_setup_ninja termux_setup_ninja_bk
termux_setup_ninja() {
    sed -i'' 's/std::max[(]SIGSTKSZ, 65536[)]/std::max((int)SIGSTKSZ, (int) 65536)/g' "$TERMUX_PKG_SRCDIR/third_party/abseil-cpp/absl/debugging/failure_signal_handler.cc"
	termux_setup_ninja_bk
}
