---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "github_dark",
    transparency = true,
}

M.nvdash = {
    load_on_startup = true,
}

M.mason = {
    pkgs = {
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "lua-language-server",
        "clangd",
        "gopls",
        "prisma-language-server",
        "json-lsp",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "bash-language-server",
        "pyright",
        "tailwindcss-language-server",
        "eslint_d",
    },
}

return M
