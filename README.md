# Various Program Language Benchmarks
I want to know exactly how different various program languages perform. However, nowadays there're no such openning project on Internet. 

Now this repository support comparison between Scheme and Javascript.

## How to run benchmarks on your own computor
### Prerequest
* [Nix](https://nixos.org/) is a tool that takes a unique approach to package management and system configuration. I use it to make reproducible environment to run benchmark. You may need to install it on you own system.

### Run
```bash
bash run.sh
```

## Benchmark List
All benchmarks are listed in [src directory](./src), I tried my best to make different languages consistently performs similar operations on same work. And now, all benchmarks are imagrated from [here](https://github.com/ecraven/r7rs-benchmarks), and I'll gradually add other benchmarks.


| Benchmark | Description | NOTE |
| --- | --- | --- |
| [ack](./src/ack)| A recursive function with more than 1 parameter,it's seemed to evaluate scheme language's tail optimization. | For many other languages like javascript, tail optimization is usually not facilitated. In order to do the detailed comparison, I have to call ack function as `ack(3,10)`. Which is too small  to perform scheme's advantage. |
| [primes](./src/primes)| A recursive function calculates primes number. | For many other languages like javascript, tail optimization is usually not facilitated. |
| [string](./src/string)| String operation mainly on string concating and spliting. | Different languages usually have their own specific details on string model, which lead merely same operations in different languages cause big performance barrier. |
| [sum](./src/sum)| Sum up integers from 1 to n with recursion. | I don't know why javascript is faster than chez scheme. |
| [sumfp](./src/sumfp)| Sum up integers' float representation from 1.0 to n with recursion. | I don't know why javascript is faster than chez scheme. |
| [fib](./src/fib)| Fibonacci |  |
| [nqueens](./src/nqueens)| N-queen problem.|  |
| [triangl](./src/triangl)| Well, I don't know what it is.|  |
