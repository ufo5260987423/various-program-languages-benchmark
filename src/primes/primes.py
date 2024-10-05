def intervalList(m, n):
    if m > n:
        return []
    else:
        return [m] + intervalList(m + 1, n)

def sieve(l):
    def removeMultiples(n, l):
        if len(l) == 0:
            return []
        elif l[0] % n == 0:
            return removeMultiples(n, l[1:])
        else:
            return [l[0]] + removeMultiples(n, l[1:])

    if len(l) == 0:
        return []
    else:
        return [l[0]] + sieve(removeMultiples(l[0], l[1:]))

def primesNotBiggerThan(n):
    return sieve(intervalList(2, n))

primesNotBiggerThan(6000)
