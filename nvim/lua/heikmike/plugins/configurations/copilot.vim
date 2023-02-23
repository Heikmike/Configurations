let g:copilot_filetypes = {
      \ '*': v:true,
      \ }

let g:copilot_no_tab_map = v:false

inoremap <expr> <C-CR> copilot#Accept()
