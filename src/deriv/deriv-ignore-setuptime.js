var deriv =function(a){
    if (!Array.isArray(a))
        return (a =="x")? 1:0;
    else
        switch(a[0]){
            case "+": return ["+"].concat(a.slice(1).map(function(a){return deriv(a);}));
            case "-": return ["-"].concat(a.slice(1).map(function(a){return deriv(a);}));
            case "*": return ["*", a, ["+", a.slice(1).map(function(a){return ["/",deriv(a),a];})]];
            case "/": return ["-", ["/", deriv(a[1]),a[2]], ["/", a[1],["*",a[2],a[2],deriv(a[2])]]];
            default: throw("No derivation method available");
        }
};
for(var i=0; i< 10000;i++){
    deriv(
        ["+", 
            ["*",
                ["*",3,"x","x"],
                ["+", ["/",0,3], ["/",1,"x"], ["/",1,"x"]]],
            ["*",
                ["*","a","x","x"],
                ["+", ["/",0,"a"], ["/",1,"x"], ["/",1,"x"]]],
            ["*",
                ["*","b","x"],
                ["+", ["/",0,"b"], ["/",1,"x"]]],
            0]);
}