termux_step_pre_configure() {
	VH_ORIG_AR=$AR
	AR="$TERMUX_SCRIPTDIR/packages-vh-override/tinyscheme/ar-mod $(which $VH_ORIG_AR)"
        LD=$CC
}
