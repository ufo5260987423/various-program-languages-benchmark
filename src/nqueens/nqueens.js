var trace = false;
var nqueens = function (n) {
  var iota1 = function (n) {
    var loop = function (i, l) {
      if (i == 0)
        return l;
      else return loop(i - 1, [i].concat(l));
    };
    return loop(n, []);
  };
  var ok = function (row, dist, placed) {
    if (0 == placed.length)
      return true;
    else
      return (placed[0] != (row + dist)) && (placed[0] != (row - dist)) && ok(row, 1 + dist, placed.slice(1));
  };
  var myTry = function (x, y, z) {
    if (x.length == 0)
      if (y.length == 0) {
        if (trace);
        return 1;
      } else
        return 0;
    else return (ok(x[0], 1, z) ? myTry(x.slice(1).concat(y), [], [x[0]].concat(z)) : 0) + myTry(x.slice(1), [x[0]].concat(y), z);
  };
  return myTry(iota1(n), [], []);
};
nqueens(14);