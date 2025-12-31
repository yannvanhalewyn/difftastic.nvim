--- Highlight group definitions.
local M = {}

--- Default highlight definitions
--- @type table<string, vim.api.keyset.highlight>
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

--- Setup highlight groups with optional overrides.
--- @param overrides table<string, vim.api.keyset.highlight>|nil User overrides
function M.setup(overrides)
    overrides = overrides or {}
    for name, default in pairs(M.defaults) do
        local hl = vim.tbl_extend("force", default, overrides[name] or {})
        vim.api.nvim_set_hl(0, name, hl)
    end
end

return M
