"        _      _     _            ___   ___   ___               _                              __ _
"   __ _| | ___(_)___| |_ ___ _ __( _ ) ( _ ) ( _ )   _ ____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
"  / _` | |/ _ \ / __| __/ _ \ '__/ _ \ / _ \ / _ \  | '_ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | (_| | |  __/ \__ \ ||  __/ | | (_) | (_) | (_) | | | | \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
"  \__,_|_|\___|_|___/\__\___|_|  \___/ \___/ \___/  |_| |_|\_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                                                                    |___/

" --- Plugins ---
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'frazrepo/vim-rainbow'
Plug 'Gavinok/vim-troff'
Plug 'xarthurx/taskwarrior.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'vimwiki/vimwiki'
Plug 'Shougo/unite.vim'
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'NLKNguyen/papercolor-theme'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc-vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jiangmiao/auto-pairs'
call plug#end()
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'


" --- Ctrlpvim options ---
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(wav|pdf|exe|so|dll|flac
  \ |png|eps|mid|gp5|gp4|gp3|gp|tg
  \ |mp3|reapeaks|mp3)$',
  \ }


" --- Function for toggling coc.nvim ---
nnoremap <M-1> :call CocToggle()<cr>

let g:coc = 0

function! CocToggle()
    if g:coc
        CocEnable
        let g:coc = 0
    else
        CocDisable
        let g:coc = 1
    endif
endfunction


" --- Toggle between light and dark theme ---
nnoremap <M-2> :call ThemeToggle()<cr>

let g:theme = 0

function! ThemeToggle()
    if g:theme
        set background=dark
        let g:theme = 0
    else
        set background=light
        let g:theme = 1
    endif
endfunction


" --- nerdtree ---
map <M-,> :NERDTreeToggle<CR>
nnoremap <C-M-??> :call NERDTreeToggleInCurDir()<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
endif
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
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


" --- Goyo ---
map <C-q> :Goyo \| set linebreak<CR>


" --- AUTOCOMPILE/RESTART ---
autocmd BufWritePost ~/.local/source/dwmblocks-async/config.h !cd ~/.local/source/dwmblocks-async/; doas make install && { killall -q dwmblocks;setsid dwmblocks & }
autocmd BufWritePost ~/.local/source/dwm/config.h !cd ~/.local/source/dwm/; doas make install
autocmd BufWritePost ~/.local/source/dmenu/config.h !cd ~/.local/source/dmenu/; doas make install
autocmd BufWritePost ~/.config/dunst/dunstrc ! {killall -q dunst;setsid dunst &}
" autocmd BufWritePost ~/.config/sxhkd/sxhkdrc ! {killall -q sxhkd;setsid sxhkd &}

" --- COMPILING DOCUMENTS ---

" Compile Latex and Groff Documents (latexmk,arara,groff,pic,ps2pdf,...)
" Enter file directory (needed for compiling)
autocmd Filetype tex autocmd VimEnter * :cd `dirname %`
autocmd Filetype groff autocmd VimEnter * :cd `dirname %`
map <C-r> :cd `dirname %`


" --- LATEX ---
"compile using vimtex
autocmd Filetype tex map <M-e> :VimtexCompile
"compile latex document
autocmd Filetype tex map <M-q> :! arara % <CR>
"open latex document
autocmd Filetype tex map <M-w> :! zathura $(echo % \| sed 's/tex$/pdf/') & disown <CR><CR>


" --- GROFF ---
"open groff document
autocmd Filetype groff map <M-w> :! zathura $(echo % \| sed 's/ms$/pdf/') & disown <CR><CR>
"compule groff document
autocmd Filetype groff map <M-q> :! groff -ms % -T pdf > $(echo % \| sed 's/ms$/pdf/') <CR><CR>
"compile groff document (with images)
autocmd FIletype groff map <M-e> :! groff -ms % -Tps > $(echo % \| sed 's/ms$/ps/'); time ps2pdf $(echo % \| sed 's/ms$/ps/'); rm $(echo % \| sed 's/ms$/ps/') <CR>
"compile groff document with pic
autocmd Filetype groff map <M-a> :! pic % \| groff -ms -Tpdf > $(echo % \| sed 's/ms$/pdf/') <CR>
"compile groff document with pic (with images)
autocmd Filetype groff map <M-s> :! pic % \|  groff -ms -Tps > $(echo % \| sed 's/ms$/ps/'); time ps2pdf $(echo % \| sed 's/ms$/ps/'); rm $(echo % \| sed 's/ms$/ps/') <CR>


