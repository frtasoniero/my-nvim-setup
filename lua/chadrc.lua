---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "github_dark",
}

M.mason = {
	pkgs = {
		"eslint-lsp",
		"typescript-language-server",
		"prisma-language-server",
		"prettier",
	},
}

return M
