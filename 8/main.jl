using LinearAlgebra

function fixedpoint(a,g, erro)
x=g(a)
while norm(x-a) > erro
a=x
x=g(a)
end
return x
end

F(x) = [(-cos(x[1]) + 2*x[1] -x[2]);
        (-x[1] + 2*x[2] - cos(x[2]) -x[3]);
        (-x[2] + x[3] - cos(x[3]))]

J(x) = [(sin(x[1]) + 2) -1 0;
        -1 (2 + sin(x[2])) -1;
        0 -1 (1 + sin(x[3]))]

g(x) = x - (inv(J(x))*F(x))

erro = 10^-8

x = [1; 1; 1]
r = fixedpoint(x, g, erro)
println(r)

x = [-2; -3; -4]
r = fixedpoint(x, g, erro)
println(r)

x = [-0.5; -2; -3]
r = fixedpoint(x, g, erro)
println(r)

x = [0; 0; 0]
r = fixedpoint(x, g, erro)
println(r)