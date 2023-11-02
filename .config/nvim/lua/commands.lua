local command = vim.api.nvim_create_user_command

command("CodeReview", require("functions.code_review").code_review, { nargs = 1 })
