local colors = require("colors")
local neotest = require("neotest").state

vim.g.test_status = ""

local function change_z_color(color)
    local fg = "#FFFFFF"
    if color == "#FFFF00" then fg = "#000000" end

    for _, mode in pairs({"normal", "insert", "visual", "replace", "command"}) do
        vim.api.nvim_set_hl(0, "lualine_z_" .. mode, { bg=color, fg=fg, bold=true })
    end
end

local function get_status(adapter_id)
    local status = neotest.status_counts(adapter_id)
    if status.running > 0 then return " RUNNING ", colors.yellow end
    if status.failed > 0 then return " " .. status.failed .. " FAILED ", colors.blood end
    if status.passed > 0 then return " " .. status.passed .. " PASSED ", colors.emerald end
end

local function handle_adapter(adapter_id)
    local status, color = get_status(adapter_id)
    if vim.g.test_status == status then return end
    vim.g.test_status = status
    change_z_color(color)
end

return function()
    vim.uv.new_timer():start(0, 1000, vim.schedule_wrap(function()
        for _, adapter_id in pairs(neotest.adapter_ids()) do
            handle_adapter(adapter_id)
        end
    end))
end
