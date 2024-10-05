def cpstak(x, y, z):
    def tak(x, y, z, k):
        if y >= x:
            return k(z)
        return tak(x - 1, y, z, lambda v1 : tak(y - 1, z, x, lambda v2 : tak(z - 1, x, y, lambda v3 : tak(v1, v2, v3, k))))
    tak(x, y, z, lambda v : v)

cpstak(20, 20, 11)
