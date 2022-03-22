
save_function termux_step_pre_configure termux_step_pre_configure_bk
termux_step_pre_configure() {
    sed -i'' 's/VERSIONINFO gVersionInfo/static  VERSIONINFO  gVersionInfo/g' "$TERMUX_PKG_SRCDIR/include/ipmitool/ipmi_hpmfwupg.h"
	termux_step_pre_configure_bk
}
