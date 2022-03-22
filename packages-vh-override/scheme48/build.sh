TERMUX_PKG_BLACKLISTED_ARCHES="arm i686"

save_function termux_step_post_get_source termux_step_post_get_source_bk
termux_step_post_get_source() {
	if [[ -f $TERMUX_PKG_SRCDIR/c/event.h ]]; then
  		mv $TERMUX_PKG_SRCDIR/c/event.h $TERMUX_PKG_SRCDIR/c/scheme48-event-zz.h
		vh_termux_do_replace 's#event[.]h#scheme48-event-zz.h#g' "$TERMUX_PKG_SRCDIR"
	fi
	termux_step_post_get_source_bk
}
