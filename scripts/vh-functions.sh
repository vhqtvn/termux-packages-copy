case "$(uname -s)" in
    Darwin*)    VH_SED_OPT_INPLACE_OPT=(-i ''); ;;
    *)          VH_SED_OPT_INPLACE_OPT=(-i''); ;;
esac

save_function() {
    local ORIG_FUNC=$(declare -f $1)
    local NEWNAME_FUNC="$2${ORIG_FUNC#$1}"
    eval "$NEWNAME_FUNC"
}

vh_termux_do_replace() {
    pushd "$2"
    TMP_FILE=/tmp/mtime-$(cat /proc/sys/kernel/random/uuid)
    find . -path ./debs -prune -false -o \
           -path ./debs-bk -prune -false -o \
           -path ./.git -prune -false -o \
           -iname 'vh-tmp-*' -prune -false -o \
           -path ./.github -prune -false -o \
           -type f | while read f; do
           touch -r "$f" "$TMP_FILE"
            LC_CTYPE=C LC_ALL=C LANG=C sed "${VH_SED_OPT_INPLACE_OPT[@]}" -e "$1" "$f" 2>&1 || true
           touch -r "$TMP_FILE" "$f"
           rm -f "$TMP_FILE"
    done
    popd
}
