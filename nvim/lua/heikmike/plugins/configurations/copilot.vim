let g:copilot_filetypes = {
      \ '*': v:true,
      \ }

let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <C-CR> copilot#Accept('\<CR>')
