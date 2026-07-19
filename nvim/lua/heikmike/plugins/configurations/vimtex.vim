" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_quickfix_mode = 0

let g:vimtex_compiler_latexmk = {
    \ 'aux_dir' : 'aux',
    \ 'out_dir' : 'out',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : '/usr/bin/latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \ ],
    \}


let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdfdvi'           : '-pdfdvi',
    \ 'pdfps'            : '-pdfps',
    \ 'pdflatex'         : '-pdf',
    \ 'luatex'           : '-lualatex',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}


let maplocalleader = " "
