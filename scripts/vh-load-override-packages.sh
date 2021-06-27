for fn in "${VH_LOAD_OVERRIDE_SCRIPTS[@]}"; do
    echo "Loading $fn"
    source "$fn"
done
