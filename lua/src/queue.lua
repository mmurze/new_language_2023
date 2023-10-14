local queue = {}

function queue:init()
    local q = {}

    q.stack = {}

    function q:push(e)
        table.insert(self.stack, e)
    end

    function q:pull()
        local e = self.stack[1]

        table.remove(self.stack, 1)

        return e
    end

    function q:count()
        return #self.stack
    end

    return q
end

return queue