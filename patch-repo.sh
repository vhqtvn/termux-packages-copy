#!/usr/bin/env bash

case "$(uname -s)" in
    Darwin*)    INPLACE_OPT=(-i ''); ;;
    *)          INPLACE_OPT=(-i''); ;;
esac
do_replace() {
    find . -path ./debs -prune -false -o \
           -path ./.git -prune -false -o \
           -path ./.github -prune -false -o \
           -type f | while read f; do
            LC_CTYPE=C LC_ALL=C LANG=C sed "${INPLACE_OPT[@]}" -e "$1" "$f" 2>&1 || true
    done
}
if [[ "$1" == "--reverse" ]] || [[ "$1" == "-r" ]]; then
    echo "* Replace vsc->termux in $(pwd)"
    [[ -f scripts/build/termux_step_setup_variables.sh ]] && LC_CTYPE=C LC_ALL=C LANG=C sed "${INPLACE_OPT[@]}" -e "s#vsc[.]vhn[.]vn#grim""ler.se#g" "scripts/build/termux_step_setup_variables.sh"
    do_replace 's#vn[.]vhn[.]vsc#com.t''ermux#g'
    do_replace 's#csv[.]nhv[.]nv#xumre''t.moc#g'
    do_replace 's#//vsc[.]vhn[.]vn#//ter''mux.org#g'
else
    echo "* Replace termux->vsc in $(pwd)"
    [[ -f scripts/build/termux_step_setup_variables.sh ]] && LC_CTYPE=C LC_ALL=C LANG=C sed "${INPLACE_OPT[@]}" -e "s#grimler[.]se#vsc.v""hn.vn#g" "scripts/build/termux_step_setup_variables.sh"
    do_replace 's#com[.]termux#vn.vh''n.vsc#g'
    do_replace 's#xumret[.]moc#csv.nh''v.nv#g'
    do_replace 's#//termux[.]org#//vsc.vh''n.vn#g'
fi
