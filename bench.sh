#!/usr/bin/env bash

help="$0 [impl...] [options]

options:
  --list list all available implementations
"

if [[ $1 == "" ]]
  then echo "$help"
  exit
fi

if [[ $1 == "--list" ]]
  then echo "Available implementations:"
  for impl in "$(find "./language-environments" | grep "flake.nix$")"
  do
    impl="${impl//"./language-environments/"/""}"
    impl="${impl//"/flake.nix"/""}"
    echo "$impl"
  done
  exit
fi

if [[ $1 == "all" ]]
  then echo "Testing all implementations"
  for impl in "$(find "./language-environments" | grep "flake.nix$")"
  do
    impl="${impl//"./language-environments/"/""}"
    impl="${impl//"/flake.nix"/""}"
    bash $0 $impl
  done
  exit
fi

function run_bench {
  if [[ -f "./language-environments/$1/flake.nix" ]];
    then echo "Testing implementation: $1"
    export OUTPUT_PATH="./output/once-time/${1//\//-}"
    if [[ -d "./output/once-time" ]]
      then echo ""
    else mkdir "./output/once-time";
    fi
    nix develop "./language-environments/$1/flake.nix"
  else
    echo "Implementation not found: $1"
  fi
}

for arg in "$@"; do
  if [[ $arg == "all" ]]
    then continue;
  fi
  if [[ $arg == -* ]]
    then continue
  fi
  run_bench $arg
done
