local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F7>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.terminate()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.disconnect()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.clear_breakpoints()<CR>")
vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>")

dapui.setup({
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.6 },
                { id = "breakpoints", size = 0.2 },
                { id = "stacks", size = 0.2 },
            },
            position = "left",
            size = 30
        },
        {
            elements = {
                { id = "repl", size = 0.5 },
                { id = "watches", size = 0.5 },
            },
            position = "bottom",
            size = 10
        },
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Python
require("dap-python").setup("python3")
require('dap-python').test_runner = 'pytest'

-- Javascript
require("jester").setup({
    cmd = "cd frontend && jest -t '$result' -- $file",
    terminal_cmd = "tabnew | terminal",
    dap = {
        type = 'node2',
        console = "integratedTerminal",
        cwd = "${workspaceFolder}/frontend",
    }
})

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {'/opt/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}