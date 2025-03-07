let g:python3_host_prog = expand('/export/scratch/ven_tinguyen/apps/anaconda3/py310/bin/python')
lua require("init_config")
let mapleader = " "
lua require("plugins")
lua require("custom")
lua require('nvim_comment').setup()


set nu
set ignorecase
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-x> :q<CR>
nnoremap <C-q> :q!<CR>

inoremap jk <Esc>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <C-a> ggVG

nnoremap <S-Tab> :bpre<cr>
nnoremap <Tab> :bnext<cr>

autocmd BufEnter * set indentexpr=



" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fh <cmd>Telescope command_history<cr>
"telescope coc

nnoremap <leader>ft <cmd>Telescope coc<cr>
nnoremap <A-j> <cmd>Term<cr>
" exit terminal map
tnoremap <Esc> <C-\><C-n>
tnoremap <c-x> <C-\><C-n>

"
" + toggle remap arrow keys to resize windows
"
nnoremap + :call ToggleResizeMode()<CR>

let s:KeyResizeEnabled = 0

function! ToggleResizeMode()
  if s:KeyResizeEnabled
    call NormalArrowKeys()
    let s:KeyResizeEnabled = 0
  else
    call ResizeArrowKeys()
    let s:KeyResizeEnabled = 1
  endif
endfunction

function! NormalArrowKeys()
  " unmap arrow keys
  echo 'normal arrow keys'
  nunmap <Up>
  nunmap <Down>
  nunmap <Left>
  nunmap <Right>
endfunction

function! ResizeArrowKeys()
  " Remap arrow keys to resize window
  echo 'Resize window with arrow keys'
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize -2<CR>
  nnoremap <Right> :vertical resize +2<CR>
endfunction

"load theme
" vim.cmd[[colorscheme tokyonight]]
colorscheme tokyonight



nnoremap <silent> <Leader><Leader> :source ~/.config/nvim/init.vim<cr>


" split term
set splitright
set splitbelow
