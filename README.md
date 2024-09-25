# Various Program Language Benchmark
I want to know exactly how different various program languages perform. However, nowadays there're no such openning project on Internet. 

Now this repository support comparison between Scheme and Javascript.

## How to run benchmarks on your own computor
### Prerequest
* [Nix](https://nixos.org/) is a tool that takes a unique approach to package management and system configuration. I use it to make reproducible environment to run benchmark. You may need to install it on you own system.
* Time command. Bash-default `time` command is a shell keyword. This project requires real time command and some linux distribution dosen't install it. On my nixos laptop, I install time command with 
```nix
environment.systemPackages = [
  pkgs.time
];
```

### Run & get result
```bash
bash run.sh
```
All results are in directory [`./output`](./output).

## Benchmark List
All benchmarks are listed in [src directory](./src), I tried my best to make different languages consistently performs similar operations on same work. And now, all benchmarks are imagrated from [here](https://github.com/ecraven/r7rs-benchmarks), and I'll gradually add other benchmarks.

| Benchmark | Description | NOTE | Winner|
| --- | --- | --- |--- |
| [ack](./src/ack)| A recursive function with more than 1 parameter,it's seemed to evaluate scheme language's tail optimization. | For many other languages like javascript, tail optimization is usually not facilitated. In order to do the detailed comparison, I have to call ack function as `ack(3,10)`. Which is too small  to perform scheme's advantage. | [Scheme/ChezScheme](./output/scheme-chezscheme) |
| [primes](./src/primes)| A recursive function calculates primes number. | For many other languages like javascript, tail optimization is usually not facilitated. | [Scheme/ChezScheme](./output/scheme-chezscheme) |
| [string](./src/string)| String operation mainly on string concating and spliting. | Different languages usually have their own specific details on string model, which lead merely same operations in different languages cause big performance barrier. | [Javascript/bun](./output/javascript-bun) |
| [sum](./src/sum)| Sum up integers from 1 to n with recursion. |  | [Javascript/bun](./output/javascript-bun)|
| [sumfp](./src/sumfp)| Sum up integers' float representation from 1.0 to n with recursion. |  | [Javascript/bun](./output/javascript-bun)|
| [sumfp-ignore-setuptime](./src/sumfp)| Do sum up operation many times in order to ignore setup time. | Chez Scheme overheads NodeJS, but clearly doesn't compete Bun. Now, my question becomes: how does Bun do? | [Javascript/bun](./output/javascript-bun)|
| [fib](./src/fib)| Fibonacci | | [Javascript/bun](./output/javascript-bun)|
| [nqueens](./src/nqueens)| N-queen problem.|  |[Scheme/ChezScheme](./output/scheme-chezscheme)|
| [triangl](./src/triangl)| Well, I don't know what it is.| | [Javascript/bun](./output/javascript-bun)|
| [deriv](./src/deriv)| List derivation for symbolic computation. | | [Javascript/bun](./output/javascript-bun)|
| [cpstack](./src/cpstack)| Cps style computation. | | [Javascript/bun](./output/javascript-bun)|

## What I lean from these benchmarsk

1. Chez Scheme seems to perform well with recursion, techniques including tail optimization really work.
2. In my view, thoese benchmarks which cost less than 0.06 second in Chez Scheme, setup time reall concerns something. 