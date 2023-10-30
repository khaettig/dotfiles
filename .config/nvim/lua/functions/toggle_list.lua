local lists = {
    quickfix = {
        open = function() vim.cmd("copen") end,
        close = function() vim.cmd("cclose") end,
    },
    loclist = {
        open = function()
            local is_empty = next(vim.fn.getloclist(vim.fn.winnr())) == nil
            if is_empty then
                print("Location list is empty")
            else
                vim.cmd("lopen")
            end
        end,
        close = function() vim.cmd("lclose") end,
    }
}

local function list_exists(name)
    for _, window in pairs(vim.fn.getwininfo()) do
        if window[name] == 1 then
            return true
        end
    end
    return false
end

return function(name)
    local list = lists[name]

    if list_exists(name) then
        list.close()
    else
        list.open()
    end
end
