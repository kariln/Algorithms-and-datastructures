mutable struct Node
    id::Int
    neighbours::Array{Node}
    color::Union{String, Nothing}
    distance::Union{Int, Nothing}
    predecessor::Union{Node, Nothing}
end
Node(id) = Node(id, [], nothing, nothing, nothing)

using Pkg
Pkg.add("DataStructures")
using DataStructures: Queue, enqueue!, dequeue!

function bfs!(nodes,start)
    if isgoalnode(start) == true
        return start
    end

    color = ["white","gray","black"]

    #farger alle hvite
    for i=1:length(nodes)
        nodes[i].color = color[1]
        nodes[i].distance = 10000
        nodes[i].predecessor = nothing
    end

    start.color = color[2]
    start.distance = 0

    Q = Queue{Node}()
    enqueue!(Q,start)
    while length(Q) !== 0
        #tar ut siste node i køen
        u = dequeue!(Q)
        for v in u.neighbours
            if v.color == color[1]
                v.color = color[2]
                v.distance = u.distance + 1
                v.predecessor = u

                if isgoalnode(v) == true
                    return v
                end
                enqueue!(Q,v)
            end
        end
        u.color = color[3]
    end

    return nothing

end
