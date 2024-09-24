#!/usr/bin/env bash
source .akku/bin/activate

skip=(
)

success=0

for test in $(find ./language-environments -name | grep "run.sh$")
do
    if [[ "${skip[@]}" =~ $test ]]; then continue; fi
    bash run.sh
    success=$(($? || $success))
done;

exit $success