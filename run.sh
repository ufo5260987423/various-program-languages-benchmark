#!/usr/bin/env bash

rm ./output/*

for test in $(find ./language-environments | grep "flake.nix$")
do
    if [ $test == "quickjs" ]; then continue; fi
    echo $test
    nix develop $test
done;