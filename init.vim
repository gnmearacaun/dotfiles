" ================ Plugins ==================== {{{
"
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-sleuth')
  call packager#add('tpope/vim-vinegar')
  call packager#add('tpope/vim-endwise')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-sensible')
  "call packager#add('tpope/vim-projectionist')
  call packager#add('rickhowe/diffchar.vim')
  call packager#add('rickhowe/spotdiff.vim')
  call packager#add('easymotion/vim-easymotion')
  call packager#add('manasthakur/vim-commentor')
  call packager#add('AndrewRadev/splitjoin.vim')
  call packager#add('nelstrom/vim-visual-star-search')
  "call packager#add('phpactor/phpactor', { 'do': 'composer install' })
  call packager#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
  call packager#add('junegunn/fzf.vim')
  "call packager#add('kristijanhusak/vim-js-file-import', { 'do': 'npm install' })
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('w0rp/ale', { 'do': 'npm install -g prettier' })
  call packager#add('airblade/vim-gitgutter')
  "following doesn't work
  call packager#add('vim-scripts/autoscroll.vim')
  call packager#add('itchyny/lightline.vim')
  "call packager#add('Raimondi/delimitMate')
  call packager#add('FooSoft/vim-argwrap')
  "call packager#add('Shougo/neosnippet')
  call packager#add('neomake/neomake')
  call packager#add('posva/vim-vue')
  call packager#add('junegunn/gv.vim')
  call packager#add('vimwiki/vimwiki')
  call packager#add('mattn/calendar-vim')
  "call packager#add('vimwiki/vimwiki', { 'branch': 'dev' })
  "call packager#add('dyng/ctrlsf.vim')
  call packager#add('Shougo/defx.nvim')
  call packager#add('kristijanhusak/defx-git')
  call packager#add('kristijanhusak/defx-icons')
  "call packager#add('fatih/vim-go', { 'do': ':GoInstallBinaries' })
  call packager#add('editorconfig/editorconfig-vim')
  "call packager#add('prabirshrestha/async.vim')
  "call packager#add('janko-m/vim-test')
  "call packager#add('mattn/emmet-vim')
  "added 28/05/19
  "call packager#add('junegunn/limelight.vim')
  call packager#add('junegunn/goyo.vim')
  call packager#add('othree/html5.vim')
" Stuff from https://github.com/nickjj/dotfiles/blob/master/.vimrc
" Show git file changes in the gutter?
  call packager#add('tpope/vim-eunuch')
  call packager#add('elzr/vim-json')
  call packager#add('tpope/vim-markdown')
" Better display unwanted whitespace.
  call packager#add('ntpeters/vim-better-whitespace')
" Run a diff on 2 directories/
"  call packager#add('will133/vim-dirdiff')
" Automatically clear search highlights after you move your cursor.
  call packager#add('haya14busa/is.vim')
" Drastically improve insert mode performance in files with folds.
  call packager#add('Konfekt/FastFold')
  call packager#add('francoiscabrol/ranger.vim')
  "call packager#add('dhruvasagar/vim-zoom')
  call packager#add('iamcco/markdown-preview.nvim')
  "call packager#add('iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' })
  call packager#add('vim-pandoc/vim-pandoc')
  call packager#add('vim-pandoc/vim-pandoc-syntax')
  call packager#add('joshdick/onedark.vim')
  call packager#add('sheerun/vim-polyglot')
  call packager#add('chrisbra/vim-diff-enhanced')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! PackagerUpdate call PackagerInit() | call packager#update()
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

"}}}

