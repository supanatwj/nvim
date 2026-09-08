return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        --list of server for mason to install
        ensure_installed = {
            "ts_ls",
            "html",
            "cssls",
            "lua_ls",
            "ts_ls",
            "eslint",
            "jdtls"
        },
     },
    dependencies = {
        { "mason-org/mason.nvim", opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        } 
    },
        "neovim/nvim-lspconfig",
    },
}
