
svg = Snap '#svg'
svg.attr
  width: 400
  height: 400
{paper} = svg

paper.circle(200, 200, 200).attr
  id: "bg"

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
  half.attr class: "half"

do letterC = ->
  start = x: 170, y: 150
  delta = x: 0, y: 24
  step = times delta, 2
  A = add start, delta
  B = sub start, delta
  C = add A, step
  D = sub B, step
  E = add C, step
  halfCircle A, B
  halfCircle B, C
  halfCircle C, D
  halfCircle D, E

do letterR = ->
  start = x: 280, y: 260
  delta = x: 20, y: 0
  step = times delta, 2
  A = add start, delta
  B = sub start, delta
  C = add A, step
  D = sub B, step
  E = add C, step
  halfCircle A, B
  halfCircle B, C
  halfCircle C, D
  # halfCircle D, E