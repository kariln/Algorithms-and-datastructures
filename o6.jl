function cumulative(weights)
    rows,cols = size(weights)
    path_weights = ones(Int,rows,cols)
    for i in 1:rows
        for j in 1:cols
            #setter først inn verdiene for randbetingelsene
            if i == 1
                path_weights[i,j] = weights[i,j]
            elseif j == 1
                path_weights[i,j] = weights[i,j] + min(path_weights[i-1,j],path_weights[i-1,j+1])
            elseif j == cols
                path_weights[i,j] = weights[i,j] + min(path_weights[i-1,j-1],path_weights[i-1,j])
            else
                path_weights[i,j] = weights[i,j] + min(path_weights[i-1,j-1],path_weights[i-1,j],path_weights[i-1,j+1])

            end
        end
    end




    #println(weights)
    #println(path_weights)
    return path_weights
end

function back_track(path_weights)
    rows,cols = size(path_weights)

    tuppel = []
    minst = 0
    pos = 1

    for i in rows:-1:1
        if rows == i
            for j in 1:cols
                if j == 1
                    minst = path_weights[i,j]
                elseif path_weights[i,j] < minst
                    minst = path_weights[i,j]
                    pos = j
                end
            end
            push!(tuppel,(i,pos))
        else
            if pos == 1
                minst = min(path_weights[i,pos],path_weights[i,pos+1])
                if minst == path_weights[i,pos+1]
                    pos += 1
                end
                push!(tuppel,(i,pos))
            elseif pos == cols
                minst = min(path_weights[i,pos],path_weights[i,pos-1])
                if minst == path_weights[i,pos-1]
                    pos = pos - 1
                end
                push!(tuppel,(i,pos))
            else
                #println(path_weights[i,pos],path_weights[i,pos-1],path_weights[i,pos+1])
                minst = min(path_weights[i,pos],path_weights[i,pos-1],path_weights[i,pos+1])
                if minst == path_weights[i,pos-1]
                    pos = pos - 1
                elseif minst == path_weights[i,pos+1]
                    pos += 1
                end
                push!(tuppel,(i,pos))
            end

        end
    end


        return tuppel
    end



weights = [3 6 8 6 3;7 6 5 7 3;4 10 4 1 6; 4 10 4 1 6; 10 4 3 1 2;6 1 7 3 9]
println(cumulative(weights))
println(back_track(cumulative(weights)))
