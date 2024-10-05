import sys

sys.setrecursionlimit(1000000)

board = [1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
sequence = [0] * 14
a = [1, 2, 4, 3, 5, 6, 1, 3, 6, 2, 5, 4, 11, 12, 13, 7, 8, 4, 4, 7, 11, 8, 12, 13, 6, 10, 15, 9, 14, 13, 13, 14, 15, 9, 10, 6, 6]
b = [2, 4, 7, 5, 8, 9, 3, 6, 10, 5, 9, 8, 12, 13, 14, 8, 9, 5, 2, 4, 7, 5, 8, 9, 3, 6, 10, 5, 9, 8, 12, 13, 14, 8, 9, 5, 5]
c = [4, 7, 11, 8, 12, 13, 6, 10, 15, 9, 14, 13, 13, 14, 15, 9, 10, 6, 1, 2, 4, 3, 5, 6, 1, 3, 6, 2, 5, 4, 11, 12, 13, 7, 8, 4, 4]

answer = []

def attempt(i, depth):
    global answer
    if depth == 14:
        answer = sequence[1:] + answer
        return True
    elif board[a[i]] == 1 and board[b[i]] == 1 and board[c[i]] == 0:
        board[a[i]] = 0
        board[b[i]] = 0
        board[c[i]] = 1
        j = 0
        while j == 36 or attempt(j, depth):
            depth += 1
            j += 1
        board[a[i]] = 1
        board[b[i]] = 1
        board[c[i]] = 0
        return False
    else:
        return False

def test(i, depth):
    global answer
    answer = []
    attempt(i, depth)
    return answer[0] if answer else None

test(22, 2)