" --- Latex & Groff Examples ---
" groff
autocmd Filetype groff map <M-i> :r $HOME/.config/nvim/examples/groff-centered-image
autocmd Filetype groff map <M-o> :r $HOME/.config/nvim/examples/groff-2-centered-images
" latex
autocmd Filetype tex map <M-i> :r $HOME/.config/nvim/examples/centered-image
autocmd Filetype tex map <M-o> :r $HOME/.config/nvim/examples/2-centered-images
autocmd Filetype tex map <M-u> :r $HOME/.config/nvim/examples/3-vertical-images
autocmd Filetype tex map <M-S-u> :r $HOME/.config/nvim/examples/3x3-vertical-images-grid
autocmd Filetype tex map <M-l> :r $HOME/.config/nvim/examples/itemize
autocmd Filetype tex map <M-S-l> :r $HOME/.config/nvim/examples/item
autocmd Filetype tex map <M-v> :r $HOME/.config/nvim/examples/vspace
autocmd Filetype tex map <M-g> :r $HOME/.config/nvim/examples/gobble
autocmd Filetype tex map <M-t> :r $HOME/.config/nvim/examples/title
autocmd Filetype tex map <M-p> :r $HOME/.config/nvim/examples/phantom


" --- Load Templates ---
au BufNewFile * silent! 0r /home/aleister/.config/nvim/templates/%:e.tpl
filetype plugin indent on


" --- Options ---
syntax enable
set title
set clipboard+=unnamedplus
set number relativenumber
set splitbelow splitright
set spelllang=es
set hidden
set ttimeoutlen=0
set ic
set ignorecase
set smartcase
set pastetoggle=<F3>
set mouse=a
set noshowmode
set termguicolors
set clipboard+=unnamedplus
set t_Co=256
set encoding=utf-8
set wildmode=longest,list,full


" --- Colorshceme ---
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor


" --- File syntax ---
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex<CR>
	let g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex


" --- Lightline Colorscheme ---
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


" --- Vimlatex Options ---
let g:vimtex_compiler_method='latexmk'
let g:vimtex_fold_manual = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'


" --- Define groff Filetype ---
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff


