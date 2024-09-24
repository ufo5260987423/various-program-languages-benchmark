#!/usr/bin/env bash

success=0

for test in $(find ./language-environments | grep "flake.nix$")
do
    if [[ "${skip[@]}" =~ $test ]]; then continue; fi
    echo $test
    nix develop $test
    success=$(($? || $success))
done;

exit $success