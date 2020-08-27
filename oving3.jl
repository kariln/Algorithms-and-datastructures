function bisect_left(A, p, r, v)
    i = p
    if p < r
       q = floor(Int, (p+r)/2)  # floor() er en innebygd funksjon som runder ned. ceil() runder opp.
       if v <= A[q]
           i = bisect_left(A, p, q, v)
       else
           i = bisect_left(A, q+1, r, v)
       end
    end
    return i
end

function bisect_right(A, p, r, v)
    i = p
    if p < r
        q = floor(Int, (p+r)/2)  # floor() er en innebygd funksjon som runder ned. ceil() runder opp.
       if v >= A[q]
            i = bisect_right(A, q+1, r, v)

       else
            i = bisect_right(A, p, q, v)
       end
    end
    return i
end

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

function algdat_sort!(A)
	quicksort(A,1,length(A))
end

function find_median(A,lower,upper)
    #A er allerede sortert
    #må finne indeksene i dellisten min
    lower_index = bisect_left(A,1,length(A)+1,lower)#foerste element i delliste
    upper_index = bisect_right(A,1,length(A)+1,upper)#indeksen etter siste element i dellisten
    println("lower i: ", lower_index)
    println("upper i: ", upper_index)
    median_index = ((upper_index - 1)+lower_index)/2
    if ceil(median_index) == floor(median_index)
        median = A[Int(median_index)]
    else
        median = (A[Int(ceil(median_index))]+A[Int(floor(median_index))])/2
    end
    return median
end


A = [1,2,3,4]

median = find_median(algdat_sort!(A),A[1],A[length(A)])

println(median)
