require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"locale"}
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('harpoon')
