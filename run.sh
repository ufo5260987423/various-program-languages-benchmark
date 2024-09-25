#!/usr/bin/env bash

rm ./output/*

for test in $(find ./language-environments | grep "flake.nix$")
do
    echo $test
    nix develop $test
done;