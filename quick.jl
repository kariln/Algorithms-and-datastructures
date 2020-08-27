function partition(A,first,last)
x = A[last]
i = first -1
for j in first:last-1
    if A[j]<=x
        i = i+1
        tmp = A[i]
        A[i] = A[j]
        A[j] = tmp
    end
end

tmp = A[i+1]
A[i+1] = A[last]
A[last] = tmp
var = i+1
return var
end

function quicksort(A,p,r)
    if p<r
        q = partition(A,p,r)
        quicksort(A,p,q-1)
        quicksort(A,q+1,r)
    end
    println(A)
    return A
end

A = [4,6,4,9,3,6,5,2]

quicksort(A,1,length(A))
