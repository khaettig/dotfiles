local command = vim.api.nvim_create_user_command

command("CodeReview", require("functions.code_review").code_review, { nargs = 1 })

command("OpenIncoming", function()
    vim.cmd("edit ~/Notes/Incoming.md")
end, { nargs = 0 })
command("OpenNotes", function()
    vim.cmd("only")
    vim.cmd("edit ~/Notes/Incoming.md")
    vim.cmd("vsp ~/Notes/System/Obligations.md")
    vim.cmd("sp ~/Notes/System/NextActions.md")
    vim.cmd("wincmd h")
end, { nargs = 0 })
command("OpenDailyReview", function()
    vim.cmd("only")
    vim.cmd("edit ~/Notes/Incoming.md")
    vim.cmd("vsp ~/Notes/System/Obligations.md")
    vim.cmd("sp ~/Notes/System/NextActions.md")
    vim.cmd("wincmd h")
    vim.cmd("sp ~/Notes/System/ReviewDaily.md")
    vim.cmd("wincmd k")
end, { nargs = 0 })
command("OpenVimConfig", function()
    vim.cmd("only")
    vim.cmd("edit ~/.config/nvim/init.lua")
end, { nargs = 0 })
