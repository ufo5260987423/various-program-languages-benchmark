#!/usr/bin/env bash

EXECUTABLE=$1
PREFIX=$2
OPTIONS=$3

if [[ $PREFIX == "" ]];
    then echo "PREFIX is not set.";
    exit 1;
fi

if [[ $EXECUTABLE == "" ]];
    then echo "EXECUTABLE is not set.";
    exit 1;
fi

echo $(uname -a) > "$OUTPUT_PATH"
for test in $(find ./src | grep "$PREFIX$")
do
    echo $test
    $(which time) -av -o "$OUTPUT_PATH" $EXECUTABLE $OPTIONS $test
done;
exit