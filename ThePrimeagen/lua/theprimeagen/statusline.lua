local Worktree = require("git-worktree")

local write_count = 0
local git_branch = ""
local statuls_line = ""

local function get_git_info(force)
    if force or not git_branch or git_branch == "" then
        git_branch = vim.fn["fugitive#head"]()
        if not git_branch or git_branch == "" then
            git_branch = '(no git)'
        end
        if #git_branch > 14 then
            git_branch = git_branch:sub(1, 11) .. "..."
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

    return string.format("H:%s", status)
end

Worktree.on_tree_change(function(op)
    if op == Worktree.Operations.Switch then
        get_git_info(true)
    end
end)

local statusline = "%%-4.4(%d%%)|%%-18.18t%%-14.14(|%s%%)%%-20.20(|%s%%)%%-6.6(|%s%%)%%-30.70(|%s%%)"
function StatusLine()
    return string.format(statusline, write_count, get_git_info(), lsp_info(), harpoon_status(), status_line)
end

vim.o.statusline = '%!v:lua.StatusLine()'

local M = {}

M.on_write = function()
    write_count = write_count + 1
end

M.set_write = function(count)
    write_count = count
end

M.set_status = function(line)
    status_line = line
end

vim.api.nvim_exec([[
augroup THEPRIMEAGEN_STATUSLINE
    autocmd!
    autocmd BufWritePre * :lua require("theprimeagen.statusline").on_write()
augroup END
 ]], false)

return M
