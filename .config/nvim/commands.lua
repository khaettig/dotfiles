vim.api.nvim_create_user_command("Gamend", ":G commit --amend --no-edit", {})
vim.api.nvim_create_user_command("Gamendpush", ":G commit --amend --no-edit | G push --force-with-lease", {})

local function code_review_next()
    vim.cmd("silent! cnext")
    vim.cmd("only")
    vim.cmd("Gvdiff " .. vim.g.current_review_branch)
    vim.cmd("wincmd H")
    vim.cmd("wincmd l")
end

local function code_review_previous()
    vim.cmd("silent! cprevious")
    vim.cmd("only")
    vim.cmd("Gvdiff " .. vim.g.current_review_branch)
    vim.cmd("wincmd H")
    vim.cmd("wincmd l")
end

local function code_review(opts)
    vim.g.current_review_branch = opts.fargs[1]
    local handle = io.popen("git diff --name-only " .. vim.g.current_review_branch)
    local result = handle:read("*a")
    handle:close()
    local files = {}
    for line in result:gmatch("[^\n]+") do
        table.insert(files, {filename=line})
    end
    vim.fn.setqflist(files)
    code_review_next()
end

vim.api.nvim_create_user_command("CodeReview", code_review, { nargs = 1 })
vim.api.nvim_create_user_command("CodeReviewNext", code_review_next, {})
vim.api.nvim_create_user_command("CodeReviewPrevious", code_review_previous, {})
