#!/usr/bin/env bash

case "$(uname -s)" in
    Darwin*)    INPLACE_OPT=(-i ''); ;;
    *)          INPLACE_OPT=(-i''); ;;
esac
do_replace() {
    TMP_FILE=/tmp/mtime-$(cat /proc/sys/kernel/random/uuid)
    find . -path ./debs -prune -false -o \
           -path ./debs-bk -prune -false -o \
           -path ./.git -prune -false -o \
           -iname 'vh-tmp-*' -prune -false -o \
           -path ./.github -prune -false -o \
           -type f | while read f; do
           touch -r "$f" "$TMP_FILE"
            LC_CTYPE=C LC_ALL=C LANG=C sed "${INPLACE_OPT[@]}" -e "$1" "$f" 2>&1 || true
           touch -r "$TMP_FILE" "$f" 
           rm -f "$TMP_FILE"
    done
}
if [[ "$1" == "--reverse" ]] || [[ "$1" == "-r" ]]; then
    echo "* Replace vsc->termux in $(pwd)"
    if [[ -f scripts/build/termux_step_setup_variables.sh ]]; then
        if [[ -f scripts/build/termux_step_setup_variables.sh.~ ]]; then
            cp scripts/build/termux_step_setup_variables.sh.~ scripts/build/termux_step_setup_variables.sh
        fi
    fi
    if [[ -f scripts/build/termux_get_repo_files.sh ]]; then
        if [[ -f scripts/build/termux_get_repo_files.sh.~ ]]; then
            cp scripts/build/termux_get_repo_files.sh.~ scripts/build/termux_get_repo_files.sh
        fi
    fi
    do_replace 's#vn[.]vhn[.]vsc#com.t''ermux#g'
    do_replace 's#csv[.]nhv[.]nv#xumre''t.moc#g'
    # if [[ -f scripts/vh-patches.php ]]; then
    #     php scripts/vh-patches.php patch --reverse
    # fi
else
    echo "* Replace termux->vsc in $(pwd)"
    # if [[ -f scripts/vh-patches.php ]]; then
    #     php scripts/vh-patches.php patch
    # fi
    if [[ -f scripts/build/termux_step_setup_variables.sh ]]; then
        if [[ ! -f scripts/build/termux_step_setup_variables.sh.~ ]]; then
            cp scripts/build/termux_step_setup_variables.sh scripts/build/termux_step_setup_variables.sh.~
        fi
        cat scripts/build/termux_step_setup_variables.sh.~ \
            | LC_CTYPE=C LC_ALL=C LANG=C sed -e "s#TERMUX_BUILD_TUPLE=#TERMUX_REPO_URL=(\nhttps://vsc.vhn.vn/termux-packages-24\n)\nTERMUX_REPO_DISTRIBUTION=(\nstable\n)\nTERMUX_REPO_COMPONENT=(\nmain\n)\nTERMUX_BUILD_TUPLE=#g" \
            > scripts/build/termux_step_setup_variables.sh
    else
        #find . -iname nl_langinfo.c -exec cp /dev/null {} \;
    	true
    fi
    for ff in scripts/build/termux_download_deb_pac.sh scripts/build/termux_get_repo_files.sh; do
        if [[ -f $ff ]]; then
            if [[ ! -f $ff.~ ]]; then
                cp $ff $ff.~
            fi
            cat $ff.~ \
                | LC_CTYPE=C LC_ALL=C LANG=C sed -e "s#get_hash_from_file#vh_get_hash_single_from_file#g" \
                > $ff
        fi
    done
    do_replace 's#com[.]termux#vn.vh''n.vsc#g'
    do_replace 's#xumret[.]moc#csv.nh''v.nv#g'
fi
