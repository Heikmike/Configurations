let g:tex_flavor = 'latex'
let g:coc_filetype_map = {'tex': 'latex'}
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

let g:vimtex_compiler_latexmk = {
    \ 'out_dir' : 'out',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '--shell-escape'
    \ ],
    \}

let g:vimtex_log_ignore = [
    \ 'Underfull',
    \ 'Overfull',
    \ 'specifier changed to',
    \ 'Token not allowed in a PDF string',
    \ ]
