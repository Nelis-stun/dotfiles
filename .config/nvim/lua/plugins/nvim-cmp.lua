return {
    "nvim-cmp",
    -- stylua: ignore
    keys = {
        {
            "<tab>",
            function()
                return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true,
            silent = true,
            mode = "i",
        },
        { "<C-k>", function() require("luasnip").jump(1) end,  mode = "s" },
        { "<C-j>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
}
