trace = False

def nqueens(n):
    def iota1(n):
        def loop(i, l):
            if i == 0:
                return l
            else:
                return loop(i - 1, [i] + l)
        return loop(n, [])

    def ok(row, dist, placed):
        if len(placed) == 0:
            return True
        else:
            return (placed[0] != (row + dist)) and (placed[0] != (row - dist)) and ok(row, dist + 1, placed[1:])

    def myTry(x, y, z):
        if len(x) == 0:
            if len(y) == 0:
                if trace:
                    pass
                return 1
            else:
                return 0
        else:
            return (myTry(x[1:] + y, [], [x[0]] + z) if ok(x[0], 1, z) else 0) + myTry(x[1:], [x[0]] + y, z)

    return myTry(iota1(n), [], [])

result = nqueens(14)
