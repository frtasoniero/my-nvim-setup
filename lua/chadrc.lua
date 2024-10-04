-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "tokyonight",
    transparency = true,

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
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
    },
}

return M
