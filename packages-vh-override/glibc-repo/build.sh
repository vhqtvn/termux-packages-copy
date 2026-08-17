# vheditor overlay: register OUR mirrored glibc repository instead of termux's.
# The base recipe writes a glibc.list pointing at packages-cf.termux.dev/apt/termux-glibc;
# we publish the rebranded (vn.vhn.vsc) glibc packages under distribution `glibc` component
# `main` at the shared repo root https://vsc.vhn.vn/termux-packages-24. Same signing key that
# already backs the main repo. Bump revision so installs pick up the changed content.
TERMUX_PKG_REVISION=1

termux_step_make_install() {
	mkdir -p $TERMUX_PREFIX/etc/apt/sources.list.d
	{
		echo "# The vheditor glibc repository"
		echo "deb [trusted=yes] https://vsc.vhn.vn/termux-packages-24 glibc main"
	} > $TERMUX_PREFIX/etc/apt/sources.list.d/glibc.list
}
