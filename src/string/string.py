s = "abcdef"

def grow():
    global s
    s = "123" + s + "456" + s + "789"
    half_length = len(s) // 2
    s = s[half_length:] + s[:half_length]
    return s

def trial(n):
    global s
    i = 0
    while len(s) <= n:
        i += 1
        grow()
    return len(s)

def myTry(n):
    global s
    i = 0
    while i < 10:
        s = "abcdef"
        trial(n)
        i += 1
    return len(s)

myTry(5000000)
