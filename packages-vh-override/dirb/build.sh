save_function termux_step_make termux_step_make_bk
termux_step_make() {
    cat "$TERMUX_PKG_SRCDIR/src/variables.h" | sed 's/^[a-zA-Z]/VAR_EXTERN \0/g' > /tmp/patched-variables.h
    (echo '#ifndef VAR_EXTERN'; echo '# define VAR_EXTERN extern'; echo '#endif'; cat /tmp/patched-variables.h) > "$TERMUX_PKG_SRCDIR/src/variables.h"
    rm -rf /tmp/patched-variables.h
    cp "$TERMUX_PKG_SRCDIR/src/dirb.c" /tmp/patched.c
    (echo '#define VAR_EXTERN'; cat /tmp/patched.c) > "$TERMUX_PKG_SRCDIR/src/dirb.c"
    rm -rf /tmp/patched.c
	termux_step_make_bk
}
