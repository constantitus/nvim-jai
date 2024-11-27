return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {},
        config = function ()
            local lsp = require("lsp-zero")
            local lspconfig = require("lspconfig")
            lsp.extend_lspconfig()

            local configs = require("lspconfig.configs")
            if not configs.jails then
                configs.jails = {
                    default_config = {
                        cmd = { GetConfigPath() .. "/external/jails/bin/jails" },
                        root_dir = lspconfig.util.root_pattern("jails.json", "build.jai", "main.jai"),
                        filetypes = { "jai" },
                        name = "Jails",
                    },
                }
            end
            lspconfig.jails.setup({})
            vim.filetype.add({ extension = { jai = "jai", } })

        end,
    },
}
