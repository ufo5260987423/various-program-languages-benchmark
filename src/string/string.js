
var s = "abcdef";

var grow = function (){
    s= "123" + s + "456"+s + "789";
    s= s.substring( Math.floor(s.length/2),s.length) + s.substring(0, Math.ceil(s.length/2));
    return s;
}

var trial =function (n){
    var i=0;
    do{
        i++;
        grow();
    }while (s.length<=n);
    return s.length;
}

var myTry= function(n){
    var i=0;
    do{
        s="abcdef";
        trial(n);
        i++;
    }while (10 >=i);
    return s.length;
}

myTry(5000000)