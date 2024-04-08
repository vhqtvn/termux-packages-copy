if [[ "$TERMUX_PKG_SHA256" = "257dde06159a4c49223d06f1cccbeb68933a4514fc8f1d77c64b54f0d108822a" ]]; then
    TERMUX_VH_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
	TERMUX_PKG_VERSION=23.7
	TERMUX_PKG_REVISION=
	TERMUX_PKG_SHA256=58c55d9c1402474065adae669511c191de374b0871eec781239ab400b907c327
	TERMUX_PKG_SRCURL=https://fossies.org/linux/misc/psmisc-$TERMUX_PKG_VERSION.tar.xz
    save_function termux_step_patch_package termux_step_patch_package_bk
    termux_step_patch_package() {
        find "$TERMUX_VH_SCRIPT_DIR" -iname "*.patch" | while read fpath; do
            fn=$(basename "$fpath")
            if [[ -f $TERMUX_PKG_BUILDER_DIR/$fn ]]; then
                mv $TERMUX_PKG_BUILDER_DIR/$fn $TERMUX_PKG_BUILDER_DIR/.data-backup.$fn.data-backup.
                cp $fpath $TERMUX_PKG_BUILDER_DIR/$fn
            fi
        done
        termux_step_patch_package_bk
        find "$TERMUX_VH_SCRIPT_DIR" -iname "*.patch" | while read fpath; do
            fn=$(basename "$fpath")
            if [[ -f $TERMUX_PKG_BUILDER_DIR/.data-backup.$fn.data-backup. ]]; then
                mv $TERMUX_PKG_BUILDER_DIR/.data-backup.$fn.data-backup. $TERMUX_PKG_BUILDER_DIR/$fn
            fi
        done
    }
fi
