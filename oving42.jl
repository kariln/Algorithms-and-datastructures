function counting_sort_length(A)
  lengdeA = length(A)
  lengdeB = 1

  #Finner hvor lang hjelpevektoren min må være
  for i in 1:lengdeA
    if lengdeB < length(A[i])
      lengdeB = length(A[i])
    end
  end
  sortert = ["" for i in 1:lengdeA]
  println(sortert)
  vec = zeros(Int,lengdeB+1)

  #Finner ut hvor mange det er av hver
  for i in 1:lengdeA
    vec[length(A[i])+1] = vec[length(A[i])+1] + 1
    #println(vec)
  end
  println(vec)
  for i = 2:lengdeB+1
    vec[i] = vec[i]+vec[i-1]
  end

  for i in lengdeA:-1:1
    sortert[vec[length(A[i])+1]] = A[i]
    vec[length(A[i])+1] = vec[length(A[i])+1]-1
  end
  println(sortert)
  return sortert

end

A = ["bbbb", "aa", "aaaa", "ccc"]
counting_sort_length(A)
