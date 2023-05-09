-- LSP CONFIG
-------------

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero").preset("recommended")
--[[ 
local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = { "utf-16" }
    require("lspconfig").clangd.setup({ capabilities = capabilities })
-]]

-- Configure lua language server for neovim (fix global variable warnings)
lsp.nvim_workspace()

-- On attach, if there's an LSP to use, use it, otherwise vim defaults
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>")
	vim.keymap.set("n", "<leader>fd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "<leader>k", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "<leader>]", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "<leader>[", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
--[[local notify = vim.notify
notify = function(msg, ...)
    if
        msg:match("warning: multiple different client offset_encodings detected for buffer, this is not supported yet")
        then
            return
        end

        notify(msg, ...)
        ends
        -]]
