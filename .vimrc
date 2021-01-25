" Begin plugin section
call plug#begin('~/.vim/plugged')

"Plug 'ajh17/vimcompletesme'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
"
Plug 'connorholyday/vim-snazzy'
Plug 'lifepillar/vim-solarized8'
Plug 'w0rp/ale'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'glench/vim-jinja2-syntax'
Plug 'vim-scripts/nginx.vim'
Plug 'saltstack/salt-vim'
Plug 'matt-deacalion/vim-systemd-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'posva/vim-vue'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'pest-parser/pest.vim'
"Plug 'janko-m/vim-test'
Plug 'xojs/vim-xo'
Plug 'elixir-lang/vim-elixir'
Plug 'briancollins/vim-jst'
Plug 'tpope/vim-cucumber'
Plug 'hashivim/vim-vagrant'
Plug 'pearofducks/ansible-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
"Plug 'autozimu/languageclient-neovim'

" Initialize plugin system
call plug#end()

colorscheme snazzy
syntax on
filetype on

set nocompatible
filetype plugin indent on

set splitbelow "Show the preview at bottom not at top
set number
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
set wrap
set linebreak
set ruler
set hlsearch
set laststatus=2
set wildmenu

set nocursorline
set synmaxcol=200


"let g:ale_hover_to_preview = 1
let g:ale_set_ballons = 1

" Color-codes from: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
let g:ale_sign_column_always = 1
let g:ale_sign_error = '█'
let g:ale_sign_warning = '█'
"highlight ALEErrorSign ctermfg=9 guifg=#700
"highlight ALEErrorLine ctermbg=52
"highlight ALEStyleError ctermbg=52
"highlight ALEWarningSign ctermfg=11 guifg=#840
"highlight ALEWarningLine ctermbg=94
highlight clear SignColumn

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled=1

let g:autofmt_autosave = 1

"let g:ale_linters = {'rust': ['rls', 'cargo', 'rustcu', 'clippy']}
"let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_linters = {'elixir': ['elixir-ls', 'credo']}
let g:ale_fixers = {'elixir': ['mix_format']}
let g:ale_completion_enabled = 1

let g:ale_elixir_elixir_ls_release = '/home/florian-breisch/github/elixir-ls/release'
let g:ale_elixir_credo_strict = 1

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['xo']

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elsif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
"  call neomake#configure#automake('w')
else
"  call neomake#configure#automake('nw', 1000)
endif

" << LSP >>

"let g:LanguageClient_autoStart = 1
"nnoremap <leader>lcs :LanguageClientStart<CR>

" if you want it to turn on automatically
" let g:LanguageClient_autoStart = 1

"let g:LanguageClient_serverCommands = {
"    \ 'python': ['pyls'],
""    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"    \ 'javascript': ['javascript-typescript-stdio'],
"    \ 'go': ['go-langserver'] }

"noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
"noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
"noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
"noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

nnoremap <silent> <C-F1> :ALEDocumentation<CR>
nnoremap <silent> <F1> :ALEHover<CR>
nnoremap <silent> <F12> :ALEGoToDefinition<CR>

nm <silent> <A-F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>

