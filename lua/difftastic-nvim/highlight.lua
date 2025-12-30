--- Highlight group definitions.
local M = {}

M.defaults = {
    DifftAdded = { bg = "#2d4a3e" },
    DifftRemoved = { bg = "#4a2d2d" },
    DifftAddedInline = { bg = "#3d6a4e" },
    DifftRemovedInline = { bg = "#6a3d3d" },
    DifftFileAdded = { fg = "#9ece6a" },
    DifftFileDeleted = { fg = "#f7768e" },
    DifftTreeCurrent = { bg = "#3b4261", bold = true },
    DifftDirectory = { fg = "#7aa2f7", bold = true },
    DifftFiller = { fg = "#3b4261" },
}

function M.setup(overrides)
    overrides = overrides or {}
    for name, default in pairs(M.defaults) do
        vim.api.nvim_set_hl(0, name, vim.tbl_extend("force", default, overrides[name] or {}))
    end
end

return M
