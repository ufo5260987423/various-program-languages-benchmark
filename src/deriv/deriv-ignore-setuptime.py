def deriv(a):
    if not isinstance(a, list):
        return 1 if a == "x" else 0
    else:
        op = a[0]
        if op == "+":
            return ["+"] + [deriv(sub) for sub in a[1:]]
        elif op == "-":
            return ["-"] + [deriv(sub) for sub in a[1:]]
        elif op == "*":
            return ["*", a, ["+"] + [[ "/", deriv(sub), sub] for sub in a[1:]]]
        elif op == "/":
            return ["-", 
                    ["/", deriv(a[1]), a[2]], 
                    ["/", a[1], ["*", a[2], a[2], deriv(a[2])]]]
        else:
            raise Exception("No derivation method available")

for i in range(0,10000)
    deriv(
        ["+", 
            ["*", ["*", 3, "x", "x"],
                ["+", ["/", 0, 3], ["/", 1, "x"], ["/", 1, "x"]]],
            ["*", ["*", "a", "x", "x"],
                ["+", ["/", 0, "a"], ["/", 1, "x"], ["/", 1, "x"]]],
            ["*", ["*", "b", "x"],
                ["+", ["/", 0, "b"], ["/", 1, "x"]]],
            0]
    )
