#/bin/bash

case "$(uname -s)" in
    Darwin*)    INPLACE_OPT=(-i '') ;;
    *)          INPLACE_OPT=(-i'')
esac
find . -type f | while read f; do
        LC_CTYPE=C LC_ALL=C LANG=C sed "${INPLACE_OPT[@]}" -e 's#com[.]termux#vn.vhn.vsc#g' $f || true
done
