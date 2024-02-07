local system = vim.system

local projects_folder = "Projects/"
local project_template = "System/ProjectTemplate.md"

local function handle_command(type, link)
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

local function handle_system_link(link)
    vim.cmd.edit(string.sub(link, 2) .. ".md")
end

local function handle_project_link(link)
    local projects = {}
    for _, file in pairs(vim.fn.globpath(projects_folder, "*.md", 0, 1)) do
        projects[string.match(file, ".*_(.*)%.md")] = file
    end

    if projects[link] then
        vim.cmd.edit(projects[link])
    else
        vim.cmd.edit(projects_folder .. os.date("%Y-%m-%d") .. "_" .. link .. ".md")
        vim.cmd.read(project_template)
        vim.fn.feedkeys("kddo")
    end
end

return function()
    local line = vim.api.nvim_get_current_line()
    local match = string.match(line, "%[(.*)%]")

    if not match then return end

    local type, link = string.match(match, "(%w*):(.*)")
    if type then
        handle_command(type, link)
        return
    end

    if string.sub(match, 1, 1) == "/" then
        handle_system_link(match)
        return
    end

    handle_project_link(match)
end
