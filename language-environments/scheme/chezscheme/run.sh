cd $(dirname $0) 
nix develop 

for test in $(find ../src | grep "scm$")
do
    if [[ "${skip[@]}" =~ $test ]]; then continue; fi
    echo $test
    time scheme --optimize-level 3 --script $test
    success=$(($? || $success))
done;


cd ../../../