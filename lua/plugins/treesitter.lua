return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
    config = function()
        require('nvim-treesitter.configs').setup {
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<c-space>',
                    node_incremental = '<c-space>',
                    scope_incremental = '<c-s>',
                    node_decremental = '<c-backspace>',
                },
            },
        }

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.jai = {
            install_info = {
                url = GetConfigPath() .. "/external/tree-sitter-jai/",
                files = { "src/parser.c", "src/scanner.c" },
            },
            filetype = "jai",
            filetype_to_parsername = "jai",
            indent = {
                enable = true
            }
        }
    end,

}
