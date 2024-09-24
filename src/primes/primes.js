var intervalList=function(m, n){
    if (m > n)
        return [];
    else 
        return [m].concat(intervalList(m+1,n));
};
var sieve =function(l){
    var removeMultiples=function(n, l){
        if (l.length==0)
            return [];
        else if (0==l[0]%n)
            return removeMultiples(n, l.slice(1))
        else return [l[0]].concat(removeMultiples(n,l.slice(1))); 
    };
    if(l.length==0)
        return [];
    else return [l[0]].concat(sieve(removeMultiples(l[0],l.slice(1))));
};

var primesNotBiggerThan=function(n){
    return sieve(intervalList(2, n))
};
primesNotBiggerThan(6000);