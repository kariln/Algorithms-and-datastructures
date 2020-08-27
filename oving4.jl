function counting_sort_letters(A,position)
    lengde = length(A)
    a = Int('a')-1
    z = Int('z')-a
    vec = zeros(Int,z)
    #teller hvor mange elementer det finnes av hver
    for i in 1:lengde
        var = Int(A[i][position])
        vec[var-a] += 1
    end
    #println(vec)
    sortert = ["" for i in 1:lengde]
    for k in 2:length(vec)
        vec[k] = vec[k]+vec[k-1]
    end
    for j in lengde:-1:1
        #println(typeof(A[j][position]))
        sortert[vec[Int(A[j][position])-a]] = A[j]
        vec[Int(A[j][position])-a] = vec[Int(A[j][position])-a]-1
    end
    println(sortert)
end
#s. 195
A = ["ccc","cba","ca","ab","abe"]
a = ["b","a","c","d"]
position = 2
counting_sort_letters(A,1)
counting_sort_letters(a,1)
