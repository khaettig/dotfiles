local notes_folder = "~/WorkNotes/Archive/"


return function()
    vim.cmd.edit(vim.fn.expand(notes_folder) .. os.date("%Y-%m-%d") .. ".md")
end
