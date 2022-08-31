using .MathConstants:e
println("Ex 1")
f1(x) = e^x -x- 2
# g(x) = e^x - 2

error = 10^-3

function fixedpoint(a, g, error)
  x=g(a)
  while abs(x-a) > error
    a = x
    x = g(a)
  end
  return x
end
g1(x) = log(x+2)
g(x) = e^x - 2
r1 = fixedpoint(1, g, error)
r2 = fixedpoint(1, g1, error)
println(r1)
println(r2)

g(x) = x + (cos(x)-x^2)/(sin(x)+(2*x))
r = fixedpoint(1, g, error)
println(r)
println("\nEx 2")
f(x) = e^(-x^2)-2x
function secant(a,b,f,error)
  g(a,b) = (a*f(b)-b*f(a))/(f(b)-f(a))
  x = g(a,b)
  while abs(x-b) > error
    a = b
    b = x
    x = g(a,b)
  end
  return x
end

r = secant(1,2,f,error)
println(r)
r = secant(-2,-1,f,error)
println(r)

println("\nEx 3.6.4")
#Exercício 3.6.4
Ir = 10^-12
T = 300
k = 1.380649*(10^-23)
q = 1.60217663*(10^-19)
I(x) = Ir*(e^((x*q)/(k*T))-1)
dI(x) = ((Ir*q)/(k*T)*e^((x*q)/k*T))
g(x,V,R) = R*I(x) + x - V
dg(x,R) = R*dI(x) + 1
d(x,R,f) = x - (f(x)/dg(x,r))
error = 10^-3

# Para V = 30 e R = 1
f(x) = g(x, 30, 1)
h(x) = d(x, 1, f)
r = fixedpoint(0.8, h, error)
println(r)
r = secant(0.8, 0.9, f, error)
println(r)

# Para V = 3 e R = 1
f(x) = g(x, 3, 1)
h(x) = d(x, 1, f)
r = fixedpoint(0.7, h, error)
println(r)
r = secant(0.7, 0.8, f, error)
println(r)

# Para V = 3 e R = 10
f(x) = g(x, 3, 10)
h(x) = d(x, 10, f)
r = fixedpoint(0.6, h, error)
println(r)
r = secant(0.6, 0.7, f, error)
println(r)

# Para V = 0.3 e R = 1
f(x) = g(x, 0.3, 1)
h(x) = d(x, 1, f)
r = fixedpoint(0.29, h, error)
println(r)
r = secant(0.29, 0.31, f, error)
println(r)

# Para V = -0.3 e R = 1
f(x) = g(x, -0.3, 1)
h(x) = d(x, 1, f)
r = fixedpoint(-0.29, h, error)
println(r)
r = secant(-0.29, -0.31, f, error)
println(r)

# Para V = -30 e R = 1
f(x) = g(x, -30, 1)
h(x) = d(x, 1, f)
r = fixedpoint(-29.9, h, error)
println(r)
r = secant(-29.9, -30.1, f, error)
println(r)

# Para V = -30 e R = 10
f(x) = g(x, -30, 10)
h(x) = d(x, 10, f)
r = fixedpoint(-29.9, h, error)
println(r)
r = secant(-29.9, -30.1, f, error)
println(r)

