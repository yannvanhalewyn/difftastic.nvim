--- Buffer-local keymaps for diff navigation.
local M = {}

function M.setup(state)
    local difft = require("difftastic-nvim")
    local keys = difft.config.keymaps

    for _, buf in ipairs({ state.left_buf, state.right_buf }) do
        if buf and vim.api.nvim_buf_is_valid(buf) then
            vim.keymap.set("n", keys.next_file, difft.next_file, { buffer = buf })
            vim.keymap.set("n", keys.prev_file, difft.prev_file, { buffer = buf })
            vim.keymap.set("n", keys.next_hunk, difft.next_hunk, { buffer = buf })
            vim.keymap.set("n", keys.prev_hunk, difft.prev_hunk, { buffer = buf })
            vim.keymap.set("n", keys.close, difft.close, { buffer = buf })
            vim.keymap.set("n", keys.focus_tree, function()
                if vim.api.nvim_win_is_valid(state.tree_win) then
                    vim.api.nvim_set_current_win(state.tree_win)
                end
            end, { buffer = buf })
        end
    end

    if state.tree_buf and vim.api.nvim_buf_is_valid(state.tree_buf) then
        vim.keymap.set("n", keys.focus_diff, function()
            if vim.api.nvim_win_is_valid(state.left_win) then
                vim.api.nvim_set_current_win(state.left_win)
            end
        end, { buffer = state.tree_buf })
        vim.keymap.set("n", keys.next_file, difft.next_file, { buffer = state.tree_buf })
        vim.keymap.set("n", keys.prev_file, difft.prev_file, { buffer = state.tree_buf })
    end
end

return M