" ================ Custom mappings ======================== {{{
nnoremap <C-g> :Rg<Cr>
let g:mapleader = "\<Space>"    " Leader key is Spacebar
"auto-scroll with F8!
:map <F8> <C-E>:sleep 3500m<CR><Esc>j<F8>
nnoremap <leader><CR> za|                " Toggle fold
nnoremap zo zR                  " Open all folds
nnoremap <A-Return> zMza        " Focus the current fold by closing all others
inoremap kj <Esc>|              " Escape from insert mode
inoremap jk <Esc>
inoremap jj <Esc>
inoremap kk <Esc>
nnoremap j gj|                   " Move linewise in normal mode
nnoremap k gk|
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" Stop having to press that shift button
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;
vnoremap  <leader>y  "+y        " Copy to clipboard
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
vnoremap <C-c> "+y
vmap <Leader>d "+d
nmap <Leader>d "+d
nnoremap x "_x
nnoremap Y y$                   " Yank to the end of the line
nnoremap <leader>p "+p          " Paste from clipboard
nnoremap <leader>P "+P
"paste line(s) at the bottom of the file
nnoremap <leader>e :mark '<cr>:$put<cr>`'
vnoremap <leader>p "+p
vnoremap <leader>P "+P
xnoremap p  "0p
inoremap <C-v> <Esc>"+p         " Paste from system clipboard in insert mode
vnoremap y y`]                  " Move to the end of yanked text after yanking
nnoremap p p`]                  " Move to the end of yanked text after pasting
vnoremap p p`]
nnoremap cn *``cgn              " Change next match in a repeatable manner
nnoremap cN *``cgN
vnoremap <expr> cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"
nnoremap <leader>a =ip
nnoremap <Leader>. viw"0p        " Replace current work with last yanked selection
nnoremap cp yap<S-}>p
xnoremap s :s//g<Left><Left>     " Quick substitute within a selected area
" highlight last inserted text
"To select the last changed text (or the text that was just pasted):
nnoremap gp `[v`]
"nnoremap gV `[v`]
" Select last paste. Except interferes with vimdiff!!
"nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
nmap <Leader>c gcc               " Toggle line commenting
xmap <Leader>c gc
nnoremap <silent><Leader>w :write<CR>          " Fast saving
vnoremap <silent><Leader>w <Esc>:write<CR>
nnoremap <silent><C-s> :<C-u>write<CR>
vnoremap <silent><C-s> :<C-u>write<CR>
cnoremap <silent><C-s> <C-u>write<CR>
imap <c-s> <C-o>:w<CR>
" save session
nnoremap <leader>s :mksession<CR>
"Just press q to quit and map Q to recording (shrugs)
nnoremap <silent> q :call CloseBuffer()<CR>
nnoremap <silent><Leader>q :call CloseBuffer()<CR>
nnoremap <silent><Leader>Q :call CloseBuffer(1)<CR>
nnoremap Q q
cmap W!! w !sudo tee % >/dev/null          " Save with sudo
" Start an external command with a single she-bang
nnoremap ! :!
nnoremap <leader>r :ArgWrap<CR>            " Wrap/Unwrap lines
"Remove all trailing whitespace by pressing F5
nnoremap <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
vnoremap mk :m-2<CR>gv=gv
vnoremap mj :m'>+<CR>gv=gv
noremap  mk :m-2<CR>
noremap  mj :m+<CR>
"map Q <Nop>
" From Niel Drew, author of 'Modern Vim'
tnoremap <Esc> <C-\><C-n>
if has ('nvim')
  tnoremap <Esc> <C-/><C-n>
  tnoremap <C-v><Esc> <Esc
endif

" }}}
" ================ Windows and Tabs ============== {{{

"nnoremap <C-p> :<C-u>FZF ~<CR>            "Fuzzy Finder
nnoremap <C-p> :<C-u>FZF<CR>
"nnoremap <silent> <leader>f :FZF ~<CR>
"nnoremap <silent> <leader>F :FZF<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>h :History<CR>
nnoremap <leader>l :Lines<cr>
" Search content in the current file and in files under the current directory
" conflicts with vimdiff command
" nmap <leader>g :Ag<cr>
nnoremap  [Window]   <Nop>              " Window prefix is mapped to 's'
nmap      s [Window]
nnoremap <a-;> :<C-u>tabnew<CR>         " s: Windows and buffers/tabs
nnoremap <Leader>o :<C-u>tabnew<CR>
nnoremap <silent> [Window]t  :tabnew<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> [Window]b  :b#<CR>
nnoremap <silent> [Window]c  :close<CR>
nnoremap <silent> [Window]x  :<C-u>call <SID>BufferEmpty()<CR>
nnoremap <silent> [Window]j  :tabprevious<CR>
nnoremap <silent> [Window]k  :tabnext<CR>
nnoremap <leader>j :<C-u>tabprevious<CR>
nnoremap <leader>k :<C-u>tabnext<CR>
" nnoremap <silent> <Tab> :<C-u>tabnext<CR>
nnoremap <silent> gn :<C-u>tabnext<CR>
nnoremap <silent> g0 :<C-u>tabfirst<CR>
nnoremap <silent> g$ :<C-u>tablast<CR>
" Toggle between last 2 buffers
 nnoremap <leader><tab> <C-^>
" Spliting screen
nnoremap <silent> [Window]v  :<C-u>split<CR>
nnoremap <silent> [Window]g  :<C-u>vsplit<CR>
nnoremap <silent> ss :split<CR><C-W>j
nnoremap <silent> vv :vsplit<CR><C-W>l
nnoremap <leader>6 :vsplit $MYVIMRC<cr>
nnoremap <leader>7 :source $MYVIMRC<cr>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" toggle gundo
"nnoremap <leader>u :GundoToggle<CR>
" Moving around window divisions
" wet g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide = '^\./$'
let g:netrw_hide = 1
"open selection in a new tab by default
"let g:netrw_browse_split = 1
 nmap <c-i>  <C-w>w
nmap <S-Tab>  <C-w>W
nnoremap <Leader>v <C-w>v
nnoremap <c-h> <C-w>h
nnoremap <tab> <C-w>j
nnoremap <c-u> <C-w>k
nnoremap <c-l> <C-w>l
"nnoremap <c-Space> <C-w>p
nnoremap <c-Space> <C-w>w
tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-l> <C-\><C-n><C-w>l
tnoremap <c-Space> <C-\><C-n><C-w>p
" Close all other buffers except current one
"nnoremap <Leader>db :silent w <BAR> :silent %bd <BAR> e#<CR>
" Window control
nnoremap <silent><C-w>z :vert resize<CR>:resize<CR>:normal! ze<CR>
nnoremap <C-x> <C-w>x
" Navigation in command line
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <C-w>
" Switch history search pairs, matching my bash shell
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>
cnoremap <Up>   <C-p>
cnoremap <Down> <C-n>
" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>
" Resize window with shift + and shift - or use for diffget/diffput in diff mode
nnoremap <expr> + &diff ? ':diffput<BAR>diffupdate<CR>' : '<c-w>5>'
nnoremap <expr> _ &diff ? ':diffget<BAR>diffupdate<CR>' : '<c-w>5<'
xnoremap <expr> + &diff ? ':diffput<BAR>diffupdate<CR>' : '+'
xnoremap <expr> _ &diff ? ':diffget<BAR>diffupdate<CR>' : '_'
nnoremap <expr> R &diff ? ':diffupdate<CR>' : 'R'
"another diff trick
set diffopt+=iwhite
set diffexpr=""
" fzf window
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }
"
"}}}
" ================ Search and Indentation ============== {{{

" Filesearching plugin
"nnoremap <Leader>y :call Search()<CR>
"nnoremap <Leader>F :call Search(1)<CR>
"
" Search
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
" Center highlighted search
nnoremap n nzz
nnoremap N Nzz
" Remove search highlight with // or ctrl-l
nnoremap <c-l> :noh<CR>
nnoremap <silent> // :nohlsearch<CR>
" Scrolling; cursor stays center-screen. Courtesy of https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")
nnoremap <Leader>n :call ToggleNumber()<CR>

" use tab for indenting in visual mode
vnoremap <tab> >gv|
"xnoremap <tab> >gv
vnoremap <s-tab> <gv
xnoremap <s-tab> <gv
nnoremap > >>_
nnoremap < <<_
" select blocks after indenting
xnoremap < <gv
xnoremap > >gv|
" Toggle editor visuals
nmap <silent> <Leader>ts :setlocal spell!<cr>
nmap <silent> <Leader>tn :setlocal nonumber!<CR>
nmap <silent> <Leader>tl :setlocal nolist!<CR>
nmap <silent> <Leader>th :nohlsearch<CR>
nmap <silent> <Leader>tw :setlocal wrap! breakindent!<CR>
set conceallevel=0
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set breakindent
set smartindent
"set colorcolumn=80
set nofoldenable
" All folds closed by default
"set foldlevel=0
"fold sections by markers rather than 'syntax' or indentation for example
set foldmethod=marker
" Stops 'o' from continuing comment section to next line
set formatoptions-=cro
filetype plugin indent on
" For a file-specific setting'
set modelines=1
" complete dict words with <c-n> or <c-p>
set complete+=k
set spelllang=en
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
vnoremap <leader>gh <esc>:'<,'> !pandoc -f markdown_github -w html5<CR>
nnoremap <leader>gh ggVG<esc>:'<,'>  !pandoc -f markdown_github -w html5<CR>
"

" expand snippets on tab if snippets exists, otherwise do autocompletion
"imap <expr><tab> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
"imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
"smap <expr><TAB> neosnippet#jumpable() ?
"\ "\<Plug>(neosnippet_jump)"
"\: "\<TAB>"

if has('unix')
    set dictionary+=/usr/share/dict/words
else
    set dictionary+=~/AppData/Local/nvim/words
endif

"}}}
" ================ Color and Statusline ======================== {{{
"
"I generally go for a semi-transparent background with a slideshow of images
"that said, these lines would normally preceed any 'silent! colorscheme $theme'
let g:rehash256 = 1
hi Comment ctermbg=NONE
hi Normal ctermbg=None
hi Conceal guibg=NONE
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi Folded ctermbg=black
hi clear SpellBad
hi SpellBad cterm=underline
set cursorline                        "highlight current line
hi CursorLine term=italic cterm=italic guibg=Grey30
nnoremap <leader>i :set cursorline! cursorcolumn!<cr>
let g:quantum_italics=1
"not needed with nvim packaging
set rtp+=~/.fzf
"set termguicolors
set background=dark
set title                             "change the terminal's title
"for the lightline info/status bar
set laststatus=2
set t_Co=256

if !has('gui_running')
  set t_Co=rxvt
endif
"from https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"let g:lightline = {
"  \     'active': {
"  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
"  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
"  \     }
"  \ }
"if (has("autocmd"))
"  augroup colorextend
"    autocmd!
"    " Make `Function`s bold in GUI mode
"    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
"    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
"    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
"  augroup END
"endif
"colorscheme onedark
"
" Limelight  doesn't seem to work on my term
"nmap <Leader>% <Plug>(Limelight)
"xmap <Leader>% <Plug>(Limelight)
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"turns off highighing of changes
"if &diff
"    highlight! link DiffText MatchParen
"endif
" Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" From https://github.com/nickjj/dotfiles/blob/master/.vimrc
" junegunn/limelight.vim
let g:limelight_conceal_ctermfg=244
" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'
  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()
" plasticboy/vim-markdown
autocmd FileType markdown let b:sleuth_automatic=0
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR
let g:vim_markdown_frontmatter=0
" iamcco/markdown-preview.nvim
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/briain/.local/lib/github-markdown-css-gh-pages/github-markdown.css'
" ntpeters/vim-better-whitespace
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1
" Konfekt/FastFold
let g:fastfold_savehook=0
let g:fastfold_fold_command_suffixes=[]
"}}}
" ================ Set and Wildignore ==================== {{{
set number                    "line numbers are good
" set relativenumber            "show numbers relative to current line
set history=700               "store lots of :cmdline history
set showcmd                   "show incomplete cmds down the bottom
set noshowmode                "slims down the statusline
set gdefault                  "set global flag for search and replace
set guicursor=a:blinkon800-blinkwait800-blinkoff800 "blinking cursor
set smartcase               "smart case search if there is uppercase
set ignorecase              "case insensitive search
set mouse=a                 "enable mouse usage
set showmatch               "highlight matching bracket
set nostartofline           "jump to first non-blank character
" Time in milliseconds to wait for a mapped sequence to complete
" see https://goo.gl/vHvyu8 for more info
set updatetime=1000
set timeoutlen=700 ttimeoutlen=0 "reduce command timeout for faster escape
set fileencoding=utf-8           "set utf-8 encoding on write
set wrap                         "enable word wrap
set linebreak                    "wrap lines at convenient points
"set listchars=tab:\ \ ,trail:·  "set trails for tabs and spaces
set list                         "enable listchars
set lazyredraw                   "do not redraw on registers and macros
set background=dark              "set background to dark
set hidden                       "hide buffers in background
set conceallevel=2 concealcursor=i    "neosnippets conceal marker
set splitright             "set up new vertical splits positions
set splitbelow             "set up new horizontal splits positions
set path+=**               "allow recursive search
set inccommand=nosplit     "show substitute changes immidiately in separate split
set fillchars+=vert:\│     "make vertical split separator full line
set pumheight=15           "maximum number of entries in autocomplete popup
set exrc                   "allow using local vimrc
set secure                 "forbid autocmd in local vimrc
set grepprg=rg\ --vimgrep  "use ripgrep for grepping
set tagcase=smart          "use smarcase for tags
set updatetime=500         "cursor hold timeout
set synmaxcol=300          "use syntax highlighting only for 300 columns
syntax on
set noswapfile             " turn off swap files
set nobackup
set nowritebackup
set scrolloff=4            " scroll when 4 lines from top or bottom
set sidescrolloff=15
set sidescroll=5
" keep undo history across sessions
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups    " store undo history here.
set undofile
set wildmenu
set wildmode=list:full       "completion"
set completeopt-=preview  "Disable preview window for autocompletion
set wildignore=*.o,*.obj,*~  "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*ds_store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" }}}
" ================ Auto commands ====================== {{{

augroup vimrc
  autocmd!
autocmd QuickFixCmdPost [^l]* cwindow       "Open quickfix window after grepping
autocmd BufWritePre * call StripTrailingWhitespaces() "Auto-remove trailing spaces
autocmd InsertEnter * set nocul  "Remove cursorline highlight
autocmd InsertLeave * set cul "Add cursorline highlight normal mode
"Refresh file when vim gets focus
autocmd FocusGained,BufEnter * checktime
"autocmd FileType html,css,javascript.jsx EmmetInstall
augroup END

augroup php
  autocmd!
  autocmd FileType php setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd FileType php nmap <buffer><silent><Leader>if :call phpactor#UseAdd()<CR>
  autocmd FileType php nmap <buffer><silent><Leader>ir :call phpactor#ContextMenu()<CR>
  autocmd FileType php vmap <buffer><silent><Leader>ie :<C-U>call phpactor#ExtractMethod()<CR>
  autocmd FileType php nmap <buffer><silent><C-]> :call phpactor#GotoDefinition()<CR>
augroup END
"
augroup javascript
  autocmd!
  autocmd FileType javascript nmap <buffer><silent><C-]> <Plug>(JsGotoDefinition)
  autocmd FileType javascript xmap <buffer><silent><C-]> <Plug>(JsGotoDefinition)
  autocmd FileType javascript nmap <buffer><silent><Leader>] <C-W>v<Plug>(JsGotoDefinition)
  autocmd FileType javascript xmap <buffer><silent><Leader>] <C-W>vgv<Plug>(JsGotoDefinition)
augroup END

augroup python
  autocmd!
  autocmd FileType python nmap <buffer><silent><Leader>if :ImportName<CR>
  autocmd FileType python setlocal textwidth=79
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Note, perl automatically sets foldmethod in the syntax file
" you could use a combo of the foldstart level above and
" automatic command for certain file types so that
" zm works without the high default level of 20
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
" }}}
" ================ Functions ======================== {{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! StatuslineFn(name, ...) abort
  try
    return call(a:name, a:000)
  catch
    return ''
  endtry
endfunction

function! StripTrailingWhitespaces()
  if &modifiable
    let l:l = line('.')
    let l:c = col('.')
    call execute('%s/\s\+$//e')
    call histdel('/', -1)
    call cursor(l:l, l:c)
  endif
endfunction

function! Search(...)
  let l:default = a:0 > 0 ? expand('<cword>') : ''
  let l:term = input('Search for: ', l:default)
  if l:term !=? ''
    let l:path = input('Path: ', '', 'file')
    execute 'CtrlSF "'.l:term.'" '.l:path
  endif
endfunction

function! CloseBuffer(...) abort
  if &buftype !=? ''
    return execute('q!')
  endif
  let l:windowCount = winnr('$')
  let l:totalBuffers = len(getbufinfo({ 'buflisted': 1 }))
  let l:noSplits = l:windowCount ==? 1
  let l:bang = a:0 > 0 ? '!' : ''
  if l:totalBuffers > 1 && l:noSplits
    let l:command = 'bp'
    if buflisted(bufnr('#'))
      let l:command .= '|bd'.l:bang.'#'
    endif
    return execute(l:command)
  endif
  return execute('q'.l:bang)
endfunction

"https://alvinalexander.com/rss.xml
"function! CustomDiffColors() abort
"  let l:added = '#A3BE8C'
"  let l:deleted = '#BF616A'
"  let l:normalBg = synIDattr(synIDtrans(hlID('Normal')), 'bg')
"  let l:bg = substitute(l:normalBg, '\(#..\)..\(..\)', '\13f\2', 'g')
"  exe 'hi DiffAdd guifg='.l:added.' guibg='.l:bg.' gui=NONE'
"  exe 'hi DiffChange guifg='.l:added.' guibg='.l:bg.' gui=NONE'
"  exe 'hi DiffText  guifg='.l:added.' guibg='.l:bg.' gui=reverse'
"  exe 'hi DiffDelete guifg='.l:deleted.' guibg='.l:normalBg.' gui=NONE'
"endfunction

function! s:BufferEmpty()
	let l:current = bufnr('%')
	if ! getbufvar(l:current, '&modified')
		enew
		silent! execute 'bdelete '.l:current
	endif
endfunction

if executable('zeal')
 	autocmd MyAutoCmd FileType ansible,go,php,css,less,html,markdown
		 \ nmap <silent><buffer> K :!zeal --query "<C-R>=split(&ft, '\.')[0]<CR>:<cword>"&<CR><CR>
 	autocmd MyAutoCmd FileType javascript,javascript.jsx,sql,ruby,conf,sh
 		\ nmap <silent><buffer> K :!zeal --query "<cword>"&<CR><CR>
endif
"
"these functions don't appear to be used
"
function! AleStatusline(type)
  try
    let l:count = ale#statusline#Count(bufnr(''))
    if a:type ==? 'error' && l:count['error']
      return printf(' %d E ', l:count['error'])
    endif

    if a:type ==? 'warning' && l:count['warning']
      let l:space = l:count['error'] ? ' ': ''
      return printf('%s %d W ', l:space, l:count['warning'])
    endif

    return ''
  catch
    return ''
  endtry
endfunction

function! GitFileStatus()
  if !exists('b:gitgutter')
    return ''
  endif
  let [l:added, l:modified, l:removed] = get(b:gitgutter, 'summary', [0, 0, 0])
  let l:result = l:added == 0 ? '' : ' +'.l:added
  let l:result .= l:modified == 0 ? '' : ' ~'.l:modified
  let l:result .= l:removed == 0 ? '' : ' -'.l:removed
  if l:result !=? ''
    return ' '.l:result
  endif
  return l:result
endfunction

" }}}
" ================ Plugins Setups ======================== {{{

let g:ctrlsf_auto_close = 0             "do not close search when file is opened
let g:ctrlsf_mapping = {'vsplit': 's'}  "mapping for opening search result in vertical split
let g:user_emmet_leader_key = '<c-e>'   "change trigger emmet key
let g:user_emmet_install_global = 0     "load emmet on demand
let g:neosnippet#disable_runtime_snippets = {'_' : 1}   "snippets setup
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets'] "snippets directory
let g:delimitmate_expand_cr = 1       "auto indent on enter
let g:ale_linters = {'javascript':['eslint']}   "lint js with eslint
let g:ale_fixers = {'javascript': ['prettier', 'eslint']} "fix eslint errors
let g:ale_javascript_prettier_options = '--print-width 100'  "set max width to 100 chars
let g:ale_sign_error = '✖'            "lint error sign
let g:ale_sign_warning = '⚠'          "lint warning sign
let g:jsx_ext_required = 1            "force jsx extension for jsx filetype
let g:javascript_plugin_jsdoc = 1     "enable syntax highlighting for js doc blocks


" }}}
" {{{ Vimwiki plugin settings and specific functions from patrickdavey: "
"let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]  "sync dropbox
"syntax can be default, markdown, media or mediawiki
"following two lines are broken
"call CustomDiffColors()           "use custom diff colors
" vim:foldenable:foldmethod=marker

function! OpenNoteWiki()
  call vimwiki#base#goto_index(2)
"  execute ':Calendar'
endfunction
nnoremap <leader>2 :call OpenNoteWiki()<cr>

function! OpenThisWiki()
  call vimwiki#base#goto_index(3)
endfunction
nnoremap <leader>3 :call OpenThisWiki()<cr>

function! OpenTechWiki()
  call vimwiki#base#goto_index(4)
endfunction
nnoremap <leader>4 :call OpenTechWiki()<cr>

let g:matchup_matchparen_status_offscreen = 0   "don't show closing match in statusline
let g:vimwiki_folding='expr' "this allows the folding to work for markdown
let g:vimwiki_list = [{
          \ 'path': '~/scripts/vimwiki',
          \ 'template_path': '~/scripts/vimwiki/templates/',
          \ 'nested_syntaxes': {
          \   'ruby': 'ruby',
          \   'elixir': 'elixir',
          \   'javascript': 'javascript',
          \   'bash': 'sh'
          \  },
          \ 'template_default': 'default',
          \ 'syntax': 'markdown',
          \ 'ext': '.md',
          \ 'path_html': '~/scripts/vimwiki/site_html/',
          \ 'custom_wiki2html': 'vimwiki_markdown',
          \ 'template_ext': '.tpl'
          \ },
          \ {
              \ 'path': '~/scripts/vimwiki/notewiki',
              \ 'template_path': '~/scripts/vimwiki/templates/',
              \ 'template_default': 'default',
              \ 'syntax': 'markdown',
              \ 'ext': '.md',
              \ 'path_html': '~/scripts/vimwiki/notewiki/site_html/',
              \ 'custom_wiki2html': 'vimwiki_markdown',
              \ 'template_ext': '.tpl'},
              \ {'path': '~/scripts/vimwiki/thiswiki'},
              \ {'path': '~/scripts/vimwiki/techwiki'}
              \]

autocmd FileType vimwiki set spell spelllang=en_gb
" }}}
" {{{ autocmd to open file at last position
" from Gary Bernhart - open file at last position
"
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif
" }}}
" {{{ function for marking extra whitespace (conditionally)

au! ColorScheme ExtraWhitespace ctermbg=red

fun! MarkExtraWhitespace(regex)
    " Only mark if the g:noMarkExtraWhitespace variable isn't set
    if exists('g:calendarWhitespace')
      highlight ExtraWhitespace ctermbg=None
    elseif exists('g:markdownWhitespace')
      highlight ExtraWhitespace ctermbg=LightCyan
    else
      highlight ExtraWhitespace ctermbg=red
    endif

    execute 'match ExtraWhitespace ' . a:regex
endfun

autocmd FileType vimwiki,markdown let g:markdownWhitespace=1
autocmd FileType calendar let g:calendarWhitespace=1
autocmd User Startified highlight ExtraWhitespace ctermbg=None

au BufEnter * call MarkExtraWhitespace("/\\s\\s$/")
au InsertEnter * call MarkExtraWhitespace("/\\s\\+\\%#\\@<!$/")
au InsertLeave * call MarkExtraWhitespace("/\\s\\+$/")

" {{{ from https://blog.mague.com/?p=602" Run multiple wikis "
"let g:vimwiki_list = [
"                        \{'path': '~/scripts/vimWiki/personal.wiki'},
"                        \{'path': '~/scripts/vimWiki/tech.wiki'},
"                        \{'path': '~/scripts/vimWiki/'}
"                \]
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map 9 :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map 5 :call ToggleCalendar()
" end vimwiki stuff from https://blog.mague.com/?p=602"


" }}}
