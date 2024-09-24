# Various Program Language Benchmarks
I want to know exactly how different various program languages perform. However, nowadays there're no such openning project on Internet. 

## How to run benchmarks on your own computor

## Benchmark List
All benchmarks are listed in [src directory](./src), I tried my best to make different languages consistently performs similar operations on same work.


| Benchmark | Description | NOTE |
| --- | --- | --- |
| [ack](./src/ack)| A recursive function with more than 1 parameter,it's seemed to evaluate scheme language's tail optimization. | For many other languages like javascript, tail optimization is usually not facilitated. In order to do the detailed comparison, I have to call ack function as `ack(3,10)`. Which is too small  to perform scheme's advantage. |
| [primes](./src/primes)| A recursive function calculates primes number. | For many other languages like javascript, tail optimization is usually not facilitated. |
| [string](./src/string)| String operation mainly on string concating and spliting. | Different languages usually have their own specific details on string model, which lead merely same operations in different languages cause big performance barrier. |
