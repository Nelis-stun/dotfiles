return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts

    opts = {
        auto_install = true,
        ignore_install = { "latex" }, -- List of parsers to ignore installing
        indent = { enable = true },

        highlight = {
            enable = true,
            disable = { "css", "latex", "markdown", "cls", "doxygen" }, -- list of language that will be disabled
        },

        ensure_installed = { "c", "rust", "vim", "vimdoc", "cpp", "query" },

    },
    config = function (_,opts)
        if type(opts.ensure_installed) == "table" then
            vim.list_extend(opts.ensure_installed, { "c", "cpp", "bibtex" })
        end
        require("nvim-treesitter.install").prefer_git = true
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts);
    end,
}




















