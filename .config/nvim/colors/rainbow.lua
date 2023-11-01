vim.g.colors_name="calm"


local function to_hex(number)
    return string.format("%06x", number)
end

counter = counter or 0
local function get_color()
    counter = (counter + 999999) % (2^24 -1)
    return "#" .. to_hex(counter)
end

for name, _ in pairs(vim.api.nvim_get_hl(0, {})) do
    vim.api.nvim_set_hl(0, name, { fg=get_color(), bg=get_color(), force=true })
end
