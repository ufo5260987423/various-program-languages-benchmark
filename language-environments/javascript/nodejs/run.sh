cd $(dirname $0) 
nix develop 

for test in $(find ../src | grep "js$")
do
    if [[ "${skip[@]}" =~ $test ]]; then continue; fi
    echo $test
    time node $test
    success=$(($? || $success))
done;

cd ../../../