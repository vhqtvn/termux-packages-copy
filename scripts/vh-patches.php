<?php

if (@$argv[1] === 'patch') {
    if (!in_array(@$argv[2], ['--reverse', '-r'])) {
    } else {
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
