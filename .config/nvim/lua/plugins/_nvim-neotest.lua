require("neotest").setup({
    adapters = {
        require("neotest-python"),
        require("neotest-jest")({
            jestCommand = "jest",
            jestConfigFile = "jest.config.js",
            env = { CI = true },
            cwd = "/home/kevin/Git/spotl.media/frontend",
        }),
    },
    summary = {
        open = "botright vsplit | vertical resize 30"
    },
})
