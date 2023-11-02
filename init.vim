" plug list
call plug#begin()
  Plug 'preservim/nerdtree'
  "Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  Plug 'maralla/completor.vim'
  Plug 'jceb/vim-orgmode'
""""""""" theme
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'ajgrf/parchment'
  Plug 'zefei/cake16'
  Plug 'romainl/flattened'
  Plug 'kyoz/purify', { 'rtp': 'vim' }
  Plug 'itchyny/lightline.vim'
  Plug 'preservim/vim-markdown'
  Plug 'mhinz/vim-startify'
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
call plug#end()

" vim set
set number
syntax enable
set t_Co=256

" theme
colorscheme dracula
"colorscheme gruvbox

"
"

set noshowmode
set splitbelow
set clipboard=unnamed
"autocmd Filetype md setlocal tabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
"set autoindent

"""keybingds""""""""""""""" 
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap U <C-r>

imap jk <Esc>
nmap <leader>d :find ~/PycharmProjects/dotfile/init.vim<CR>
" leader key is \

""" Startify""""""""""""""""

command Wel Startify
nmap WE :Startify<CR>


""" markdown"""
autocmd FileType markdown normal zR
"let g:vim_markdown_override_foldtext = 0
"let g:vim_markdown_folding_style_pythonic = 1

""" plug config""""""""""""""""""""""""""""
"tree
"autocmd VimEnter * NERDTree
"spec file open tree
" 这里有问题，设置的应该是打开 spec file 才会tree，现在设置了后 open
" 的首页也会打开 tree 从而和 欢迎页冲突，但是先不准备花时间看了
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" 
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']

" completor
let g:completor_python_binary = "/Users/rubik_w/.pyenv/versions/2.7.18/bin/python"
"todo check -ale check

"leaderF
let g:Lf_ShortcutF = '<C-P>'


" startify
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
let g:startify_custom_header =
      \ startify#pad(split(system('figlet -w 100 VIM2020'), '\n'))


" lightline
let g:lightline = {
      \ 'active': {
      \   'right': [['clock'], ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
      \  },
      \  'component': {
      \    'clock': '%{strftime("%H:%M")}'
      \  },
      \ }

""""""""""" other


