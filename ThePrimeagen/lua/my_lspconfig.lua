local vim = vim

--[[
local file = io.open(os.getenv("HOME") .. "lsp.dev", "a")

local function join(arr, sep)
    sep = sep or " "
    if arr == nil then
        return ""
    end

    local str = ""
    for idx = 1, #arr do
        if type(arr[idx]) == "string" then
            str = str .. sep .. arr[idx]
        end
    end

    return str
end

local log = true
local function printr(...)
    if log and file then
        file:write("\n")
        file:write(join({...}))
        file:flush()
    elseif not file then
        print("Look there is no file you tird", join({...}))
    end
end
--]]

local count = 0
local last_line = -1

local function virtual_text_override(separator, severity, line, bufnr)
    count = count + 1

    --[[
    local len = #vim.api.nvim_buf_get_lines(bufnr, line - 1, line, false)[1]
    local remaining = 0
    if min_separator_start > len then
        remaining = min_separator_start - len
    end

    table.insert(virt_texts, {
            (" "):rep(remaining)  .. "■",
        severity_highlights[line_diags[i].severity]})

    table.insert(virt_texts, {
      (" "):rep(remaining) .. text_separator, severity_highlights[line_diags[i].severity]
    })
    --]]
    if last_line == line then
        return separator, severity
    end

    last_line = line
    local text_line = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, true)

    if not text_line or #text_line == 0 then
        return separator, severity
    end


    local len = #(text_line[1])
    if len <= 80 then
        local adjusted = 79 - len
        separator = (" "):rep(adjusted) .. separator
    end

    return separator, severity
end

vim_lsp_util_virtual_text_transform = virtual_text_override

--[[
textDocumentCallbacks = textDocumentCallbacks or vim.lsp.callbacks["textDocument/publishDiagnostics"]
vim.lsp.callbacks["textDocument/publishDiagnostics"] = function(err, method, params, client_id)
    if type(textDocumentCallbacks) ~= "function" then
        return
    end

    textDocumentCallbacks(err, method, params, client_id)
end
--]]

return {
    virtual_text_override = virtual_text_override
}
