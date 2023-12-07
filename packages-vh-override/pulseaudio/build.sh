save_function termux_step_pre_configure termux_step_pre_configure_bk
termux_step_pre_configure() {
	LDFLAGS+=" -Wl,--undefined-version"
	termux_step_pre_configure_bk
}