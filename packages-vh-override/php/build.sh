save_function termux_step_pre_configure termux_step_pre_configure_bk
termux_step_pre_configure() {
	CFLAGS+=" --start-no-unused-arguments -Wno-error=incompatible-function-pointer-types --end-no-unused-arguments"
	CXXFLAGS+=" --start-no-unused-arguments -Wno-error=incompatible-function-pointer-types --end-no-unused-arguments"
	termux_step_pre_configure_bk
}