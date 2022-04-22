let NERDTreeShowHidden=1
let NERDTreeWinSize=50
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeCascadeSingleChildDir=0
let NERDTreeMapActivateNode='l'

let g:NERDTreeIgnore = ['^node_modules$']

" toggle file explorer
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <leader>b :NERDTreeFind<CR>
