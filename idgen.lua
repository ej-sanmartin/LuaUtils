-- Random ID generations for databases. Assumes randomness is desired.

local M = {}

-- Generate UUID format string.
function M.uuid()
    local random = math.random
    local template = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    return string.gsub(template, 'x', function (c)
        return string.format('%x', random(0, 0xf))
    end)
end

return setmetatable({}, {
    __index = M,
    __newindex = function(_, key, _)
            error("Cannot modify read-only module: idgen " .. key, 2)
        end
    __metatable = false
})
