return function()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD")
    local branch = handle:read("*a")
    handle:close()

    branch = branch:gsub("%s+", "")

    local last_part = branch:match(".*%-(.+)") or branch
    local file_path = "/home/kevin/Sync/Notes/Issues/" .. last_part .. ".md"
    -- vim.api.nvim_put({file_path}, "c", true, true)
    vim.cmd("edit " .. vim.fn.fnameescape(file_path))
end
