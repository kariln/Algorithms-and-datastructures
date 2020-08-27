function parse_string(string)
    out = []
    pos = 0

    for i in 1:length(string)
        if i == 1
            if string[i] != ' '
                pos = i
                while pos <= length(string) && string[pos] != ' '
                    pos += 1
                end
                ord = string[i:pos-1]
                push!(out,(ord,i))
            end
        elseif string[i] != ' ' && string[i-1] == ' '
            pos = i
            while pos <= length(string) && string[pos] != ' '
                pos += 1
            end
            ord = string[i:pos-1]
            push!(out,(ord,i))
        end
    end
    return out
end

println(parse_string("en ei hei"))
