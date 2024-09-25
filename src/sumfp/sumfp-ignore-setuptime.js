var run =function(n){
    var loop =function (i, sum){
        if (i<0.0)
            return sum;
        return loop(i-1, i+ sum);
    };
    return loop(n, 0.0);
}

for(var i=0; i< 10000;i++){
    run(8000);
}