local function get_token()
    local f = assert(io.open(vim.fn.expand("~/.todoist", "r")))
    local result = f:read()
    f:close()
    return result
end

return function()
    local line = vim.api.nvim_get_current_line()
    line = line:gsub("<.*>", "")
    line = line:gsub("- ", "")

    vim.system({
        "curl",
        "https://api.todoist.com/rest/v2/tasks",
        "-H",
        "Content-Type: application/json",
        "-H",
        "Authorization: Bearer " .. get_token(),
        "-d",
        vim.json.encode({ content = line }),
    })
end
