local options = {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "lua",
        "luadoc",
        "markdown",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "html",
        "css",
        "javascript",
        "typescript",
        "prisma",
        "sql",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    autotag = {
        enable = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
