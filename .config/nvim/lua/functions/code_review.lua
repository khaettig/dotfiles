local M = {}

M.code_review_next = function()
    vim.cmd("silent! cnext")
    vim.cmd("only")
    vim.cmd("silent! Gvdiff " .. vim.g.current_review_branch)
    vim.cmd("wincmd H")
    vim.cmd("wincmd l")
end

M.code_review_previous = function()
    vim.cmd("silent! cprevious")
    vim.cmd("only")
    vim.cmd("silent! Gvdiff " .. vim.g.current_review_branch)
    vim.cmd("wincmd H")
    vim.cmd("wincmd l")
end

M.code_review = function(opts)
    vim.g.current_review_branch = opts.fargs[1]
    local handle = io.popen("git diff --name-only " .. vim.g.current_review_branch)
    local result = ""
    if handle then
        result = handle:read("*a")
        handle:close()
    end
    local files = {}
    for line in result:gmatch("[^\n]+") do
        table.insert(files, {filename=line})
    end
    vim.fn.setqflist(files)
    M.code_review_next()
end

return M
