# Various Program Language Benchmarks
I want to know exactly how different various program languages perform. However, nowadays there're no such openning project on Internet. 

## How to run benchmarks on your own computor

## Benchmark List
All benchmarks are listed in [src directory](./src),


| Benchmark | Description | NOTE |
| --- | --- | --- |
| [ack](./src/ack)| A recursive function with more than 1 parameter,it's usually used to evaluate scheme language's tail optimization. | For many other languages like javascript, tail optimization is usually not facilitated. In order to do the detailed comparison, I have to call ack function as `ack(3,10)`. Which is too small  to perform scheme's advantage. |