save_function termux_step_make termux_step_make_bk

termux_step_make_install() {
        termux_setup_golang
        export GOPATH=$TERMUX_PKG_BUILDDIR
        export BUILDDIR=$TERMUX_PREFIX/bin
        cd $TERMUX_PKG_SRCDIR
	go mod tidy || true
        make build-nogui
        install -Dm700 proton-bridge "$TERMUX_PREFIX"/bin/proton-bridge

}
