#!/usr/bin/env bash

success=0

for test in $(find ./language-environments | grep "run.sh$")
do
    if [[ "${skip[@]}" =~ $test ]]; then continue; fi
    echo $test
    bash $test
    success=$(($? || $success))
done;

exit $success