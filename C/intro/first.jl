function fib(n)
    fibs=[1,1]
    if n>=3
        for i in (3:n)
            push!(fibs,fibs[i-1]+fibs[i-2])
        end
    return fibs[n]
 end
end
println(fib(6))    
