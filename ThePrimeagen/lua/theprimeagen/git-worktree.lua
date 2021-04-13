local Worktree = require("git-worktree")

local function is_nrdp()
    return not not (string.find(vim.loop.cwd(), vim.env.NRDP, 1, true))
end

    --[[
Worktree.on_tree_change(function(op, path, upstream)
    print("on_tree_change_nothing!")
    if op == "switch" then
        if is_nrdp() then
            -- configure
            -- require("harpoon.term").sendCommand(1, 1)
        end
    end
    print("on_tree_change_nothing!")
end)
    --]]

