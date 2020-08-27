mutable struct Node
    id::Int
    neighbours::Array{Node}
    color::Union{String, Nothing}
    distance::Union{Int, Nothing}
    predecessor::Union{Node, Nothing}
end
Node(id) = Node(id, [], nothing, nothing, nothing)

function makenodelist(adjacencylist)

    nodelist = []
    for i= 1:length(adjacencylist)
        node = Node(i)
        push!(nodelist,node)
    end
    for i = 1:length(adjacencylist)
        node = nodelist[i]
        for j = 1:length(adjacencylist[i])
            push!(node.neighbours,nodelist[adjacencylist[i][j]])
        end
    end

    return nodelist
end

var = makenodelist([[2,3],[3],[4],[]])
println(var)
