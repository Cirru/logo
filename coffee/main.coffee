
svg = Snap '#svg'

svg.attr
  width: 400
  height: 400
  xmlns: "http://www.w3.org/2000/svg"
  
{paper} = svg

config =
  width: 20

square = (x) ->
  x * x

add = (pa, pb) ->
  x: pa.x + pb.x
  y: pa.y + pb.y

sub = (pa, pb) ->
  x: pa.x - pb.x
  y: pa.y - pb.y

times = (p, s) ->
  x: p.x * s
  y: p.y * s

halfCircle = (s, e) ->
  # http://blog.benjaminranck.com/2011/07/28/arc-paths-in-svg
  r = Math.sqrt(square(s.x - e.x) + square(s.y - e.y)) / 2
  half = paper.path "M#{s.x} #{s.y} A#{r},#{r} 0 0,0 #{e.x} #{e.y}"

letterC = ->
  start = x: 180, y: 140
  delta = x: 0, y: 26
  step = times delta, 2
  A = add start, delta
  B = sub start, delta
  C = add A, step
  D = sub B, step
  E = add C, step
  g = paper.g()
  g.add (halfCircle A, B)
  g.add (halfCircle B, C)
  g.add (halfCircle C, D)
  g.add (halfCircle D, E)
  g.attr stroke: "white", strokeWidth: config.width
  , fill: "none", strokeLinecap: "round"
  g

letterR = ->
  start = x: 270, y: 280
  delta = x: 20, y: 0
  step = times delta, 2
  A = add start, delta
  B = sub start, delta
  C = add A, step
  D = sub B, step
  E = add C, step
  g = paper.g()
  g.add (halfCircle A, B)
  g.add (halfCircle B, C)
  g.add (halfCircle C, D)
  # g.add (halfCircle D, E)
  g.attr stroke: "white", strokeWidth: config.width
  , fill: "none", strokeLinecap: "round"
  g

do paint = ->
  # http://jsfiddle.net/TWBNE/
  # Maybe in the future: http://stackoverflow.com/a/14871278/883571
  window.shadow = svg.filter Snap.filter.shadow(4, 4, 6, '#88d')

  paper.circle(200, 200, 190).attr fill: '#aaf', filter: shadow

  g = paper.g()
  g.add letterC().attr filter: shadow
  g.add letterR().attr filter: shadow

  # g.attr transform: "rotate(-30, 200, 200)"