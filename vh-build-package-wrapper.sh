#!/bin/bash
# shellcheck disable=SC1117

./scripts/buildorder.py > /tmp/build-order

while read -r PKG PKG_DIR; do
    if grep -Fxq "$PKG" ./built_packages.txt; then
    	./build-package.sh "$@" "$PKG"
    fi
done </tmp/build-order
