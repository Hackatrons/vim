-- disable automatic comment continuation
local cc_group = vim.api.nvim_create_augroup("CommentContinuation", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    group = cc_group,
    command = "setlocal formatoptions-=ro",
})

-- highlight selected text on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            timeout = 300,
        })
    end,
    group = highlight_group,
    pattern = "*",
})

-- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local function toSnakeCase(str)
            return string.gsub(str, "%s*[- ]%s*", "_")
        end

        if client.name == "omnisharp" then
            local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
            for i, v in ipairs(tokenModifiers) do
                tokenModifiers[i] = toSnakeCase(v)
            end
            local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
            for i, v in ipairs(tokenTypes) do
                tokenTypes[i] = toSnakeCase(v)
            end
        end
    end,
})

-- important to use linux line endings when editing cron files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.cron",
  callback = function()
    vim.bo.fileformat = "unix"
  end,
})