" --- Groff auto accents ---
autocmd Filetype groff inoremap ??  \['a]
autocmd Filetype groff inoremap ??  \['A]
autocmd Filetype groff inoremap ??  \['e]
autocmd Filetype groff inoremap ??  \['E]
autocmd Filetype groff inoremap ??  \['i]
autocmd Filetype groff inoremap ??  \['I]
autocmd Filetype groff inoremap ??  \['o]
autocmd Filetype groff inoremap ??  \['u]
autocmd Filetype groff inoremap ??  \['U]
autocmd Filetype groff inoremap ??  \[~n]
autocmd Filetype groff inoremap ??  \[~N]
autocmd Filetype groff inoremap ??  \[,c]
autocmd Filetype groff inoremap ??  \[,C]
autocmd Filetype groff inoremap ??  \[r!]
autocmd Filetype groff inoremap ??  \[ct]
autocmd Filetype groff inoremap ??  \[`O]
autocmd Filetype groff inoremap ??  \[Po]
autocmd Filetype groff inoremap ??  \['O]
autocmd Filetype groff inoremap ??  \[Cs]
autocmd Filetype groff inoremap ??  \[^]O
autocmd Filetype groff inoremap ??  \[Ye]
autocmd Filetype groff inoremap ??  \[~O]
autocmd Filetype groff inoremap ??  \[bb]
autocmd Filetype groff inoremap ??  \[:O]
autocmd Filetype groff inoremap ??  \[sc]
autocmd Filetype groff inoremap ??  \[mu]
autocmd Filetype groff inoremap ??  \[ad]
autocmd Filetype groff inoremap ??  \[/O]
autocmd Filetype groff inoremap ??  \[co]
autocmd Filetype groff inoremap ??  \[`U]
autocmd Filetype groff inoremap ??  \[Of]
autocmd Filetype groff inoremap ??  \['U]
autocmd Filetype groff inoremap ??  \[Fo]
autocmd Filetype groff inoremap ??  \[^U]
autocmd Filetype groff inoremap ??  \[no]
autocmd Filetype groff inoremap ??  \[:U]
autocmd Filetype groff inoremap ??  \[rg]
autocmd Filetype groff inoremap ??  \['Y]
autocmd Filetype groff inoremap ??  \[a-]
autocmd Filetype groff inoremap ??  \[TP]
autocmd Filetype groff inoremap ??  \[de]
autocmd Filetype groff inoremap ??  \[ss]
autocmd Filetype groff inoremap ??  \[+-]
autocmd Filetype groff inoremap ??  \[`a]
autocmd Filetype groff inoremap ??  \[S2]
autocmd Filetype groff inoremap ??  \[S3]
autocmd Filetype groff inoremap ??  \[^a]
autocmd Filetype groff inoremap ??  \[aa]
autocmd Filetype groff inoremap ??  \[~a]
autocmd Filetype groff inoremap ??  \[mc]
autocmd Filetype groff inoremap ??  \[:a]
autocmd Filetype groff inoremap ??  \[ps]
autocmd Filetype groff inoremap ??  \[oa]
autocmd Filetype groff inoremap ??  \[pc]
autocmd Filetype groff inoremap ??  \[ae]
autocmd Filetype groff inoremap ??  \[ac]
autocmd Filetype groff inoremap ??  \[S1]
autocmd Filetype groff inoremap ??  \[`e]
autocmd Filetype groff inoremap ??  \[Om]
autocmd Filetype groff inoremap ??  \[Fc]
autocmd Filetype groff inoremap ??  \[^e]
autocmd Filetype groff inoremap ??  \[14]
autocmd Filetype groff inoremap ??  \[:e]
autocmd Filetype groff inoremap ??  \[12]
autocmd Filetype groff inoremap ??  \[`i]
autocmd Filetype groff inoremap ??  \[34]
autocmd Filetype groff inoremap ??  \[r?]
autocmd Filetype groff inoremap ??  \[^i]
autocmd Filetype groff inoremap ??  \[`A]
autocmd Filetype groff inoremap ??  \[:i]
autocmd Filetype groff inoremap ??  \[Sd]
autocmd Filetype groff inoremap ??  \[^A]
autocmd Filetype groff inoremap ??  \[~A]
autocmd Filetype groff inoremap ??  \[`o]
autocmd Filetype groff inoremap ??  \[:A]
autocmd Filetype groff inoremap ??  \[oA]
autocmd Filetype groff inoremap ??  \[^o]
autocmd Filetype groff inoremap ??  \[AE]
autocmd Filetype groff inoremap ??  \[~o]
autocmd Filetype groff inoremap ??  \[:o]
autocmd Filetype groff inoremap ??  \[`E]
autocmd Filetype groff inoremap ??  \[di]
autocmd Filetype groff inoremap ??  \[/o]
autocmd Filetype groff inoremap ??  \[^E]
autocmd Filetype groff inoremap ??  \[`u]
autocmd Filetype groff inoremap ??  \[:E]
autocmd Filetype groff inoremap ??  \[`I]
autocmd Filetype groff inoremap ??  \[^u]
autocmd Filetype groff inoremap ??  \[:u]
autocmd Filetype groff inoremap ??  \[^I]
autocmd Filetype groff inoremap ??  \['y]
autocmd Filetype groff inoremap ??  \[:I]
autocmd Filetype groff inoremap ??  \[Tp]
autocmd Filetype groff inoremap ??  \[-D]
autocmd Filetype groff inoremap ??  \[:y]
