
textDocumentCallbacks = textDocumentCallbacks or vim.lsp.callbacks["textDocument/publishDiagnostics"]

vim.lsp.callbacks["textDocument/publishDiagnostics"] = function(err, method, params, client_id)
    if type(textDocumentCallbacks) == "function" then
        textDocumentCallbacks(err, method, params, client_id)
    end

    print(
        err, "--",
        method, "--",
        params, "--",
        client_id,

        vim.inspect(err), "--",
        vim.inspect(method), "--",
        vim.inspect(params), "--",
        vim.inspect(client_id))
end
