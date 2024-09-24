var ack = function (m, n){
    if (m == 0)
        return 1 + n;
    else if (n == 0)
        return ack(m-1, 1);
    else return ack(m-1, ack(m , n-1));
}

ack(3,13);