if [[ -z "$TERMUX_PKG_DEPENDS" ]]; then
    TERMUX_PKG_DEPENDS="zstd"
else
    TERMUX_PKG_DEPENDS+=", zstd"
fi