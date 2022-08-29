using .MathConstants:e

f1(x) = e^x -x- 2
# g(x) = e^x - 2

error = 10^-3

function fixedpoint(a,g)
  x=g(a)
  while abs(x-a) > error
    a = x
    x = g(a)
  end
  return x
end
g1(x) = log(x+2)
g(x) = e^x - 2
r1 = fixedpoint(1,g)
r2 = fixedpoint(1,g1)
println(r1)
println(r2)

g(x) = x + (cos(x)-x^2)/(sin(x)+(2*x))
r = fixedpoint(1,g)
println(r)

f(x) = e^(-x^2)-2x
function secant(a,b)
  g(a,b) = (a*f(b)-b*f(a))/(f(b)-f(a))
  x = g(a,b)
  while abs(x-b) > error
    a = b
    b = x
    x = g(a,b)
  end
  return x
end

r = secant(1,2)
println(r)
r = secant(-2,-1)
println(r)







