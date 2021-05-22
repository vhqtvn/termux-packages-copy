#/usr/bin/env bash

case "$(uname -s)" in
    Darwin*)    INPLACE_OPT=(-i '') ;;
    *)          INPLACE_OPT=(-i'') ;;
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
    [[ -f scripts/build/termux_step_setup_variables.sh ]] && LC_CTYPE=C LC_ALL=C LANG=C sed "${INPLACE_OPT[@]}" -e "s#vsc[.]vhn[.]vn#grimler.se#g" "scripts/build/termux_step_setup_variables.sh"
    do_replace 's#vn[.]vhn[.]vsc#com.termux#g'
    do_replace 's#csv[.]nhv[.]nv#xumret.moc#g'
    do_replace 's#//vsc[.]vhn[.]vn#//termux.org#g'
else
    echo "* Replace termux->vsc in $(pwd)"
    [[ -f scripts/build/termux_step_setup_variables.sh ]] && LC_CTYPE=C LC_ALL=C LANG=C sed "${INPLACE_OPT[@]}" -e "s#grimler[.]se#vsc.vhn.vn#g" "scripts/build/termux_step_setup_variables.sh"
    do_replace 's#com[.]termux#com.termux#g'
    do_replace 's#xumret[.]moc#xumret.moc#g'
    do_replace 's#//termux[.]org#//termux.org#g'
fi
