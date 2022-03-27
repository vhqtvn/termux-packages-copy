if [[ "$TERMUX_PKG_VERSION" == "1.21.1" ]]; then
    TERMUX_VH_SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
    TERMUX_PKG_VERSION=1.21.3
    TERMUX_PKG_REVISION=$TERMUX_PKG_REVISION-vheditor
    TERMUX_PKG_SRCURL=https://mirrors.kernel.org/debian/pool/main/d/dpkg/dpkg_${TERMUX_PKG_VERSION}.tar.xz
    TERMUX_PKG_SHA256=668222141dde0f352eee75d46b07f5f1cf3b9550464b54c2287bdd15650c499a
    save_function termux_step_patch_package termux_step_patch_package_bk
    termux_step_patch_package() {
        find "$TERMUX_VH_SCRIPT_DIR" -iname "*.patch" | while read fpath; do
            fn=$(basename "$fpath")
            if [[ -f $TERMUX_PKG_BUILDER_DIR/$fn ]]; then
                mv $TERMUX_PKG_BUILDER_DIR/$fn $TERMUX_PKG_BUILDER_DIR/.data-backup.$fn.data-backup.
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
