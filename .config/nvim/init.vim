if &compatible
  set nocompatible
endif

let s:dein_path = expand('~/.local/share/vim/repos/github.com/Shougo/dein.vim')
let s:plugin_path = expand('~/.local/share/vim')

"set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIMRUNTIME
set runtimepath+=~/.local/share/vim/repos/github.com/Shougo/dein.vim

if dein#load_state(s:plugin_path)
  call dein#begin(s:plugin_path)

  call dein#add(s:dein_path)
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('cohama/lexima.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('sheerun/vim-polyglot')

  call dein#add('w0ng/vim-hybrid')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('nvim')
  " 冗長なので後で書き直す
  set undodir=$XDG_CACHE_HOME/nvim/undo
  set directory=$XDG_CACHE_HOME/nvim/swap
  set backupdir=$XDG_CACHE_HOME/nvim/backup
  set viminfo+=n$XDG_CACHE_HOME/nvim/viminfo
else
  set undodir=$XDG_CACHE_HOME/vim/undo
  set directory=$XDG_CACHE_HOME/vim/swap
  set backupdir=$XDG_CACHE_HOME/vim/backup
  set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
endif

let g:use_xhtml = 1
let g:html_use_css = 1
let g:html_no_pre = 1

set bs=indent,eol,start
set title
set nobackup
set hidden
set background=dark
" set termguicolors
colorscheme hybrid
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline
set encoding=utf-8
set nofoldenable
set fileformat=unix
set fileformats=unix,dos,mac
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set modeline
set modelines=5
nnoremap <Space>w :<C-u>write<CR>
nnoremap j gj
xnoremap j gj
nnoremap k gk
xnoremap k gk
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>
set hlsearch
set ignorecase
set incsearch
set wildmenu
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
set laststatus=2
set noshowmode
set number
set list
set listchars=tab:>\ ,trail:~,nbsp:%,extends:>,precedes:<

highlight SpecialKey term=underline ctermfg=darkcyan guifg=darkcyan
highlight IdeographicSpace term=underline ctermbg=LightCyan guibg=LightCyan
autocmd VimEnter,WinEnter * match IdeographicSpace /　/
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" [start syntastic]
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html', 'less'] }
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" [end syntastic]

" [start deoplete]
let g:deoplete#enable_at_startup = 1
" [end deoplete]

" [start denite]
nnoremap <silent> <C-n> :<C-u>Denite file:new file<CR>
nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR>
nnoremap <silent> <C-z> :<C-u>Denite file_mru<CR>
nnoremap <silent> <C-b> :<C-u>Denite buffer<CR>
nnoremap <silent> / :<C-u>Denite -buffer-name=search -auto-resize line<CR>

call denite#custom#map('insert', '<C-r>',
      \ '<denite:toggle_matchers:matcher_substring>', 'noremap')
call denite#custom#map('insert', '<C-s>',
      \ '<denite:toggle_sorters:sorter_reverse>', 'noremap')
call denite#custom#map('insert', "<C-j>",
      \ '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>',
      \ '<denite:move_to_previous_line>', 'noremap')

call denite#custom#var('grep', 'command', ['pt'])
call denite#custom#var('grep', 'default_opts',
      \ ['--nogroup', '--nocolor', '--smart-case'])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#option('default', {
      \ 'auto_accel': v:true,
      \ 'direction': 'dynamictop',
      \ 'prompt': '>',
      \ 'source_names': 'short',
      \ })
" [end denite]
