return function(hex)
    local highlights = vim.api.nvim_command_output("highlight")
    for _, line in pairs(vim.split(highlights, "\n")) do
        if string.match(line, hex) then print(line) end
    end
end
