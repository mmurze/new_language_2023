require "tbl" -- table.contains and table.copy
queue = require "queue"

local function bfs(graph, start)
    if not graph[start] then
        return false
    end

    local visited = {}
    local queue = queue:init()

    queue:push({start})
    table.insert(visited, start)

    while queue:count() > 0 do
        local path = queue:pull()
        local node = path[#path]
        for _, exit in pairs(graph[node]) do
            if not table.contains(visited, exit) then
                table.insert(visited, exit)
                if graph[exit] then
                    local new = table.copy(path)
                    table.insert(new, exit)
                    queue:push(new)
                end
            elseif node ~= exit then
                return true
            end
        end
    end

    return false
end

return bfs