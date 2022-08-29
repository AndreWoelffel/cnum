f1(x) = cos(x) - sqrt(x)
f2(x) = 5*sin(x^2) - MathConstants.e^(x/10)

error1 = 10^-4
error2 = 10^-5

function bisection(a,b,f, error)
  x = (a+b)/2
  while abs(f(x)) > error
    if f(a)*f(x) > 0
      a = x
    else
      b = x
    end
    x = (a+b)/2
  end
  return x
end

r = bisection(0,1,f1,error1)
println(r)

r = bisection(0,1,f2,error2)
println(r)

#Questão 3.2.8
