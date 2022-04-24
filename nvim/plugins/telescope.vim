nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>

nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>lua require('telescope').extensions.frecency.frecency()<cr>
nnoremap <leader>tr <cmd>Telescope lsp_references<cr>
