var cpstak =function (x, y ,z){
    var tak = function(x, y ,z ,k){
        if (y>=x) {
            return k(z);
        }else {
            return tak(x-1,y,z,
                function(v1){
                    return tak(y-1, z, x, 
                        function(v2){
                            return tak(z-1,x, y, function(v3){return tak(v1,v2,v3,k)}) }) })}
    };
    tak(x, y, z, function(a){return a;});
};
cpstak(20, 20 ,11)