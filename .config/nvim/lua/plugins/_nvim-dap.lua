local dap = require("dap")
local dapui = require("dapui")

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
                { id = "console", size = 0.5 },
            },
            position = "bottom",
            size = 10
        },
    }
})

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

vim.fn.sign_define('DapBreakpoint', {text='', texthl='DebuggerBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DebuggerBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='DebuggerStopped', linehl='', numhl=''})
