nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>

nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>tr <cmd>lua require('telescope').extensions.frecency.frecency()<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gi <cmd>Telescope lsp_implementations<cr>
nnoremap ca <cmd>Telescope lsp_code_actions<cr>
