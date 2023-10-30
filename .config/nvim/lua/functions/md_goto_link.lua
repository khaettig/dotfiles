local system = vim.system

return function()
    local line = vim.api.nvim_get_current_line()
    local match = string.match(line, "%[(.*)%]")

    if not match then return end

    for type, link in string.gmatch(match, "(%w*):(.*)") do
        if type == "file" then
            system({ "xdg-open", vim.fn.expand(link) })
            return
        elseif type == "cmd" then
            system({ link })
            return
        elseif type == "url" then
            system({ "google-chrome", "--new-window", link })
            return
        elseif type == "ff" then
            system({ "firefox", "--new-window", link })
            return
        elseif type == "yt" then
            system({ "firefox", "--new-window", "youtube.com/watch?v=" .. link })
            return
        end
    end

    if string.sub(match, 1, 1) == "/" then
        vim.cmd.edit(string.sub(match, 2) .. ".md")
        return
    end

    local projects = {}
    for _, file in pairs(vim.fn.globpath("Projects", "*.md", 0, 1)) do
        projects[string.match(file, ".*_(.*)%.md")] = file
    end

    if projects[match] then
        vim.cmd.edit("Projects/" .. projects[match])
    else
        vim.cmd.edit("Projects/" .. os.date("%Y-%m-%d") .. "_" .. match .. ".md")
        vim.cmd.read("System/ProjectTemplate.md")
        vim.fn.feedkeys("kddo")
    end
end
