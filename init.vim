let mapleader = " "
let maplocalleader = ","
syntax on
syntax enable
set number
set relativenumber
set t_Co=256
set wrap
set cursorline
set wildmenu
set clipboard^=unnamed,unnamedplus

" ===
" === search config and highlight config
" ===
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
map <LEADER><CR> :nohlsearch<CR>

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set mouse=a
set encoding=utf-8
let &t_ut=''

" ===
" === tab settings
" ===
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99

" ===
" === change cursor type at diffirent vim state
" ===
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" KeyBindings
" ===
" === exchange and adapt fast arrow keys in vim
" === 
" noremap j k
" noremap k j
noremap K 5k
noremap J 5j
noremap H 7h
noremap L 7l

" ===
" === W for write, Q for quit, R for refresh
" ===
map W :w<CR>
map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>
" Open the vimrc file anytime
noremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap Y y$
" Copy to system clipboard
vnoremap Y "+y
" Delete find pair
nnoremap dy d%
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
noremap <c-a> ggVG
noremap <c-A> ggVG:s/

" ===
" === z + h, j, k, l for split and v-split windows, space + h, j, k, l for change focus windows, arrow keys for resize split size; zv for change to vertical from level, and zl do this opposite  
" ===
map zL :set splitright<CR>:vsplit<CR>
map zH :set nosplitright<CR>:vsplit<CR>
map zK :set nosplitbelow<CR>:split<CR>
map zJ :set splitbelow<CR>:split<CR>
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
" map <LEADER>q <C-w>c
map <down> :res +5<CR>
map <up> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
map zU <C-w>t<C-w>H
map zD <C-w>t<C-w>K

" ===
" === tab shortcuts
" ===
map te :tabe<CR>
map tp :-tabnext<CR>
map tn :+tabnext<CR>
map tc :tabc<CR>

" ===
" === plugins shortcut keys
" ===
map zu :UltiSnipsEdit<CR>
map zp :PlugInstall<CR>

" ===
" === add empty line above or below
" ===
"map bb o<ESC>
"map bu O<ESC>
"map bbb o<ESC>o
"map buu O<ESC>O

" ===
" === set theme shortcuts
" ===
map thh :colorscheme deus<CR>
map thj :colorscheme gruvbox<CR>
map thk :colorscheme onehalfdark<CR>
map thl :colorscheme snazzy<CR>
map th; :colorscheme onehalflight<CR>

"map bc I"<ESC>
"map bs 0x<ESC>

" Compile function
noremap <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	" elseif &filetype == 'cs'
	" 	set splitbelow
	" 	silent! exec "!mcs %"
	" 	:sp
	" 	:res -5
	" 	:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'vimwiki'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	" elseif &filetype == 'go'
	" 	set splitbelow
	" 	:sp
	" 	:term go run .
  endif
endfunc



" ===
" === vim-plugin
" ===
call plug#begin('~/.config/nvim/plugged')

" Plug 'preservim/nerdtree'	
" Plug 'preservim/nerdtree' |
"             \ Plug 'Xuyuanp/nerdtree-git-plugin'

" theme plugins
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'connorholyday/vim-snazzy'
Plug 'theniceboy/nvim-deus'
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'


" latex and text files plugins
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" file navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }


" edit shortcuts and code shortcuts
" code information and jump between relations
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' "cs01 to change 0 surround to 1
Plug 'gcmt/wildfire.vim'  "enter to select surround text
Plug 'junegunn/vim-after-object' "da= to delete what's after =
" " register paste board 
Plug 'junegunn/vim-peekaboo'

call plug#end()

" ===
" === coc.vim
" ===
" TextEdit might fail if hidden is not set.
set hidden
set updatetime=100
set shortmess+=c
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-actions',
	\ 'coc-diagnostic',
	\ 'coc-eslint',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-explorer',
	\ 'coc-import-cost',
	\ 'coc-java',
	\ 'coc-jest',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-omnisharp',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-yaml',
	\ 'coc-yank',
	\ 'coc-sh',
	\ 'coc-marketplace']

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisibe() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>H :call Show_documentation()<CR>


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" code format and action for the selection or buffer
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-l> coc#refresh()

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" paste board and selection
nnoremap <silent> <leader>y :<C-u>CocList -A --normal yank<cr>

nmap tt :CocCommand explorer<CR>

" coc-translator
nmap <leader>th <Plug>(coc-translator-p)
" NOTE: do NOT use `nore` mappings
" popup
nmap <Leader>th <Plug>(coc-translator-p)
vmap <Leader>th <Plug>(coc-translator-pv)
" echo
nmap <Leader>eh <Plug>(coc-translator-e)
vmap <Leader>eh <Plug>(coc-translator-ev)
" replace
nmap <Leader>rh <Plug>(coc-translator-r)
vmap <Leader>rh <Plug>(coc-translator-rv)
nmap <leader>rn <Plug>(coc-rename)


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <c-k>  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <c-j>  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" show current tasks
noremap <silent> <leader>ts :CocList tasks<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'Zicong Xie'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" ===
" === FZF
" ===
nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
noremap <C-t> :BTags<CR>
noremap <silent> <C-l> :Lines<CR>
" noremap <silent> <C-w> :Buffers<CR>
" noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_bufers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root', 'class']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0


" ===
" === NERDTree
" ===
map <leader>tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ==
" == vimtex
" ==
let g:tex_flavor='latexmk'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ==
" == UltiSnips
" ==
let g:tex_flavor = "latex"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 0


"  Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'k'
let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'

" ===
" === tabular
" ===
vmap ga :Tabularize /

" ===
" === tcomment_vim
" ===
" nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:ython_slow_sync = 0


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === set vim theme
" ===
let g:SnazzyTransparent = 1
color snazzy
colorscheme deus
let g:lightline = { 'colorscheme': 'onehalfdark' }
" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
" Can be enabled or disabled
" adding to vim-startify screen
let g:webdevicons_enable_startify = 1


" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 1

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'Chromium'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown', 'wiki']
