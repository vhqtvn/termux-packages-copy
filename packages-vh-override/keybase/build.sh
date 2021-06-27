save_function termux_step_make termux_step_make_bk

termux_step_make() {
	export GO111MODULE=off
	termux_step_make_bk
}
