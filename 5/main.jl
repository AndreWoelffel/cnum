using LinearAlgebra

#A = [ 1 1 1 ;
#      4 4 2 ;
#      2 1 -1 ]

A = [ 2 1 -1 ;
      4 4 2 ;
      1 1 1 ]
  
#B = [1 ; 2 ; 0]
B = [0 ; 2 ; 1]

X = A \ B
println(X)

error = 10^-3

function jacobi(A, B, k)
  n = size(B,1)
  X = zeros(n)
  K = zeros(n)
  for l = 1:k
    for i = 1:n
      count = 0
      for j = 1:n
        if i != j
          count += A[i, j]*X[j]
        end
      end
      K[i] = (B[i]-count)/A[i, i]
    end
    #println(norm(X-K))
    if norm(X-K) < error
      break
    end
    X = copy(K)
  end
  return X
end

X = jacobi(A, B, 100)
println(X)





function seidel(A, B, k)
  n = size(B,1)
  X = zeros(n)
  K = zeros(n)
  for l = 1:k
    for i = 1:n
      count = [0.0 0.0]
      for j = 1:i-1
          count[1] += A[i, j]*K[j] 
      end
      for j = i+1:n
        count[2] += A[i, j]*X[j]
      end
      K[i] = (B[i]-count[1]-count[2])/A[i, i]
    end
    if norm(X-K) < error
      break
    end
    X = copy(K)
  end
  return X
end

println("Ex 2")
X = seidel(A, B, 100)
println(X)

println("Ex 3 a")

E = [-1.01 0.5 0 0;
      0.5 -1.01 0.5 0;
      0 0.5 -1.01 0.5;
      0 0 0.5 -0.52]

F = [-63; 0; 0; 0]

X = E \ F
println(X)
X = seidel(E, F, 100)
println(X)

println("Ex 3 b")

G = [-1.02 0.5 0 0;
      0.5 -1.01 0.5 0;
      0 0.5 -1.01 0.5;
      0 0 0.5 -0.51]

H = [-63; 0; 0; 0]

X = G \ H
println(X)
X = seidel(G, H, 100)
println(X)
