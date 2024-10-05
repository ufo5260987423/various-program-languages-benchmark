import sys

sys.setrecursionlimit(1000000)

def sum(n):
    def sum_helper(n, acc):
        if n < 0:
            return acc
        else:
            return sum_helper(n-1, acc+n)
    return sum_helper(n, 0.)

for i in range(0,10000)
    sum(8000)