<?php

if ($argv[1] === 'patch') {
    if (in_array($argv[2], ['--reverse', '-r'])) {
        $s = file_get_contents($fn = __DIR__ . "/../build-package.sh");
        $s = must_replace('if ! $TERMUX_BUILD_IGNORE_LOCK; then', '( if ! $TERMUX_BUILD_IGNORE_LOCK; then', $s);
        $s = must_replace('termux_step_finish_build', 'termux_step_finish_build ) || true', $s);
        file_put_contents($fn, $s);
        echo "+ Reset $fn\n";
    } else {
        $s = file_get_contents($fn = __DIR__ . "/../build-package.sh");
        $s = must_replace('( if ! $TERMUX_BUILD_IGNORE_LOCK; then', 'if ! $TERMUX_BUILD_IGNORE_LOCK; then', $s);
        $s = must_replace('termux_step_finish_build ) || true', 'termux_step_finish_build', $s);
        file_put_contents($fn, $s);
        echo "+ Patched $fn\n";
    }
}


function must_replace($fr, $to, $s)
{
    $s2 = str_replace($fr, $to, $s);
    if ($s2 == $s) {
        echo "Failed to patch $fr to $to in $s";
        exit(-1);
    }
    return $s2;
}
