" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_quickfix_mode = 0

let g:vimtex_compiler_latexmk = {
    \ 'aux_dir' : 'aux',
    \ 'out_dir' : 'out',
    \}

let maplocalleader = " "
