using Pkg

dependencies = Pkg.project().dependencies

if !haskey(dependencies,"Calculus")
Pkg.add("Calculus")
end

using Calculus

r = derivative(sin, 0.0)

println("EXEMPLO")
println(r)

f(x) = sin(x) - (x^2)

println("EX 8.1.1")

dp(f,x,h) = (f(x+h)-f(x))/h
dr(f,x,h) = (f(x)-f(x-h))/h
dc(f,x,h) = (f(x+h)-f(x-h))/(2*h)

r = derivative(f, 2.0)
println(r)

r = dp(f, 2.0, 0.1)
println(r)

r = dp(f, 2.0, 0.01)
println(r)

println()
println("EX 8.1.4 para 1")

r = ((2.69-1.83)/0.5)
println(r)

r = ((1.83-1.05)/0.5)
println(r)

r = ((2.69-1.05)/(2*0.5))
println(r)



println()
println("EX 8.1.4 para 4.5")

r = ((8.29-7.06)/0.5)
println(r)

r = ((7.06-6.11)/0.5)
println(r)

r = ((8.29-6.11)/(2*0.5))
println(r)