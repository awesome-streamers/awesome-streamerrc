local Worktree = require("git-worktree")

local git_branch = ""
local function get_git_info(force)
    if force or not git_branch or git_branch == "" then
        git_branch = vim.fn["fugitive#head"]()
        if not git_branch or git_branch == "" then
            git_branch = '(no git)'
        end
        if #git_branch > 20 then
            git_branch = git_branch:sub(1, 16) .. "..."
        end
    end

    return git_branch
end

local function lsp_info()

    local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
    local errors = vim.lsp.diagnostic.get_count(0, "Error")
    local hints = vim.lsp.diagnostic.get_count(0, "Hint")

    return string.format("LSP: H %d W %d E %d", hints, warnings, errors)
end

local function harpoon_status()
    local status = require("harpoon.mark").status()
    if status == "" then
        status = "N"
    end

    return string.format("Harpoon: %s", status)
end

Worktree.on_tree_change(function(op)
    if op == Worktree.Operations.Switch then
        get_git_info(true)
    end
end)

local statusline = "%%-20.20t%%-20.20(|%s%%)%%-20.20(|%s%%)%%-20.20(|%s%%)%%-20.20(|uwuntu%%)"
function StatusLine()
    return string.format(statusline, get_git_info(), lsp_info(), harpoon_status())
end

vim.o.statusline = '%!v:lua.StatusLine()'
