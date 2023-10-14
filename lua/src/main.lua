bfs = require "bfs"

local graph = {}
graph[1] = {2,3,4}
graph[2] = {6,5,1}
graph[3] = {1}
graph[4] = {7,8}
graph[5] = {9,10,2}
graph[6] = {2}
graph[7] = {4,11,12}
graph[8] = {4}
graph[9] = {5}
graph[10] = {5}
graph[11] = {7}
graph[12] = {7}

if bfs(graph, 1) then
    print('The graph contains a cycle')
else
    print('The graph doesn\'t contain any cycle')
end
