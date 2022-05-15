let NERDTreeShowHidden=1
let NERDTreeWinSize=60
let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeCascadeSingleChildDir=0
let NERDTreeMapActivateNode='l'

let g:NERDTreeIgnore = ['^node_modules$', '^.git$', '^vendor$']

function! NERDTreeToggleInCurDir()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

nnoremap <silent> <C-b> :call NERDTreeToggleInCurDir()<cr>
