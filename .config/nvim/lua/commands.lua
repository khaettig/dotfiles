local command = vim.api.nvim_create_user_command

command("CodeReview", require("functions.code_review").code_review, { nargs = 1 })

command("OpenNotes", function()
    vim.cmd("only")
    vim.cmd("edit ~/Notes/Incoming.md")
    vim.cmd("vsp ~/Notes/System/ProjectList.md")
    vim.cmd("sp ~/Notes/System/NextActions.md")
    vim.cmd("wincmd h")
end, { nargs = 0 })
command("OpenMorningReview", function()
    vim.cmd("only")
    vim.cmd("edit ~/Notes/Incoming.md")
    vim.cmd("vsp ~/Notes/System/ProjectList.md")
    vim.cmd("sp ~/Notes/System/NextActions.md")
    vim.cmd("wincmd h")
    vim.cmd("sp ~/Notes/System/ReviewMorning.md")
    vim.cmd("wincmd k")
end, { nargs = 0 })
command("OpenDailyReview", function()
    vim.cmd("only")
    vim.cmd("edit ~/Notes/Incoming.md")
    vim.cmd("vsp ~/Notes/System/ProjectList.md")
    vim.cmd("sp ~/Notes/System/NextActions.md")
    vim.cmd("wincmd h")
    vim.cmd("sp ~/Notes/System/ReviewDaily.md")
    vim.cmd("wincmd k")
end, { nargs = 0 })
command("OpenWorkNotes", function()
    vim.cmd("only")
    vim.cmd("edit ~/Notes/Incoming.md")
    vim.cmd("vsp ~/Notes/System/WorkProjectList.md")
    vim.cmd("sp ~/Notes/System/WorkNextActions.md")
    vim.cmd("wincmd h")
    vim.cmd("sp ~/Notes/System/WorkAgendas.md")
    vim.cmd("wincmd k")
end, { nargs = 0 })
command("OpenWorkMeeting", function()
    vim.cmd("only")
    vim.cmd("edit ~/Notes/Incoming.md")
    vim.cmd("sp ~/Notes/System/WorkAgendas.md")
    vim.cmd("wincmd k")
end, { nargs = 0 })
command("OpenBrain", function()
    vim.cmd("only")
    vim.cmd("edit ~/Notes/Brain/main.md")
end, { nargs = 0 })
command("OpenVimConfig", function()
    vim.cmd("only")
    vim.cmd("edit ~/.config/nvim/init.lua")
end, { nargs = 0 })
