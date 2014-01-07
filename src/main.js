// Generated by CoffeeScript 1.6.3
(function() {
  var add, config, halfCircle, letterC, letterR, paint, paper, square, sub, svg, times;

  svg = Snap('#svg');

  svg.attr({
    width: 400,
    height: 400,
    xmlns: "http://www.w3.org/2000/svg"
  });

  paper = svg.paper;

  config = {
    width: 20
  };

  square = function(x) {
    return x * x;
  };

  add = function(pa, pb) {
    return {
      x: pa.x + pb.x,
      y: pa.y + pb.y
    };
  };

  sub = function(pa, pb) {
    return {
      x: pa.x - pb.x,
      y: pa.y - pb.y
    };
  };

  times = function(p, s) {
    return {
      x: p.x * s,
      y: p.y * s
    };
  };

  halfCircle = function(s, e) {
    var half, r;
    r = Math.sqrt(square(s.x - e.x) + square(s.y - e.y)) / 2;
    return half = paper.path("M" + s.x + " " + s.y + " A" + r + "," + r + " 0 0,0 " + e.x + " " + e.y);
  };

  letterC = function() {
    var A, B, C, D, E, delta, g, start, step;
    start = {
      x: 180,
      y: 140
    };
    delta = {
      x: 0,
      y: 26
    };
    step = times(delta, 2);
    A = add(start, delta);
    B = sub(start, delta);
    C = add(A, step);
    D = sub(B, step);
    E = add(C, step);
    g = paper.g();
    g.add(halfCircle(A, B));
    g.add(halfCircle(B, C));
    g.add(halfCircle(C, D));
    g.add(halfCircle(D, E));
    g.attr({
      stroke: "white",
      strokeWidth: config.width,
      fill: "none",
      strokeLinecap: "round"
    });
    return g;
  };

  letterR = function() {
    var A, B, C, D, E, delta, g, start, step;
    start = {
      x: 270,
      y: 280
    };
    delta = {
      x: 20,
      y: 0
    };
    step = times(delta, 2);
    A = add(start, delta);
    B = sub(start, delta);
    C = add(A, step);
    D = sub(B, step);
    E = add(C, step);
    g = paper.g();
    g.add(halfCircle(A, B));
    g.add(halfCircle(B, C));
    g.add(halfCircle(C, D));
    g.attr({
      stroke: "white",
      strokeWidth: config.width,
      fill: "none",
      strokeLinecap: "round"
    });
    return g;
  };

  (paint = function() {
    var g;
    paper.circle(200, 200, 200).attr({
      fill: '#aaf'
    });
    g = paper.g();
    g.add(letterC());
    return g.add(letterR());
  })();

}).call(this);

/*
//@ sourceMappingURL=main.map
*/
